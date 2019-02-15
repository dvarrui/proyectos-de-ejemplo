FROM opensuse/tumbleweed

MAINTAINER iloveruby

RUN zypper -n install ruby2.6 ruby-devel
RUN zypper -n install automake gdbm-devel
RUN zypper -n install libffi-devel libyaml-devel libopenssl-devel
RUN zypper -n install ncurses-devel readline-devel zlib-devel
RUN zypper -n install sqlite3-devel nodejs10 git
RUN zypper -n install -t pattern devel_C_C++
RUN zypper -n install vim tree

RUN gem install bundler
RUN gem install rails
RUN ln -s /usr/lib64/ruby/gems/2.6.0/gems/railties-5.2.2/exe/rails /usr/local/bin/rails

EXPOSE 4567

CMD ["/bin/bash"]
