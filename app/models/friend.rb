class Friend < ActiveRecord::Base
  attr_accessible :facebook_id, :location, :name, :user_id

  validates :facebook_id, uniqueness: { scope: :user_id }
  validates :user, presence: true

  belongs_to :user

  acts_as_gmappable

  def gmaps4rails_address
    self.location
  end
end
