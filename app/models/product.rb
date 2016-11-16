class Product < ActiveRecord::Base

  monetize :price_cents, numericality: true
  mount_uploader :image, ProductImageUploader

  belongs_to :category
    has_many :reviews

    def average
      if
        self.reviews.count > 0
        self.reviews.sum('rating') / self.reviews.count
      end
    end

  validates :name, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
  validates :category, presence: true

end
