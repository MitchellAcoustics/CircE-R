\name{residual.CircE}
\alias{residual.CircE}
\title{ Sample, reproduced observed scores, reproduced common scores and residual matrices }
\description{
This function produces several matrices useful to assess model fit.
}
\usage{
residual.CircE(object,file=NULL,digits=3)
}
\arguments{
  \item{object}{ a circumplex model produced by \code{CircE.BFGS}. }
  \item{file}{ a connection or a character string naming the file to write to, or NULL (default) for do not send R output to a file. }
  \item{digits}{ number of digits for printed output. }

}
\author{ Michele Grassi \email{grassi.mic@gmail.com}}
\examples{


#______ Vocational Interests Scale: Sample Correlation Matrix. N=175 _____
 
R.vocational=matrix(c(
1,0,0,0,0,0,0,
0.654,1,0,0,0,0,0,
0.453,0.644,1,0,0,0,0,
0.251,0.440,0.757,1,0,0,0,
0.122,0.158,0.551,0.493,1,0,0,
0.218,0.210,0.570,0.463,0.754,1,0,
0.496,0.264,0.366,0.202,0.471,0.650,1
),7,7,byrow=TRUE)
R=R.vocational+t(R.vocational)-diag(diag(R.vocational))

v.names=c("Health","Science","Technology","Trades","Business Operations",
          "Business Contact","Social")
dimnames(R)=list(v.names,v.names)

model=CircE.BFGS(R,v.names,m=3,N=175,r=1)

residual.CircE(model,digits=3)

}


