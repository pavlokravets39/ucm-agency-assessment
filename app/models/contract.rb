class Contract < ApplicationRecord
  belongs_to :user
  belongs_to :company

  validates :average_weekly_hours, presence: true
  validates :hourly_wage, presence: true
  validate :validate_validity_period
  validate :no_overlapping_contracts
  validates :archive_number, uniqueness: true, allow_nil: true

  after_create :generate_contract_number

  private

  def generate_contract_number
    self.update_column(:contract_number, "N%05d" % self.id)
  end

  def no_overlapping_contracts
    overlapping = Contract.where(user_id: user_id)
                          .where('valid_from < ? AND valid_to > ?', valid_to, valid_from)
                          .exists?
    errors.add(:base, "Overlapping contract period") if overlapping
  end

  def validate_validity_period
    if valid_from.nil? || valid_to.nil?
      errors.add(:base, "Both start and end dates of the validity period must be present.")
    elsif valid_from > valid_to
      errors.add(:base, "Start date of the validity period must be before the end date.")
    end
  end
end
