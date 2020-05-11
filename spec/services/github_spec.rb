require 'rails_helper'

describe GithubService do
  context 'instance methods' do
    context '#grab_repos' do
      xit "returns repos" do
        github = GithubService.new
        repos = github.grab_repos
        expect(repos).to be_a Array
        repo1 = repos.first
        expect(repo1.name).to_not eq(nil)
        expect(repo1.url).to_not eq(nil)
      end
    end

    context '#grab_followers' do
      xit "returns followers" do
        github = GithubService.new
        followers = github.grab_followers
        expect(followers).to be_a Array
        follower1 = followers.first
        expect(follower1.name).to_not eq(nil)
        expect(follower1.url).to_not eq(nil)
      end
    end

    context '#grab_following' do
      xit "returns following" do
        github = GithubService.new
        following = github.grab_following
        expect(following).to be_a Array
        following1 = following.first
        expect(following1.name).to_not eq(nil)
        expect(following1.url).to_not eq(nil)
      end
    end

  end
end
