class ChatsController < ApplicationController
  def create
    client = Ollama.new(
      credentials: { address: 'http://localhost:11434' },
      options: { server_sent_events: true }
    )

    embeddings_result = client.embeddings(
      { model: 'llama3.2',
        prompt: params[:prompt] }
    )
    
    vector = embeddings_result[0]["embedding"]

    neighbors = Embedding.nearest_neighbors(:embedding, vector, distance: "euclidean").first(5)
    context = neighbors.pluck(:prompt).join(", ")

    prompt = "prompt: #{params[:prompt]} context: #{context}"
    @chat_result = client.generate(
      { model: 'llama3.2',
        prompt: prompt,
        stream: false }
    )
  end
end