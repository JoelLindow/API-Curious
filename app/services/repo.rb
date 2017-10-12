class Repo
  attr_reader :name, :url, :description, :language, :updatedat, :forks, :owner

  def initialize(repo_data)
    @name = repo_data[:name]
    @url  = repo_data[:html_url]
    @description = repo_data[:description]
    @language = repo_data[:language]
    @updatedat = repo_data[:updated_at]
    @forks = repo_data[:forks]
    @owner = repo_data[:owner][:login]
  end

end
