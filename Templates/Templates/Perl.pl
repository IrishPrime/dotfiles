#!/usr/bin/perl

use strict;
use warnings;
use Data::Dumper;
use Getopt::Std;
use Log::Message::Simple qw[msg error debug];

use constant {
	VERSION => '0.1.0',
};

$Getopt::Std::STANDARD_HELP_VERSION = 1;

my %opts;

getopts('', \%opts);

sub HELP_MESSAGE {
}

sub VERSION_MESSAGE {
	print "$0: v" . VERSION . "\n";
}
