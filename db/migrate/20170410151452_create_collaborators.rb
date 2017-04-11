class CreateCollaborators < ActiveRecord::Migration[5.0]
  def change
    create_table :collaborators do |t|
      t.references :wiki
      t.references :user
    end
    add_index :collaborators, :id, unique: true
  end
end
