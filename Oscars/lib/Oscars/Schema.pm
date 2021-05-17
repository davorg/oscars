use utf8;
package Oscars::Schema;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use Moose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Schema';

__PACKAGE__->load_namespaces;


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2021-05-16 11:22:17
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:LlBQuPCQQMPgC5XVBw3bOA

sub get_schema {
  return __PACKAGE__->connect('dbi:SQLite:data/oscars.db');
}


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable(inline_constructor => 0);
1;
