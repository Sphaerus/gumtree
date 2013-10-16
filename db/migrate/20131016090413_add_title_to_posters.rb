class AddTitleToPosters < ActiveRecord::Migration
  def change
    add_column :posters, :title, :string
  end
end
