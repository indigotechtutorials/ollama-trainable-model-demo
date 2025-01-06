class AddPromptToEmbeddings < ActiveRecord::Migration[8.0]
  def change
    add_column :embeddings, :prompt, :text
  end
end
