use strict;
use warnings;

my $file1=$ARGV[0];              #输入文件1
my $file2=$ARGV[1];              #输入文件2
my $out=$ARGV[2];                #输出文件
my %hash=();                     #定义hash

open(RF,"$file1") or die $!;     #读取文件1
while(my $line=<RF>){
  chomp($line);
  my @arr=split(/\t/,$line);
  my $gene=shift(@arr);
  $hash{$gene}=join("\t",@arr);
}
close(RF);

open(RF,"$file2") or die $!;     #读取文件1
open(WF,">$out") or die $!;      #写入文件
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

