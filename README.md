# BoxSelect
# Language: R
# Input: TXT
# Output: DIR 
# Tested with: PluMA 1.1, R 4.0.0
# Dependencies: ggsci_2.9         hrbrthemes_0.8.0  viridis_0.6.2     viridisLite_0.4.1  gplots_3.1.3      ggpubr_0.5.0      ggplot2_3.4.0

PluMA plugin to generate boxplots for selected data identifiers.

Input is a tab-delimited text file of keyword-value pairs:

assay: File of observables and counts
select: Selected identifiers.  One box plot will be produced per element

Box plots will all be produced in the user-specified output directory, using the identifiers as names 
