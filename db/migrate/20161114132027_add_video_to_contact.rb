class AddVideoToContact < ActiveRecord::Migration[5.0]
  def change
    add_column :contacts, :video, :string
  end
end
