class EmbeddingsController < ApplicationController
  def create
    client = Ollama.new(
      credentials: { address: 'http://localhost:11434' },
      options: { server_sent_events: true }
    )

    result = client.embeddings(
      { model: 'llama3.2',
        prompt: params[:prompt] }
    )
    
    @embedding = Embedding.create(embedding: result[0]["embedding"], prompt: params[:prompt])

    if @embedding.save
      @text = "Your model was updated with the info :)"
    else
      @text = @embedding.errors.full_messages.join(", ")
    end
  end
end