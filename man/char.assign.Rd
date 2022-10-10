\name{char.assign}
\alias{char.assign}
\title{ Points character and color assignation for CircE.Plot }
\description{
This function allows to quickly assign different point characters and color to the different variables. It is especially useful in working with raw items whose names are usually composed by a serial number and the name of the main variable to which they refer to.
}
\usage{
char.assign(sc.names,v.names,point.char,bg.point)
}
\arguments{
  \item{sc.names}{character string containing the names of the variables to be matched in the given character vector \code{v.names}. It must contains the patterns that identify the variables belongingness in the variable (or items) names.}
  \item{v.names}{a character vector where matches are sought (e.g. the variables (or items) names).}
  \item{point.char}{points character, i.e., symbol to use for each variable.}
  \item{bg.point}{background (fill) color for the open plot symbols given by \code{pch=21:25}. }
}
\details{
 The pattern matching between the character string given in \code{sc.names} and the \code{v.names} is based on \code{\link{grep}} function.
}
\author{ Michele Grassi \email{grassi.mic@gmail.com}}
\examples{

library(CircE)
data(SELF5)
v.names<-names(SELF5)
v.names

RS5<-cor(SELF5,use="pairwise.complete.obs")
RS5<-round(RS5,3)
 \dontrun{
# The "convergence to a solution" requires more than 200 iterations (e.g., set iterlim=250). 
# This is long-running test made optional for checking. 
Child<-CircE.BFGS(R=RS5,v.names=v.names,m=3,N=286,equal.com=FALSE,equal.ang=FALSE,
                  mcsc="unconstrained",iterlim = 250,factr=1e10)
         
# The features of\code{char.assign} can be effectively highlighted limiting the number 
# of iterations allowed (e.g., set iterlim=5). This option makes the example faster.
Child<-CircE.BFGS(R=RS5,v.names=v.names,m=3,N=286,equal.com=FALSE,equal.ang=FALSE,
                  mcsc="unconstrained",iterlim = 5,factr=1e10)

}
# To simplify the assignation of color and character type of each point on the graph, 
# which are required as arguments by the function CircE.Plot(), 
# in the case of a large number of items, the function char.assign() can be used as follows: 
# Supposing that the items are tagged with a reference to the relative scale (e.g., v.names), 
# it is sufficient to create a string with scale names ('sc.names'),

sc.names=c("LM","NO","PA","BC","DE","FG","HI","JK")

# a vector of the same length containing the point characters ('point.char'), 

point.char=c(21,23,16,17,25,24,8,3)

#  and a vector of colors name for filling-in the points ('bg.point');

bg.point=c("white","gray40","black","black","gray80","gray60","black","black")

# The function char.assign() matches scale names with the item names (the vector 'v.names') 
# and assigns appropriate characters and colors automatically. 
# The result is an R object ('A') which contains two vectors of the same length of variable names 
# that will be passed to CircE.Plot().

A<-char.assign(sc.names=sc.names, v.names=v.names, point.char=point.char, bg.point=bg.point)
A$pchar

A$bg.points

\dontrun{
CircE.Plot(Child,pchar=A$pchar,bg.points=A$bg.points,big.points=60,big.labels=40,
           bg.plot="white",col.text="black",twodim=FALSE,labels=FALSE)
}

char<-data.frame(v.names,A$pchar,A$bg.points)
char[order(A$pchar),]


}
