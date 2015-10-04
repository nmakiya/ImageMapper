class AddEvents < ActiveRecord::Migration
  def change
    create_table(:events) do |t|
      t.integer :image_id
      t.inet    :ip

      t.timestamps 
    end
  end
end
