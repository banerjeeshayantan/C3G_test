library(ballgown)
bg = ballgown(dataDir="/data/shayantan/sample_ballgoown//", samplePattern='sample', meas='all')
transcript_fpkm = texpr(bg, 'FPKM')
write.table(transcript_fpkm,"FPKM_1000.csv",sep="\t",row.names = FALSE,col.names = TRUE,quote = FALSE)
