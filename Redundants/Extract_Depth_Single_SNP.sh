#!/bin/bash
v1=40010
v2=40010
cat Example_BAMfiles.list | while read line
do 
  samtools depth -r 1:$v1-$v2 "http://ftp.1000genomes.ebi.ac.uk/vol1/$line" && rm -f *.bam.bai;
done &> lets_test_this.shit;
sed -i '1~2d' lets_test_this.shit