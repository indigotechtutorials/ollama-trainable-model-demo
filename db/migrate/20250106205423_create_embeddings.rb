class CreateEmbeddings < ActiveRecord::Migration[8.0]
  def change
    create_table :embeddings do |t|
      t.timestamps
    end
  end
end
