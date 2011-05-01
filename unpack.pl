#!usr/bin/perl

# Testing the pack and unpack functions

use Extract;

print "\nName your genome file: ";
$genome_file = <STDIN>;
chomp $genome_file;

if (Extract->is_fasta($genome_file) =~ /false/ ) {print "Genome file is not FASTA - exiting\n\n"; exit; }

open (IN, $genome_file);
seek (IN, 0, 0);
$first_few_chars = unpack(A10, <IN>);
close IN;

if ($first_few_chars =~ />/) { my $outfile = $genome_file . ".index"; Extract->format_genome($genome_file , $outfile); $infile = $outfile;} else { $infile = $genome_file }

print "\nWhat position do you want to extract?";

$snp = <STDIN>;
 
$start = $snp - 5000;
$length = 10000;

$sequence = Extract->get_sequence($infile, $start, $length);


print "\nLength:" . length($sequence) . "  file: $sequence \n\n";


exit;

