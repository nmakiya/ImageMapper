class RemoveImageFromUsers < ActiveRecord::Migration
  def change
    remove_attachment :users, :image 
  end
end
