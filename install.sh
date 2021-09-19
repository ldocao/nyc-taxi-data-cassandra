sudo apt-get update
echo 'export LC_ALL="en_US.UTF-8"' >> $HOME/.bashrc
source $HOME/.bashrc
sudo apt-get install -y emacs htop iotop software-properties-common

echo "deb http://www.apache.org/dist/cassandra/debian 40x main" | sudo tee -a /etc/apt/sources.list.d/cassandra.sources.list
curl https://downloads.apache.org/cassandra/KEYS | sudo apt-key add -
sudo apt-get update
sudo apt-get install -y cassandra

gsutil -m cp -r gs://nyc-taxi-data $HOME/