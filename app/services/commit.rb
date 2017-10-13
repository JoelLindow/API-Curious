class Commit
  attr_reader :commitdate, :commitmessage, :commiturl, :reponame, :repourl

  def initialize(commit_data)
    @commitdate     = (Time.current.to_date - Time.parse(commit_data[:commit][:author][:date]).to_date).to_i
    @commitmessage  = commit_data[:commit][:message]
    @commiturl      = commit_data[:commit][:tree][:url]
    @repourl        = commit_data[:repository][:url]
    @reponame       = commit_data[:repository][:name]
  end

end
