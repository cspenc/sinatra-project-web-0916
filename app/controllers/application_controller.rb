class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set(:views, 'app/views')
  set(:public_folder, 'public')

  get '/' do
    erb :"/index.html"
  end

end
