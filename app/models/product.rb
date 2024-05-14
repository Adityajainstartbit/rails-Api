class Product < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    ["category", "created_at", "description", "id", "image", "status", "title", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    
    []
  end
end
