class Company < ApplicationRecord
  validates :cnpj, presence: true, uniqueness: true

  has_many :internships
  has_many :students, through: :internships
end
