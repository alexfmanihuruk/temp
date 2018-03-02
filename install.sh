#!/bin/bash

check_user()
{
    if [[ $EUID -ne 0 ]]; then
        echo "This script must be run as root"
        exit 1
    fi
}

php()
{
    add-apt-repository -y ppa:ondrej/php
    apt-get update -y
    apt-get install -y php7.1-mysql php7.1-zip php7.1-curl php7.1-json php7.1-cgi php7.1-fpm php7.1-mbstring php7.1-dom php7.1-gd php7.1-bz2 php7.1-xml php7.1-common
    apt install -y unzip
}

ruby()
{
   
    apt-get install -y ruby
    apt install -y ruby-bundler
    apt-get install ruby-all-dev
    sudo apt-get install ruby2.3-dev
    sudo apt install gcc
    apt install make
    apt install phpunit
    sudo apt-get install build-essential patch ruby-dev zlib1g-dev liblzma-dev
 
    
}

nginx()
{
    apt-get update -y
    apt-get install -y nginx
}

nodejs()
{
    curl -sL https://deb.nodesource.com/setup_8.x | bash
    apt-get install -y nodejs
}

java()
{
    apt-get update -y
    apt-get install -y default-jre
    apt-get install -y default-jdk
}

gradle(){
    java
    apt install -y unzip
    wget https://services.gradle.org/distributions/gradle-4.4-rc-6-bin.zip
    mkdir -p /opt/gradle
    unzip -d /opt/gradle gradle-4.4-rc-6-bin.zip
    export PATH=$PATH:/opt/gradle/gradle-4.4-rc-6/bin
    gradle -v

}

composer()
{
    wget http://getcomposer.org/composer.phar
    mv composer.phar /usr/local/bin/composer
    chmod +x /usr/local/bin/composer
}

subversion()
{
    apt-get update -y
    apt-get install -y subversion
}

supervisor()
{
    apt-get update -y
    apt-get install -y supervisor
}

manual()
{
echo ""
echo "Usage: ./install.sh COMMAND"
echo ""
echo "Commands:"
echo "	php			    Install PHP Packages"
echo "	nginx		    Install NGINX Packages"
echo "	nodejs		    Install NODEJS AND NPM Packages"
echo "	java	        Install JAVA Packages"
echo "	gradle	        Install GRADLE Packages"
echo "	subversion		Install SUBVERSION Packages"
echo "	supervisor		Install SUPERVISOR Packages"
echo ""
exit 0

exit 0
}

check_user
if [ -z "$1" ] || [ $1 == "manual" ]; then
manual
fi

apt-get install -y python-software-properties
COMMAND=$1
$COMMAND
