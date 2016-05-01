# Replace 127.0.0.1 with your ip-address
sub http_request($$$)
{
  my ($name, $characteristic, $value) = @_;
  my $data = sprintf('{"topic": "set", "payload": {"name": "%s", "characteristic": "%s", "value": %s}}', $name, $characteristic, $value); 
  #Log 1, ($data);
  my $ip = "127.0.0.1";
  my $url = sprintf("http://%s:1880/fhem", $ip);
  
  # method: POST
  HttpUtils_NonblockingGet({
    url       =>$url,
    timeout   => 5,
    header    =>"Content-Type: application/json",
    data      =>$data,
    name      =>$name,
    callback   =>sub($$$) {
      if ($_[1] ne "") {Log 1,"$_[0]->{name} ERR:$_[1] DATA:$_[2]";}
    }
  });
}
