class Customer < ApplicationRecord
  has_one_attached :image
  validates :full_name, presence: true

  def self.ransackable_attributes(auth_object = nil)
    %w[full_name phone_number email notes created_at updated_at]
  end
end
