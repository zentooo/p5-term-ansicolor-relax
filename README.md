Term::ANSIColor::Relax
=======

Make colored output easily.


Synopsis
-------

![relax](http://cdn-ak.f.st-hatena.com/images/fotolife/z/zentoo/20101105/20101105135811.jpg)


Install
-------

cpanm Term::ANSIColor::Relax

or

git clone git://github.com/zentooo/p5-term-ansicolor-relax.git
cd p5-term-ansicolor-relax
perl Makfile.PL && make && make install


Usage
-------

    use Term::ANSIColor::Relax;
    use feature qw/say/;
    
    say "I"->green;
    say "love"->magenta->bold->underscore;
    say "you"->white->on_blue;
    
    my $timtoady = <<'TIMTOADY';
    #####  ###  #    #  #####   ###     #    ####   #   #  
      #     #   ##  ##    #    #   #   # #   #   #  #   #  
      #     #   # ## #    #    #   #  #   #  #   #   # #   
      #     #   #    #    #    #   #  #####  #   #    #    
      #     #   #    #    #    #   #  #   #  #   #    #    
      #    ###  #    #    #     ###   #   #  ####     #    
    TIMTOADY
    
    say $timtoady->rainbow;
