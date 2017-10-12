class UserInfo
  attr_reader :username, :userimg, :userlocation, :useremail

  def initialize(user_info)
    @username     = user_info[:login]
    @userimg      = user_info[:avatar_url]
    @userlocation = user_info[:location]
    @useremail    = user_info[:email]
  end

end
