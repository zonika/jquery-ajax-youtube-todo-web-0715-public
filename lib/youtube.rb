class YouTube

  attr_reader :client, :search_term

  def initialize(search_term)
    @client = client = YouTubeIt::Client.new(:dev_key => ENV['DEVELOPER_KEY'])
    @search_term = search_term
  end

  def self.run(search_term)
    self.new(search_term).get_vid
  end

  def get_vid
    videos = self.client.videos_by(:query => [self.search_term]).videos
    videos.first.embed_html5(:id => "ytplayer", :width => 640, :height => 390)
  end

end
