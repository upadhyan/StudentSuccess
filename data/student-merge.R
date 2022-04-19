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
