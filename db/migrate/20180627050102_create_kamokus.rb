class CreateKamokus < ActiveRecord::Migration[5.1]
  def change
    create_table :kamokus do |t|
      t.string :name
      t.string :regexp
      t.float :borderline
      t.timestamps
    end
  end
end
