# K-Means Clustering Algorithm From Scratch using R Programming Language
K-Means Clustering code from scratch using R programming language.

## Required Packages
`ggplot2` for plotting the clustering result in each iteration

## Dataset
There are 2 sample dataset in this project, they are [dataset 1](https://github.com/liemwellys/K-Means-R-FromScratch/blob/master/test1_data.txt) and [dataset 2](https://github.com/liemwellys/K-Means-R-FromScratch/blob/master/test2_data.txt).<br>
Each dataset consist of *N* rows data and 2 columns represent the *x*-axis and and *y*-axis.

## Running the code
The code is designed to cluster [dataset 2](https://github.com/liemwellys/K-Means-R-FromScratch/blob/master/test2_data.txt) into 3 clusters. If you want to change either dataset or the final number of clusters on another dataset samples, change the following parameters:

### Dataset: 
Change the following [code](https://github.com/liemwellys/K-Means-R-FromScratch/blob/master/K-means.R#L5) in line 5 into desired dataset filename.

```R
test1_data <- read.table("D:/test2_data.txt", quote="\"", comment.char="")
```

### Number of Clusters:
Change the following [code](https://github.com/liemwellys/K-Means-R-FromScratch/blob/master/K-means.R#L10) in line 10-12 into desired number of clusters.

```R
cluster <- 3

c_initial <- c(0,1,2)
```
