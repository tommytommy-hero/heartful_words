class Message < ApplicationRecord
  belongs_to :user
  belongs_to :tag, optional: true
  has_many :favorites, dependent: :destroy

  def favorited?(user)
    favorites.where(user_id: user.id).exists?
  end
end


