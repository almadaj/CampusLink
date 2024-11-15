class Internship < ApplicationRecord
  belongs_to :student
  belongs_to :company

  validates :student_id, presence: true
  validates :company_id, presence: true
  validates :start_date, presence: true
  validates :workload, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :salary, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
