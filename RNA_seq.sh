# RNAseq

#trimming

cd /Users/Your_route
for file in *.fastq
do
	java -jar trimmomatic-0.36.jar SE -phred33 ~/"$file" ~/"t2$file" ILLUMINACLIP:NexteraPE-PE.fa:2:30:10 LEADING:38 TRAILING:35 SLIDINGWINDOW:4:20 MINLEN:36
done

#mapping

for folder in /Users/Your_route* #this paired end data was separated by folders 
do
	fol=$(echo "$folder" | tail -c 3) #
	./hisat2 -q -x ~/genome -1 "$folder"/*_1.fq.gz -2 "$folder"/*_2.fq.gz -S ~/"$fol".sam
done

#alignment

cd /Users/Your_route/subread/bin
./featureCounts -t exon -g gene_id -a RefFlat_hg38.gtf -o counts.txt ~/path_to_samfiles/*.sam

