class DashboardController < ApplicationController

  def index
    #-------- BEGIN: GETS REPOS -----------------
    repos_json = Faraday.get "https://api.github.com/user/repos?access_token=#{current_user.oauth_token}"
    raw_repos = JSON.parse(repos_json.body, symbolize_names: true)
    @repos = raw_repos.map do |repo|
      Repo.new(repo)
    end
    #-------- END: GETS REPOS -------------------

    #-------- BEGIN: GETS USER INFO -----------------
    user_info_json = Faraday.get "https://api.github.com/users/joellindow?access_token=#{current_user.oauth_token}"
    raw_user_info = JSON.parse(user_info_json.body, symbolize_names: true)
    @userinfo = UserInfo.new(raw_user_info)
    #-------- END: GETS USER INFO -------------------


  end

end
