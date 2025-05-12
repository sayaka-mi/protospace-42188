class AddUserIdToPrototypes < ActiveRecord::Migration[7.1]
  def change
    add_column :prototypes, :user_id, :integer
  end
end
