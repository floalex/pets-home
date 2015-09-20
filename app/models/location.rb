class Location < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  validates :street, format: { with: /\A[a-z0-9\s]+\z/i, allow_blank: true }           
  validates :city, presence: true
  validates :zipcode, presence: true,
             format: { with: /\A\d{5}\z/i }

  def full_address
    [street, city, zipcode].join(", s")
  end

  
end
