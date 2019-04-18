class ChangePriceValueToString2 < ActiveRecord::Migration[5.2]
  def change
    change_column :reviews, :price, :string
  end
end
