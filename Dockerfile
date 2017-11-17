FROM ruby:2.3.1-onbuild
MAINTAINER Adrian Perez <adrian@adrianperez.org>
VOLUME /usr/src/app/source
EXPOSE 4567

RUN apt-get update && apt-get install -y nodejs \
&& apt-get clean && rm -rf /var/lib/apt/lists/* \
&& bundle install

CMD ["bundle", "exec", "middleman", "server", "--watcher-force-polling"]