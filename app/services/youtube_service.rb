class YoutubeService
  def video_info(id)
    params = { part: 'snippet,contentDetails,statistics', id: id }
    get_json('youtube/v3/videos', params)
  end

  def playlist_info(playlist_id)
    params = { part: 'snippet', playlistId: playlist_id, maxResults: 50 }
    get_json('youtube/v3/playlistItems', params)
  end

  def next_page(playlist_id, next_page_token)
    params = { part: 'snippet',
               playlistId: playlist_id,
               maxResults: 50,
               pageToken: next_page_token }
    playlist = get_json('youtube/v3/playlistItems', params)
    playlist_videos = playlist[:items]
    playlist_videos
  end

  private

  def get_json(url, params)
    response = conn.get(url, params)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: 'https://www.googleapis.com') do |f|
      f.adapter Faraday.default_adapter
      f.params[:key] = ENV['YOUTUBE_API_KEY']
    end
  end
end
