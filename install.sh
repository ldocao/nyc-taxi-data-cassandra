sudo apt-get update
echo 'export LC_ALL="en_US.UTF-8"' >> $HOME/.bashrc
source $HOME/.bashrc
sudo apt-get install -y emacs htop iotop software-properties-common

echo "deb http://www.apache.org/dist/cassandra/debian 40x main" | sudo tee -a /etc/apt/sources.list.d/cassandra.sources.list
curl https://downloads.apache.org/cassandra/KEYS | sudo apt-key add -
sudo apt-get update
sudo apt-get install -y cassandra

#tools to bulk load csv
wget https://github.com/brianmhess/cassandra-loader/releases/download/v0.0.27/cassandra-loader # https://github.com/brianmhess/cassandra-loader
chmod u+x $HOME/cassandra-loader
sudo mv $HOME/cassandra-loader /usr/local/bin

gsutil -m cp -r gs://nyc-taxi-data $HOME/


# you should set in /etc/cassandra/cassandra.yaml : enable_user_defined_functions: true
# then execute the code below
# sudo systemctl restart cassandra
# cqlsh -f $HOME/nyc-taxi-data-cassandra/create_extract_year.cql