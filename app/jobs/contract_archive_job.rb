require 'csv'

class ContractArchiveJob < ApplicationJob
  queue_as :default

  def perform(file_path)
    failed_rows = []
    CSV.foreach(file_path, headers: true).with_index(1) do |row, line_num|
      contract = Contract.find_by(contract_number: row['contract_number'])
      if contract.nil?
        failed_rows << [line_num, row['contract_number'], row['archive_number'], 'Contract not found']
      elsif contract.archive_number.present?
        failed_rows << [line_num, row['contract_number'], row['archive_number'], 'Contract already archived']
      elsif Contract.exists?(archive_number: row['archive_number'])
        failed_rows << [line_num, row['contract_number'], row['archive_number'], 'Archive number already exists']
      else
        contract.update(archive_number: row['archive_number'])
      end
    end
    generate_failure_csv(failed_rows) if failed_rows.any?
  end

  private

  def generate_failure_csv(failed_rows)
     # implement later
  end
end
