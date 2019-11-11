FROM debian:buster-slim
ENV DEBIAN_FRONTEND noninteractive
WORKDIR /app/

#RUN netselect-apt -c portugal -t 15 -n 
RUN apt-get update
RUN apt-get -y install yarnpkg git python3

COPY . /app/
#RUN ls 
RUN yarnpkg install
RUN yarnpkg build

EXPOSE 80

CMD exec /usr/bin/python3 -m http.server
