class DashboardController < ApplicationController

  def index
    repos_json = Faraday.get "https://api.github.com/user/repos?access_token=#{current_user.oauth_token}"
    raw_repos = JSON.parse(repos_json.body, symbolize_names: true)
    @repos = raw_repos.map do |repo|
      Repo.new(repo)
    end

    user_info_json = Faraday.get "https://api.github.com/users/joellindow?access_token=#{current_user.oauth_token}"
    raw_user_info = JSON.parse(user_info_json.body, symbolize_names: true)
    @userinfo = UserInfo.new(raw_user_info)

    commits_json = Faraday.get "https://api.github.com/search/commits?q=author:joellindow&sort=author-date" do |faraday|
      faraday.headers['Authorization'] = "token #{current_user.oauth_token}"
      faraday.headers['Accept'] = "application/vnd.github.cloak-preview"
    end
    raw_commits = JSON.parse(commits_json.body, symbolize_names: true)
    commit_items = raw_commits[:items]
    @commits = commit_items.map do |commit|
      Commit.new(commit)
    end
  end

end
