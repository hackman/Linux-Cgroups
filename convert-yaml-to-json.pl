#!/usr/bin/perl
use CPAN::Meta;
use CPAN::Meta::Converter;
use Data::Dumper;

if ( not defined($ARGV[0]) or $ARGV[0] !~ /META.yml$/ ) {
	print "Usage: $0 META.yml\n";
	exit 1;
}
my $file = $ARGV[0];

my $meta = CPAN::Meta->load_file($file);
my $cmc = CPAN::Meta::Converter->new($meta);
my $new = CPAN::Meta->new($cmc->convert(version=>"2"));

$file =~ s/.yml/.json/;
$new->save($file);
