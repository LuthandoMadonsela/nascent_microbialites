#ANOSIM ANALYSIS: 2019 (TABLE_S3)

#Find unique groups in data
groups = unique(abund[c("Location")])
group_list = as.list(groups$Location)

#Calculate pairwise ANOSIM statistics
for (i in group_list) {
  for (j in group_list) {
    if (i==j) next
    sub_df1 = subset(abund, subset=(Location==i))
    sub_df2 = subset(abund, subset=(Location==j))
    sub_df = rbind(sub_df1, sub_df2)
    nums = sub_df[,3:ncol(sub_df)]
    nums_matrix = as.matrix(nums)
    set.seed(123)
    ano = anosim(nums_matrix, sub_df$Location, distance = "bray", permutations = 9999)
    Rvalue = ano$statistic
    pvalue = ano$signif
    cat(i,"\t",j ,"\tR-value:\t", Rvalue, "\tP-value:\t", pvalue, '\n')
    
  }
}


#ANOSIM ANALYSIS: 2019-2022 (TABLE_S5)
#Calculate pairwise ANOSIM scores, grouped by location

#Find unique groups in data
groups = unique(abund[c("Location")])
group_list = as.list(groups$Location)

#Calculate pairwise ANOSIM statistics
for (i in group_list) {
  for (j in group_list) {
    if (i==j) next
    sub_df1 = subset(abund, subset=(Location==i))
    sub_df2 = subset(abund, subset=(Location==j))
    sub_df = rbind(sub_df1, sub_df2)
    nums = sub_df[,4:ncol(sub_df)]
    nums_matrix = as.matrix(nums)
    set.seed(123)
    ano = anosim(nums_matrix, sub_df$Location, distance = "bray", permutations = 9999)
    Rvalue = ano$statistic
    pvalue = ano$signif
    cat(i,"\t",j ,"\tR-value:\t", Rvalue, "\tP-value:\t", pvalue, '\n')
    
  }
}

#Calculate pairwise ANOSIM scores, grouped by time

#Find unique groups in data
groups = unique(abund[c("Time")])
group_list = as.list(groups$Time)

#Calculate pairwise ANOSIM statistics
for (i in group_list) {
  for (j in group_list) {
    if (i==j) next
    sub_df1 = subset(abund, subset=(Time==i))
    sub_df2 = subset(abund, subset=(Time==j))
    sub_df = rbind(sub_df1, sub_df2)
    nums = sub_df[,4:ncol(sub_df)]
    nums_matrix = as.matrix(nums)
    set.seed(123)
    ano = anosim(nums_matrix, sub_df$Time, distance = "bray", permutations = 9999)
    Rvalue = ano$statistic
    pvalue = ano$signif
    cat(i,"\t",j ,"\tR-value:\t", Rvalue, "\tP-value:\t", pvalue, '\n')
    
  }
}
