#Set the stringtie tool to your PATH
#Set the current working directory
WORKDIR=/home/shayantan/GSOC_2020
#Path to the reference GTF file based on the version specified in the paper
ref_GTF_file=/home/shayantan/Mus_musculus.GRCm38.94.gtf
#Path to the two bam files mentioned in the tests
liver_sample_file=$WORKDIR/RNA_nanopore.liver.C1R1_mapping_E94_minimap2_primary_no_read_less_than_80QC_genome_convert.sorted.bam; brain_sample_file=$WORKDIR/RNA_nanopore.brain.C1R1_mapping_E94_minimap2_primary_no_read_less_than_80QC_genome_convert.sorted.bam

#Assembling transcripts for the first sample (Liver C1) using the long read mode
stringtie -L -G $ref_GTF_file $liver_sample_file -o $WORKDIR/sample_liver/liver.gtf
#Assembling transcripts for the second sample (Brain C1) using the long read mode
stringtie -L -G $ref_GTF_file $brain_sample_file -o $WORKDIR/sample_brain/brain.gtf

#Merging the assembled transcripts obtained from the two samples above
stringtie --merge -p 8 -G $ref_GTF_file -o $WORKDIR/merged.gtf $WORKDIR/assembly.txt

#Preparing output for ballgown. This can be done directly using stringtie with the -B command, thereby bypassing tablemaker
stringtie -p 8 -B -G $WORKDIR/merged.gtf -o $WORKDIR/sample_brain/brain.gtf $brain_sample_file
stringtie -p 8 -B -G $WORKDIR/merged.gtf -o $WORKDIR/sample_liver/liver.gtf $liver_sample_file

