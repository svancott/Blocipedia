class ChangeWikiDefault < ActiveRecord::Migration[5.0]
  def change
    change_column_default :wikis, :private, false
  end
end
