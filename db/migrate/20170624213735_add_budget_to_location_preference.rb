class AddBudgetToLocationPreference < ActiveRecord::Migration[5.1]
  def change
    add_column :location_preferences, :min_budget, :integer
    add_column :location_preferences, :max_budget, :integer
  end
end
