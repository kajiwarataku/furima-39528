class Item < ApplicationRecord
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :bear
  belongs_to :area
  belongs_to :send_day

  validates :name, presence: true
  validates :description, presence: true
  validates :category_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :condition_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :bear_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :area_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :send_day_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :price, presence: true
  validates :user, presence: true
end
