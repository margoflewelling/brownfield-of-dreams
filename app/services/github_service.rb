class GithubService
  def conn
    Faraday.new('https://api.github.com/user') do |req|
      req.headers[:Authorization] = "Bearer 85c889b0c8ef67700d862f9d5eaff715ede516f2"
    end
  end

  def grab_repos
    repos = conn.get('repos?page=1&per_page=5')
    json = JSON.parse(repos.body, symbolize_names: true)
    user_repos = []
    json.each do |repo|
      user_repos << Repo.new(repo[:name], repo[:html_url])
    end
    user_repos
  end

  def grab_followers
    followers = conn.get('followers')
    json = JSON.parse(followers.body, symbolize_names: true)
    user_followers = []
    json.each do |follower|
      user_followers << GithubUser.new(follower[:login], follower[:html_url])
    end
    user_followers
  end

  def grab_following
    following = conn.get('following')
    json = JSON.parse(following.body, symbolize_names: true)
    user_following = []
    json.each do |person|
      user_following << GithubUser.new(person[:login], person[:html_url])
    end
    user_following
  end
end
