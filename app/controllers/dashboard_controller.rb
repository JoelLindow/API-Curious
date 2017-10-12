class DashboardController < ApplicationController

  def index
    repos_json = Faraday.get "https://api.github.com/user/repos?access_token=#{API-KEY}"
    #^^^^^^^^^^ Brings back big ol' pile of ALL github related data for user in big JSON string

    raw_repos = JSON.parse(repos_json.body, symbolize_names: true)
    #^^^^^^^^^^ Brings back the string body with name/value pairs with names as symbols"

    @repos = raw_repos.map do |repo|
      Repo.new(repo)
    end

  end

end
