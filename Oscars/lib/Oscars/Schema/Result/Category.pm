use utf8;
package Oscars::Schema::Result::Category;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Oscars::Schema::Result::Category

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<category>

=cut

__PACKAGE__->table("category");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 name

  data_type: 'char'
  is_nullable: 1
  size: 50

=head2 subname

  data_type: 'char'
  is_nullable: 1
  size: 50

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "name",
  { data_type => "char", is_nullable => 1, size => 50 },
  "subname",
  { data_type => "char", is_nullable => 1, size => 50 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 UNIQUE CONSTRAINTS

=head2 C<name_subname_unique>

=over 4

=item * L</name>

=item * L</subname>

=back

=cut

__PACKAGE__->add_unique_constraint("name_subname_unique", ["name", "subname"]);

=head1 RELATIONS

=head2 nominations

Type: has_many

Related object: L<Oscars::Schema::Result::Nomination>

=cut

__PACKAGE__->has_many(
  "nominations",
  "Oscars::Schema::Result::Nomination",
  { "foreign.category_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2021-12-20 20:36:37
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:4G60pzHrCq5JYSHj/XWEHQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
