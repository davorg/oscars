use utf8;
package Oscars::Schema::Result::Ceremony;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Oscars::Schema::Result::Ceremony

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<ceremony>

=cut

__PACKAGE__->table("ceremony");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 ceremony_year

  data_type: 'integer'
  is_nullable: 0

=head2 release_year

  data_type: 'integer'
  is_nullable: 0

=head2 ceremony_number

  data_type: 'integer'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "ceremony_year",
  { data_type => "integer", is_nullable => 0 },
  "release_year",
  { data_type => "integer", is_nullable => 0 },
  "ceremony_number",
  { data_type => "integer", is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 nominations

Type: has_many

Related object: L<Oscars::Schema::Result::Nomination>

=cut

__PACKAGE__->has_many(
  "nominations",
  "Oscars::Schema::Result::Nomination",
  { "foreign.ceremony_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2021-05-16 11:22:17
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:KOn3ztvrbjZzSVZFu2G6eA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
