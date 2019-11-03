#library for plot
require(ggplot2)

#import test data
test1_data <- read.table("D:/test2_data.txt", quote="\"", comment.char="")

test1_data <- as.matrix(test1_data)

#number of cluster
cluster <- 3

c_initial <- c(0,1,2)

#first centroid = first 2 data
centroid <- test1_data[1:cluster,]
cent_DF <- data.frame(c = c_initial, centroid)

d <- matrix(0, nrow = nrow(test1_data), ncol = cluster)

#creating 0 vector for containing cluster number
c <- matrix(0, nrow = nrow(test1_data), ncol = 1)

#creating 0 matrix for temporary variable
updCentroid <- matrix(0, nrow = nrow(centroid), ncol = ncol(test1_data))

#stopping criteria for converged centroids
status <- 10

#variable for counting iteration until the cluster converged
iter <- 0

df <- data.frame(test1_data)

initPlot <- ggplot(df,aes(V1, V2)) +
  geom_point(size=3)+ geom_point(data=cent_DF, color=c(2,3,4) , size=10)

ggsave(initPlot, file = "Data 2, 3 Cluster - initial.png", width = 40, height = 20, units = "cm")

while (status != 0)
{
  iter <- iter + 1
  
  fn <- paste("Data 2,", cluster, "Cluster - iter", iter, ".png", sep = " ")
  
  #calculate distance each data to each centroid
  for (j in 1:cluster)
  {
    for (i in 1:nrow(test1_data))
    {
      d[i,j] = sqrt(sum((test1_data[i,1:ncol(test1_data)] - centroid[j,1:ncol(centroid)])^2))
    }
  }
  
  #assign cluster number on each data
  for(i in 1:nrow(d))
  {
    # if (d[i,1] < d[i,2]) c[i] = 0
    # else c[i] = 1
    
    c[i] <- (which(d[i,] == min(d[i,]), arr.ind = T)) - 1
  }
  
  #plot the clustering result
  df <- data.frame(c,test1_data)
  cent_DF <- data.frame(c = c_initial, centroid)
  # gg <- merge(df,aggregate(cbind(mean.V1=V1, mean.V2=V2)~c , df, mean), by="c")
  gg <- merge(df, cent_DF, by="c")

  plot <- ggplot(gg, aes(V1.x, V2.x, color=factor(c))) + geom_point(size=3) +
    geom_point(aes(x = V1.y, y = V2.y),size=5) +
    geom_segment(aes(x = V1.y, y = V2.y, xend = V1.x, yend = V2.x))

  ggsave(plot, file = fn, width = 40, height = 20, units = "cm")

  #calculate the new centroid based on new clustered data
  compare <- cbind(test1_data, c)
  
  for (i in 1:cluster)
  {
    x <- subset(compare[,1:2], compare[,3] == i-1)
    
    for(j in 1:ncol(test1_data))
    {
      updCentroid[i,j] <- mean(x[,j])
    }
  }
  
  #update the current centroid
  for (i in 1:cluster)
  {
    for (j in 1:ncol(centroid))
    {
      if (updCentroid[i,j] != centroid[i,j])
      {
        status <- 1
        centroid[i,j] <- updCentroid[i,j]
      }
      else status <- 0
    }
  }
}
