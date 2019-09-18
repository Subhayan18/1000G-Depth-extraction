#!/bin/bash
j=1
k=$(wc -l <Sample_SNPfile_r.txt)
let m=$k/2
#echo $m
while [ $j -le $m ];
do
  let la=(2*$j)-1
  let lb=2*$j
  v1=$(sed "$la q;d" Sample_SNPfile_r.txt)
  v2=$(sed "$lb q;d" Sample_SNPfile_r.txt)
#  echo $v1
#  echo $v2
  cat Example_BAMfiles.list | while read line
    do 
    samtools depth -r $v1:$v2-$v2 "http://ftp.1000genomes.ebi.ac.uk/vol1/$line" && rm -f *.bam.bai;
done &> lets_test_this_"$j".shit;
sed -i '1~2d' lets_test_this_"$j".shit
let j=j+1
done