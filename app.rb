require_relative 'config/environment'

class App < Sinatra::Base

  get "/" do
    erb :"index"
  end

  get "/widget" do
    YouTube.run(params[:search_keyword])
  end
end
