library("lpSolve")
c=rep(c(2000,2500,5000,3500),3)
c
b=c(10,8,12,5000,4000,8000,18,10,5,20)
b
V=c(400,300,200,500)

A=matrix(0,10,12)
#fill matrix A with weightconstraints
A[1,1:4] = 1
A[2,5:8]=1
A[3,9:12]=1
#this is the volume constraint
A[4,1:4]=V
A[5,5:8]=V
A[6,9:12]=V

#fills with diagonal one values in matrix A
#availability constraint
A[7:10,1:4]=diag(4)
A[7:10,5:8]=diag(4)
A[7:10,9:12]=diag(4)

dir = rep("<=",10)
s=lp("max",c,A,dir,b)
#tells us the optimal mix of the variables
s$solution
#total amount of profit you will make
s$objval
s$status
#for s$status you want 0;0 means it has converged and is successful
#1 means its supobtimal

#2 means infeasible (caused by a bug in your code)

#3 means unbounded (infinite)
  #- caused by bug in code OR by error in problem formulation (not taking 
  #certain real world constrains into consideration)