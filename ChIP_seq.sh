#ChIP-seq shell script

#map reads

for file in *fq.gz
do
	bowtie2 -x GCA_000001405.15_GRCh38_no_alt_analysis_set.fna.bowtie_index -U "$file" -S "$file".sam
done


#bam conversion

for file in *.sam
do 
	samtools view -S -b "$file" > "$file".bam
done

#sort bam
for file in *.bam
do 
	samtools sort "$file" -o "$file"_sorted.bam
done


#peak calling 

for file in *1.sam
do 
	Macs2 callpeak -t "$file" -c Input_1i.sam -f SAM -g hs -n "atf7ip_1" -B -q 0.01
done

for file in *2.sam
do 
	Macs2 callpeak -t "$file" -c Input_2i.sam -f SAM -g hs -n "atf7ip_1" -B -q 0.01
done

#peak annotation

for file in *.narrowPeak
do 
	annotatePeaks.pl "$file" hg38 > "$file"homer.txt
done

#convert bed to fasta for motif 

for file in *.bed
do
	bedtools getfasta -fi mm10.fa -bed "$file" -fo "$file".fa 
done

