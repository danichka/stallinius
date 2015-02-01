class Cart < ActiveRecord::Base
  has_many :product, dependent: :destroy
end