require "kemal"

get "/" do |context|
  context.responce.content_type = "application/json charset=utf-8"
  { message: "Hello World"}.to_json
end
