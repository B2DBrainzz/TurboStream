class PublicRoom < ApplicationRecord
    has_many :public_messages
    after_create_commit {broadcast_append_to "public_rooms"}
end
