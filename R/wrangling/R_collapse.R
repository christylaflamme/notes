# cleanup of RNU2-2P sanger masterlist

library(data.table)
library(dplyr)

rnu <- as.data.frame(fread("/Users/claflamm/Downloads/RNU2-2P_masterlist.txt")) # import the cleaned table
rnu <- rnu %>% filter(!Sample_Name == c("BLANK", "NTC")) # remove instances of negative controls
dim(rnu) # 1130
length(unique(rnu$Sample_Name)) #796 unique patients
rnu$Sample_Order <- 1:nrow(rnu)

# collapse over duplicates in the Patient ID column; nest everything else separated by a comma
rnu.collapsed <- as.data.frame(rnu %>% group_by(Sample_Name) %>% summarise(across(everything(), ~paste0(unique(.), collapse = "|"))))
dim(rnu.collapsed) # 796 entries
# rnu.collapsed <- rnu.collapsed[order(rnu.collapsed$Sample_Order),]

write.table(rnu.collapsed, file = "/Users/claflamm/Downloads/RNU2-2P_masterlist_collapsed.txt", sep = "\t", quote = F, row.names = F)
