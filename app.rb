require_relative 'config/environment'

class App < Sinatra::Base

  get "/" do 
    erb :"index"
  end

  get "/:search_keyword" do
    @video = Youtube.run(search_keyword)
  end
end