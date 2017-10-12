class User < ApplicationRecord
  # def self.from_oauth(authhash)
  #   user = User.find_or_create_by(uid: authhash['id'])
  #
  #   user.username = authhash["info"]["name"]
  #   user.oauth_token = authhash["credentials"]["token"]
  #
  #   user
  # end

  def self.from_oauth(authhash)
      user = User.where(uid: authhash.uid).first
      if !user.nil? && user.oauth_token == authhash.credentials.token
        user
      elsif !user.nil?
        user.oauth_token = authhash.credentials.token
        user.save
        user
      else
        User.create(uid: authhash.uid, username: authhash.info.name, oauth_token: authhash.credentials.token)
        user
      end
    end
end
