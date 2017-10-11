class User < ApplicationRecord
  def self.from_oauth(authhash)
    user = User.find_or_create_by(uid: authhash['id'])

    user.username = authhash["info"]["name"]
    user.oauth_token = authhash["credentials"]["token"]

    user 
  end

end
