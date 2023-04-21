class Item < ApplicationRecord
  validates checked, inclusion: [true, false]
  validates :image, presence: {message: '選択されていません'}
  validates :name, presence: true
  validates :introduction, presence: true
  belongs_to :genre
  validates :price, numericality: {only_integer: true}
  validates :item, inclusion: {in:[true,false]}
end
