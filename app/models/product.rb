class Product < ActiveRecord::Base

  belongs_to :category
  belongs_to :cart
  has_many :images

  validates :name, presence: true
  validates :price, numericality: { greater_than: 0 }

  
  include Tire::Model::Search
  include Tire::Model::Callbacks

  def self.search(params)
    tire.search(load: true) do
      query { string params[:query]} if params[:query].present?
    end
  end

end