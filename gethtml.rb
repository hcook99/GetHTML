require 'sinatra'
require 'open-uri'
require 'htmlbeautifier'

set :static, true
set :public_folder, "static"
set :views, "views"

get '/' do
    erb :getURL
end

post '/' do
    @post = params[:post]
    contents = open(@post[:urlRE].to_s).read
    contents = '<xmp>'+contents +'</xmp>'
    beautiful = HtmlBeautifier.beautify(contents)
    erb :urlReturn,  :locals =>  { :content => beautiful }
end