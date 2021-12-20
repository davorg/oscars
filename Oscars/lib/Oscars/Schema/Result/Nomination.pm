use utf8;
package Oscars::Schema::Result::Nomination;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Oscars::Schema::Result::Nomination

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<nomination>

=cut

__PACKAGE__->table("nomination");

=head1 ACCESSORS

=head2 ceremony_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 category_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 film_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 text

  data_type: 'char'
  is_nullable: 1
  size: 150

=head2 winner

  data_type: 'integer'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "ceremony_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "category_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "film_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "text",
  { data_type => "char", is_nullable => 1, size => 150 },
  "winner",
  { data_type => "integer", is_nullable => 1 },
);

=head1 UNIQUE CONSTRAINTS

=head2 C<ceremony_id_category_id_film_id_text_unique>

=over 4

=item * L</ceremony_id>

=item * L</category_id>

=item * L</film_id>

=item * L</text>

=back

=cut

__PACKAGE__->add_unique_constraint(
  "ceremony_id_category_id_film_id_text_unique",
  ["ceremony_id", "category_id", "film_id", "text"],
);

=head1 RELATIONS

=head2 category

Type: belongs_to

Related object: L<Oscars::Schema::Result::Category>

=cut

__PACKAGE__->belongs_to(
  "category",
  "Oscars::Schema::Result::Category",
  { id => "category_id" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);

=head2 ceremony

Type: belongs_to

Related object: L<Oscars::Schema::Result::Ceremony>

=cut

__PACKAGE__->belongs_to(
  "ceremony",
  "Oscars::Schema::Result::Ceremony",
  { id => "ceremony_id" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);

=head2 film

Type: belongs_to

Related object: L<Oscars::Schema::Result::Film>

=cut

__PACKAGE__->belongs_to(
  "film",
  "Oscars::Schema::Result::Film",
  { id => "film_id" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2021-12-20 20:36:37
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:1G6VO3jl4nu6SFg/5AC6kQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
