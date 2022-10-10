\name{bound.assign}
\alias{bound.assign}
\title{ Bound assignation for polar angles}
\description{
This function allows to quickly assign bound on polar angles estimates.
}
\usage{
bound.assign(sc.names,v.names,lower,upper)
}
\arguments{
  \item{sc.names}{character string containing the names of the variables to be matched in the given character vector \code{v.names}. 
                  It must contains the patterns that identify the variables belongingness in the variable (or items) names.}
  \item{v.names}{a character vector where matches are sought (e.g. the variables (or items) names).}
  \item{lower}{a vector of lower bounds.}
  \item{upper}{a vector of upper bounds.}
}
\author{ Michele Grassi \email{grassi.mic@gmail.com} }
\examples{
data(SELF5)
v.names=names(SELF5)
v.names

sc.names=c("LM","NO","PA","BC","DE","FG","HI","JK")
lower<-c(-22.5,292.5,247.5,202.5,157.5,112.5,67.5,22.5)
upper<-c(22.5,337.5,292.5,247.5,202.5,157.5,112.5,67.5)
B<-bound.assign(sc.names=sc.names,v.names=v.names,lower=lower,upper=upper)

B$upper


B$lower

# Each one of the 48 items (v.names) is provided with an upper and lower bound:

bounds<-data.frame(v.names,B$upper,B$lower)

bounds[order(B$upper),]

}
