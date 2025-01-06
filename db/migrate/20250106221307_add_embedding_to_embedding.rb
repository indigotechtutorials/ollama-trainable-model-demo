class AddEmbeddingToEmbedding < ActiveRecord::Migration[8.0]
  def change
    add_column :embeddings, :embedding, :vector, limit: 3072 # dimensions
  end
end
