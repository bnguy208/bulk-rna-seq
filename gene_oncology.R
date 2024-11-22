install.packages("BiocManager")
BiocManager::install("clusterProfiler")
BiocManager::install("AnnotationDbi")
BiocManager::install("org.Mm.eg.db")  # Mouse database

rm(list = ls())

setwd('/Volumes/homes/TalbotLab/Current_Lab_Members/Brandon_Nguyen/Collaborations/JD005-JD008/JD005')

# Load libraries
library(clusterProfiler)
library(org.Mm.eg.db)  # Mouse-specific database
library(AnnotationDbi)
library(ggplot2)

# Get significant genes with a log2FoldChange > 0.5
sig_df = read.csv('sig_fed_all_tissues.csv', row.names = 1)
genes_to_test <- rownames(sig_df)

# Ensure your gene IDs match the keyType of the database
# For example, if they are SYMBOLs or ENSEMBL IDs
genes_to_test <- AnnotationDbi::select(org.Mm.eg.db, 
                                       keys = genes_to_test, 
                                       columns = "SYMBOL", 
                                       keytype = "SYMBOL")
genes_to_test <- unique(genes_to_test$SYMBOL)  # Remove duplicates

# Perform GO enrichment analysis for mouse genes
GO_results <- enrichGO(gene = genes_to_test, OrgDb = "org.Mm.eg.db", keyType = "SYMBOL", ont = "BP")

# Convert GO results to a data frame
GO_df <- as.data.frame(GO_results)

# Sort the GO results by Count in descending order
GO_df <- GO_df %>% arrange(desc(Count))

# Plot bar chart of GO results
barplot_data <- GO_results
barplot_data@result <- GO_df  # Replace the result slot with the sorted data

# Plot bar chart of GO results
fit <- plot(barplot(barplot_data, showCategory = 15) + 
  theme(axis.text.y = element_text(size = 7)))

png("mouse_fed_all_tissues_GO_out.png", res = 250, width = 1400, height = 1800)
print(fit)
dev.off()
