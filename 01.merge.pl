use strict;
use warnings;

my $file1=$ARGV[0];              #�����ļ�1
my $file2=$ARGV[1];              #�����ļ�2
my $out=$ARGV[2];                #����ļ�
my %hash=();                     #����hash

open(RF,"$file1") or die $!;     #��ȡ�ļ�1
while(my $line=<RF>){
  chomp($line);
  my @arr=split(/\t/,$line);
  my $gene=shift(@arr);
  $hash{$gene}=join("\t",@arr);
}
close(RF);

open(RF,"$file2") or die $!;     #��ȡ�ļ�1
open(WF,">$out") or die $!;      #д���ļ�
while(my $line=<RF>){
  chomp($line);
  my @arr=split(/\t/,$line);
  my $gene=shift(@arr);
  if(exists $hash{$gene}){
  	print WF $gene . "\t" . $hash{$gene} . "\t" . join("\t",@arr) . "\n";
  }
}
close(WF);
close(RF);

