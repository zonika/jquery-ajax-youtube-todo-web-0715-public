require_relative 'config/environment'

class App < Sinatra::Base

  get "/" do 
    erb :"index"
  end

  get "/results" do
    @video = YouTube.new(params[:search_keyword]).get_vid
  end
end