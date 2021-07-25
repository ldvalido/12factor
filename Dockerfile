FROM ruby:2.5.5

ENV APP_HOME /app
WORKDIR $APP_HOME

COPY Gemfile $APP_HOME/Gemfile
COPY Gemfile.lock $APP_HOME/Gemfile.lock

ENV BUNDLER_VERSION 2.1.0
RUN gem update --system \
    && gem install bundler -v $BUNDLER_VERSION \
    && bundle install -j 4

COPY . $APP_HOME

CMD ["bundle","exec","ruby", "web.rb","-p","8080"]
