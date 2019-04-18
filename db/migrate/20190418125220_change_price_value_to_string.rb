class ChangePriceValueToString < ActiveRecord::Migration[5.2]
  def change
    change_column :reviews, :price, :integer
  end
end
