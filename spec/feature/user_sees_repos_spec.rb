require 'rails_helper'

feature "Authenticated User" do
  it "sees a list of their repositories" do
    VCR.use_cassette("list_of_repositories") do
      user = User.new(username: 'mrgenericguy', oauth_token: ENV['github_user_token'])

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit '/dashboard'

      expect(page).to have_css("h3.repo", count: 27)
    end
  end
end
