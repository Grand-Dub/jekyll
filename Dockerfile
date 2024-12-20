# base Debian
FROM ruby:3.2.2-bookworm

# bsdmainutils pour hexdump
RUN \
apt update && \
apt upgrade -y && \
apt-get install -y ruby-full build-essential && \
apt-get install -y ruby-full build-essential zlib1g-dev && \
apt-get install -y less bsdmainutils && \
apt autoremove -y && apt autoclean && \
useradd --create-home --shell /bin/bash jekyll 

USER jekyll

RUN \
sed -i '/#alias/s/#//g' ~/.bashrc && \
sed -i '/#force_color_prompt=yes/s/#//g' ~/.bashrc

ENV GEM_HOME="/home/jekyll/gems" PATH="/home/jekyll/gems/bin:$PATH"

RUN gem install jekyll bundler

CMD bash
EXPOSE 4000
VOLUME [ "/home/jekyll/jekyll/site" ]
WORKDIR /home/jekyll/jekyll

RUN \
bundle init && \
echo 'gem "jekyll"' >> Gemfile && \
bundle
