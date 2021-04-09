class PublicMessage < ApplicationRecord
  belongs_to :user
  belongs_to :public_room

  after_create_commit {broadcast_prepend_to "public_messages"}
end
