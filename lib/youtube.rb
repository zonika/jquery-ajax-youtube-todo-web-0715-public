class YouTube

  attr_reader :client, :search_term, :left, :right

  def initialize(search_term)
    @client = client = YouTubeIt::Client.new(:dev_key => ENV['DEVELOPER_KEY'])
    @search_term = search_term
    @left = '<iframe id="ytplayer" type="text/html" width="640" height="390" src='
    @right = ' frameborder="0"/>'
  end

  # def run(search_term)
  #   self.new(search_term).get_vid
  # end

  def get_vids
    self.client.videos_by(:query => [self.search_term]).videos
  end

  def get_vid
    vid = get_vids.first
    url = vid.media_content[0].url
    self.left + url + self.right
  end
end
