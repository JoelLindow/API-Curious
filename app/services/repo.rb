class Repo
  attr_reader :name, :url, :description, :language, :updatedat, :forks, :owner

  def initialize(repo_data)
    @name = repo_data[:name]
    @url  = repo_data[:html_url]
    @description = repo_data[:description]
    @language = repo_data[:language]
    @updatedat = Time.parse(repo_data[:updated_at]).to_date
    @forks = repo_data[:forks]
    @owner = repo_data[:owner][:login]
  end

end
