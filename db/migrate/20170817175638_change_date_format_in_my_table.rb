class ChangeDateFormatInMyTable < ActiveRecord::Migration[5.1]
  def change
    change_column :rents, :from, :datetime
    change_column :rents, :to, :datetime
  end
end
