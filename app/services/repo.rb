class Repo
  attr_reader :name
  def initialize(repo_data)
    # binding.pry
    @name = repo_data[:name]
  end

end
