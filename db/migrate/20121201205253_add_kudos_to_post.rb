class AddKudosToPost < ActiveRecord::Migration
  def change
  add_column :posts, :kudos, :integer, default:0

  end
end
 
