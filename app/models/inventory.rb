class Inventory < ActiveRecord::Base
  validates_presence_of :title, :description, :quantity
  validates_numericality_of :quantity
end
