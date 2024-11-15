class Student < ApplicationRecord
  has_many :internships
  has_many :companies, through: :internships
end
