class Item < ApplicationRecord
  belongs_to :user


  validates :name, presence: true
  validates :description, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :bear_id, presence: true
  validates :area_id, presence: true
  validates :send_day_id, presence: true
  validates :price, presence: true
  validates :user, presence: true
end
