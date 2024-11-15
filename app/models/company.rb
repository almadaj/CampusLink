class Company < ApplicationRecord
  has_many :internships
  has_many :students, through: :internships
end
