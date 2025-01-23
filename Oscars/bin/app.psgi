#!/usr/bin/perl

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../lib";


# use this block if you don't need middleware, and only have a single target Dancer app to run here
use Oscars;

Oscars->to_app;

=begin comment
# use this block if you want to include middleware such as Plack::Middleware::Deflater

use Oscars;
use Plack::Builder;

builder {
    enable 'Deflater';
    Oscars->to_app;
}

=end comment

=cut

=begin comment
# use this block if you want to mount several applications on different path

use Oscars;
use Oscars_admin;

use Plack::Builder;

builder {
    mount '/'      => Oscars->to_app;
    mount '/admin'      => Oscars_admin->to_app;
}

=end comment

=cut

