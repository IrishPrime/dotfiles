#!/usr/bin/perl

# 

use Data::Dumper;
use Getopt::Std;
use Log::Message::Simple qw[msg error debug];
use strict;
use warnings;

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
