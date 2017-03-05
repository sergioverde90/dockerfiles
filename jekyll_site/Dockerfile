FROM ruby:latest
MAINTAINER Sergio Verde, sergioverde90@gmail.com

RUN gem install jekyll bundler &&  jekyll new /home/jekyll/myblog

WORKDIR /home/jekyll/myblog

ENTRYPOINT bundle exec jekyll serve --host=0.0.0.0

EXPOSE 4000