class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :name, :text, :price, :image, presence: true  
  validates :price, inclusion: {in: 300..9999999}

  with_options numericality: { other_than: 1} do
    validates :category_id
    validates :status_id
    validates :delivery_fee_id
    validates :prefectures_id
    validates :days_to_ship_id
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_fee
  belongs_to :prefectures
  belongs_to :days_to_ship
  
end
