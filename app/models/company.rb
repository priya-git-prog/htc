class Company < ApplicationRecord
  has_many :tickets

  def formatted_name
    "#{name} - #{branch}"
  end
end
