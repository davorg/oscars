package Oscars;
use Dancer2;

use Oscars::Schema;

our $VERSION = '0.1';

get '/' => sub {
  template 'index' => { 'title' => 'Oscars' };
};

get '/films' => sub {
  template 'films' => {
    title => 'Oscars - All films',
    films => get_all_winning_films(),
  };
};

sub get_all_winning_films {
  my $rs = Oscars::Schema->get_schema->resultset('Film');

  my @films = $rs->search({
    'nominations.winner' => 1,
  }, {
    prefetch => { nominations => 'ceremony' },
    order_by => 'title',
  });

  return \@films;
}

true;
