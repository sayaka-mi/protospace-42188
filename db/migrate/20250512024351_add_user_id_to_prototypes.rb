class AddUserIdToPrototypes < ActiveRecord::Migration[7.1]
  def change
    unless column_exists?(:prototypes, :user_id)
      add_column :prototypes, :user_id, :integer
    end
  end
end