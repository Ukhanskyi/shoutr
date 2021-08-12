class RemoveBodyFromShouts < ActiveRecord::Migration[6.1]
  def change
    remove_column :shouts, :body, :string
  end
end
