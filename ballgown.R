library(ballgown)
#The samples are stored in two seperate folders sample_brain and sample_liver for ballgown to access
bg = ballgown(dataDir="/data/shayantan/sample_ballgoown//", samplePattern='sample', meas='all')
#storing the fpkms in transcript_fpkm variable
transcript_fpkm = texpr(bg, 'FPKM')
#writing the results of the first 1000 lines of the transcript_fpkm
write.table(transcript_fpkm[1:1000],"FPKM_1000.csv",sep="\t",row.names = FALSE,col.names = TRUE,quote = FALSE)
