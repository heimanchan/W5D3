require 'rack'

my_app = Proc.new do |env|
  req = Rack::Request.new(env)
  res = Rack::Response.new
  res['Content-Type'] = 'text/html'
  render_path = ERB.new(req.path).result(binding)
  if req.path == "/i/love/app/academy"
    res.write(render_path)
  end
  res.finish # turns into an array!
end

Rack::Server.start(
  app: my_app,
  # Proc.new do |env|
  #   ['200', {'Content-Type' => 'text/html'}, ['hello world']]
  # end,
  Port: 3000
)

