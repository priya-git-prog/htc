class Company < ApplicationRecord
  has_many :tickets, dependent: :destroy

  def formatted_name
    "#{name} - #{branch}"
  end
end
