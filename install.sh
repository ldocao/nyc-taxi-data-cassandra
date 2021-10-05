sudo apt-get update
echo 'export LC_ALL="en_US.UTF-8"' >> $HOME/.bashrc
source $HOME/.bashrc
sudo apt-get install -y emacs htop iotop software-properties-common

echo "deb http://www.apache.org/dist/cassandra/debian 40x main" | sudo tee -a /etc/apt/sources.list.d/cassandra.sources.list
curl https://downloads.apache.org/cassandra/KEYS | sudo apt-key add -
sudo apt-get update
sudo apt-get install -y cassandra

#tools to bulk load csv
wget https://github.com/brianmhess/cassandra-loader/releases/download/v0.0.27/cassandra-loader -O $HOME/cassandra-loader # https://github.com/brianmhess/cassandra-loader
chmod u+x $HOME/cassandra-loader
sudo mv $HOME/cassandra-loader /usr/local/bin

wget https://github.com/brianmhess/cassandra-loader/releases/download/v0.0.27/cassandra-unloader -O $HOME/cassandra-unloader
chmod u+x $HOME/cassandra-unloader
sudo mv $HOME/cassandra-unloader /usr/local/bin


gsutil -m cp -r gs://nyc-taxi-data $HOME/

# sudo emacs -nw /etc/cassandra/cassandra.yaml
# increase read timeout (this is not actually recommended when using cassandra in general, but this is to show it's not good for aggegation)
# read_request_timeout_in_ms: 500000
# range_request_timeout_in_ms: 1000000
# write_request_timeout_in_ms: 200000
# counter_write_request_timeout_in_ms: 500000
# cas_contention_timeout_in_ms: 100000
# truncate_request_timeout_in_ms: 60000
# request_timeout_in_ms: 1000000
# sudo systemctl restart cassandra
