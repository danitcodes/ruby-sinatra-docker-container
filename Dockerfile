FROM ruby:2.6.5

WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
COPY . /myapp

EXPOSE 4567
# optional - mostly documentation for other developers to use this port when interacting w/ container

CMD ["bundle", "exec", "rackup", "--host", "0.0.0.0", "-p", "4567"]
#rackup - a Rack cmd that tells the server to start up. (Rack - an interface btw Ruby web servers and apps)
#0.0.0.0 --> tells Docker to listen for all interfaces on computer's local network, instead of specific IPs like 127.0.0.1
#-p = port
#local host 4567 specified from the yaml