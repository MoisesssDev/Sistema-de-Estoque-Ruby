class Warehouse < ApplicationRecord
  validates :code, uniqueness: true
  validates :name, :code, :city, :description, :address, :cep, :area, presence: true
end
