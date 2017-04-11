class CreateWikisCollaborators < ActiveRecord::Migration[5.0]
  def change
    create_table :wikis_collaborators do |t|
      t.integer :wiki_id
      t.integer :collaborator_id
      t.timestamps
    end
    add_index :wikis_collaborators, :id, unique: true
    add_index :wikis_collaborators, :wiki_id
    add_index :wikis_collaborators, :collaborator_id
  end
end
