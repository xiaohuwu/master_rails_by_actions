FROM ruby:2.3.0

RUN mkdir /master_rails
WORKDIR /master_rails
COPY Gemfile /master_rails/Gemfile
COPY Gemfile.lock /master_rails/Gemfile.lock
RUN gem uninstall -i /usr/local/lib/ruby/gems/2.3.0 bundler
RUN gem install bundler --version '1.17.3'
RUN bundle install

COPY . /master_rails
CMD ["bundle", "exec", "rails", "s"]