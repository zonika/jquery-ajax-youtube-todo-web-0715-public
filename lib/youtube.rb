class Youtube

  attr_reader :client, :search_term

  def initialize(search_term)
    @client = client = YouTubeIt::Client.new(:dev_key => ENV['DEVELOPER_KEY'])
    @search_term = search_term

  end

  def run(search_term)
    self.new(search_term).get_vid
  end

  def get_results
    self.client.videos_by(:query => [self.search_term])
  end

  def get_vid
    results = get_results
    
  end
end
