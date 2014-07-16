class Bestof < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :image_url
end
