class CreateContracts < ActiveRecord::Migration[7.1]
  def change
    create_table :contracts do |t|
      t.string :contract_number
      t.float :average_weekly_hours
      t.float :hourly_wage
      t.date :valid_from
      t.date :valid_to
      t.date :signed_date_user
      t.date :signed_date_company
      t.string :archive_number

      t.timestamps
    end
  end
end
