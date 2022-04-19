d1=read.table("student-mat.csv",sep=";",header=TRUE)
d2=read.table("student-por.csv",sep=";",header=TRUE)

d3=merge(d1,d2,by=c("school","sex","age","address","famsize","Pstatus","Medu","Fedu","Mjob","Fjob","reason","nursery","internet"))
print(nrow(d3)) # 382 students

S1 <- c()
for (i in 1:nrow(d1)){
  S1[i] <- (1+ (((d1$G2[i] - d1$G1[i]) + (d1$G3[i] - d1$G2[i])/2)/20)) * d1$G3[i]
}

S2 <- c()
for (l in 1:nrow(d2)){
  S2[l] <- (1+ (((d2$G2[l] - d2$G1[l]) + (d2$G3[l] - d2$G2[l])/2)/20)) * d2$G3[l]
}

d1.new <- cbind(d1, S1)
d2.new <- cbind(d2, S2)

Care_level1 <- c()
for (m in 1:nrow(d1)){
  if (S1[m] > 14){
    Care_level1[m] <- "Not Required"
  }
  if (S1[m] > 7&& S1[m]<=14){
    Care_level1[m] <- "Required"
  }
  else {
    Care_level1[m] <- "Critical"
  }
    
}

Care_level2 <- c()
for (n in 1:nrow(d2)){
  if (S2[n] > 14){
    Care_level2[n] <- "Not Required"
  }
  if (S2[n] > 7 && S2[n]<=14){
    Care_level2[n] <- "Required"
  }
  else {
    Care_level2[n] <- "Critical"
  }
  
}

d1.new <- cbind(d1.new, Care_level1)
d2.new <- cbind(d2.new, Care_level2)
