package Kolab::Util;

use 5.008;
use strict;
use warnings;

require Exporter;

our @ISA = qw(Exporter);

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.

# This allows declaration	use Kolab::Util ':all';
# If you do not need this, moving things directly into @EXPORT or @EXPORT_OK
# will save memory.
our %EXPORT_TAGS = ( 'all' => [ qw(
	
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(
	&debug &debug_response &debug_request &trim &datetoepoch
);

our $VERSION = '0.02';


# Preloaded methods go here.
sub debug
{
   #my $a = shift;
   #print "$a\n";
   #dolog($a);
}

sub debug_response
{ 
   #my $p = shift;
   #$Data::Dumper::Indent=1;
   #$Data::Dumper::Quotekeys=0;
   #print Dumper($LDAPResponse->decode($p));
}

sub debug_request
{
   #my $p = shift;
   #$Data::Dumper::Indent=1;
   #$Data::Dumper::Quotekeys=0;
   #print Dumper($LDAPRequest->decode($p));
}

# we will often trim strings and kill leading and trailing whitespace
sub trim {
  my $string = $_[0];
  if (defined $string) {
    $string =~ s/^\s+//g;
    $string =~ s/\s+$//g;
    chomp $string;
  }
  return $string;
}

sub datetoepoch {
   my $ldapdate = shift;
   (my $y, my $m, my $d, my $h, my $mi, my $se) = unpack("A4A2A2A2A2A2",$ldapdate);
   return timelocal($se,$mi,$h,$d,$m,$y);
}


1;
