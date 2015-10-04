class AddPaperclip < ActiveRecord::Migration
  def down
    add_attachment :users, :image
  end
  def up
    remove_attachment :users, :image
  end
  def up
    add_attachment :images, :image
  end
  def down
    remove_attachment :images, :image
  end
end
