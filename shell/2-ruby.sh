apt-get -y install libyaml-0-2
RUBY_VERSION=2.1.2

if [[ -f /opt/ruby/bin/ruby ]] && [[ `/opt/ruby/bin/ruby -v` == *$RUBY_VERSION* ]]; then
	echo "Ruby $RUBY_VERSION already installed."
	exit 0
fi

cd /tmp

wget http://ftp.ruby-lang.org/pub/ruby/2.1/ruby-$RUBY_VERSION.tar.gz
tar xzf ruby-$RUBY_VERSION.tar.gz
cd ruby-$RUBY_VERSION
./configure --prefix=/opt/ruby --disable-install-rdoc
make
make install
cd ..
rm -rf ruby-$RUBY_VERSION
rm ruby-$RUBY_VERSION.tar.gz

echo 'PATH=$PATH:/opt/ruby/bin' > /etc/profile.d/vagrantruby.sh
