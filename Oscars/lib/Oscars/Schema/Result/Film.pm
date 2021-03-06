use utf8;
package Oscars::Schema::Result::Film;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Oscars::Schema::Result::Film

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<film>

=cut

__PACKAGE__->table("film");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 title

  data_type: 'char'
  is_nullable: 0
  size: 250

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "title",
  { data_type => "char", is_nullable => 0, size => 250 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 UNIQUE CONSTRAINTS

=head2 C<title_unique>

=over 4

=item * L</title>

=back

=cut

__PACKAGE__->add_unique_constraint("title_unique", ["title"]);

=head1 RELATIONS

=head2 nominations

Type: has_many

Related object: L<Oscars::Schema::Result::Nomination>

=cut

__PACKAGE__->has_many(
  "nominations",
  "Oscars::Schema::Result::Nomination",
  { "foreign.film_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2021-12-20 20:36:37
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Os7c8Ac0NchV1Oa/gEGJpg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
