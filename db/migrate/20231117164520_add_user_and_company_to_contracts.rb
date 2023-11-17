class AddUserAndCompanyToContracts < ActiveRecord::Migration[7.1]
  def change
    add_reference :contracts, :user, null: false, foreign_key: true
    add_reference :contracts, :company, null: false, foreign_key: true
  end
end
