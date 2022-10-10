\name{CircE.Plot}
\alias{CircE.Plot}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ Circumplex Estimates Plot }
\description{
  \code{CircE.Plot} produces the graphical representations of the estimated circular position of the variables and the Fourier correlation function. The function uses \code{\link{dev.new}} to create two different devices preserving an appropriate aspect ratio.
}
\usage{
CircE.Plot(object, pchar = NULL, bg.points = "red", ef = 0.4, big.points = 10, 
	   big.labels = 10, bg.plot = "gray80", col.axis = "black", color = "black", 
	   col.text = "white",twodim=TRUE,bound=TRUE,labels=TRUE,reverse=FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{object}{ a circumplex model produced by \code{CircE.BFGS}. }
  \item{pchar}{ plotting character, i.e., symbol to use. It can be either   a single value or a vector of length equal to numbers of variables used in correlation matrix. For further details see \code{?par}.  }
  \item{bg.points}{ background color for the symbols selected with \code{pchar}. Either a single value or a vector of color.}
  \item{ef}{ "explosion factor". It specifies the distances at which the name of the variables are drawn around the circumference. Default to 0.4 (if negative labels are drawn inside the circumference).}
  \item{big.points, big.labels}{ numerical values giving the amount by which plotting labels and symbols should be magnified relative to the default (\code{cex} = 1/(number of observed variables)). }
  \item{bg.plot}{ background color of the plot region. }
  \item{col.axis}{ the color to be used for axis annotation, axis line and labels. }
  \item{color}{the color to be used for plot lines and symbols foreground. }
  \item{col.text}{ the color to be used for plot texts. }
  \item{twodim}{ logical. If \code{FALSE} (default), two reference axes are drawn.}
  \item{bound}{ logical. If arguments \code{upper} and \code{lower} in \code{object} are not NULL, the bound lines are drawn on the circumference. Default is \code{TRUE}. }
  \item{labels}{ logical. If \code{TRUE} (default), variable labels are reported in the plot.}
  \item{reverse}{ logical. If \code{TRUE}, plot the figure using the 360-angular positions (just reversing the circular order).}
}
\author{ Michele Grassi \email{grassi.mic@gmail.com}}
\seealso{ See Also \code{\link{plot}}, \code{\link{points}}, \code{\link{par}}. }
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

\dontrun{

model=CircE.BFGS(R,v.names,m=3,N=175,r=1)

CircE.Plot(object=model, pchar = 24, bg.points = "transparent", ef = -0.4, 
           big.points = 15, big.labels=6, bg.plot = "white", col.axis = "black", 
           color = "black", col.text = "black",
           twodim=FALSE,bound=TRUE,labels=TRUE)
         }




#______________ Block's correlation matrix. N=48 ________

data(Block)
block.names=colnames(Block)

\dontrun{

Block.m.1<-CircE.BFGS(R=Block,v.names=block.names,m=1,N=48,start.values="PFA")

CircE.Plot(object=Block.m.1, pchar = 24, bg.points = "gray", ef = -0.4, 
           big.points = 25, big.labels=15, bg.plot = "orange", col.axis = "blue", 
           color = "black", col.text = "red",
           twodim=FALSE,bound=TRUE,labels=TRUE)


CircE.Plot(object=Block.m.1, pchar = 21, bg.points = "red", ef = -0.4, 
           big.points = 25, big.labels=15, bg.plot = "white", col.axis = "black", 
           color = "black", col.text = "white",
           twodim=FALSE,bound=TRUE,labels=TRUE)


CircE.Plot(object=Block.m.1, pchar = 21, bg.points = "red", ef = -0.2, 
           big.points = 25, big.labels=15, bg.plot = "black", col.axis = "green", 
           color = "white", col.text = "yellow",
           twodim=FALSE,bound=TRUE,labels=TRUE)
}
}

