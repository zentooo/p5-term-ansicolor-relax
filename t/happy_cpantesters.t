use strict;
use warnings;
use Test::More;

use Term::ANSIColor::Relax;

my $timtoady = <<'TIMTOADY';

#####  ###  #    #  #####   ###     #    ####   #   #  
  #     #   ##  ##    #    #   #   # #   #   #  #   #  
  #     #   # ## #    #    #   #  #   #  #   #   # #   
  #     #   #    #    #    #   #  #####  #   #    #    
  #     #   #    #    #    #   #  #   #  #   #    #    
  #    ###  #    #    #     ###   #   #  ####     #    
TIMTOADY

diag $timtoady->rainbow;

ok(1);

done_testing;
