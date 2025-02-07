####################################################################################
# cleanup of RNU2-2P sanger masterlist
library(data.table)
library(dplyr)
library(readxl)

rnu <- as.data.frame(fread("/Users/claflamm/Downloads/RNU2-2P_samples_to_run.txt")) # import the cleaned table
dim(rnu) # 1432
length(unique(rnu$Sample_Name)) #1056 unique patients

# collapse over duplicates in the Patient ID column; nest everything else separated by a comma
rnu.collapsed <- as.data.frame(rnu %>% group_by(Sample_Name) %>% summarise(across(everything(), ~paste0(unique(.), collapse = "|"))))
dim(rnu.collapsed) # 1056 entries

lguru <- as.data.frame(read_excel("/Users/claflamm/Downloads/2025-01-28_at_01_48_04440PM_Generic.xlsx")) #this is lab guru export from all samples from 1/28/25
lguru <- lguru[,c("Name *", "Sex", "Solved", "Solved Gene", "Whole Genome sequenced")]
lguru <- unique(lguru)
head(lguru) 
dim(lguru) 

rnu.collapsed.annotated <- merge(rnu.collapsed, lguru, by.x = "Sample_Name", by.y = "Name *", all.x = T, all.y = F)
dim(rnu.collapsed.annotated )

# add column for double checking mefford WGS sheet
wgs <- as.data.frame(fread("/Users/claflamm/Downloads/Mefford_WGS.txt"))
rnu.collapsed.annotated$MeffWGSsheet <- ifelse(rnu.collapsed.annotated$Sample_Name %in% wgs$Sample_ID, "Yes", "No")
dim(rnu.collapsed.annotated )

write.table(rnu.collapsed.annotated, file = "/Users/claflamm/Downloads/RNU2-2P_masterlist_collapsed_annotated.txt", sep = "\t", quote = F, row.names = F)
