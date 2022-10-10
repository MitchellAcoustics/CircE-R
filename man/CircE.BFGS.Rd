\name{CircE.BFGS}
\alias{CircE.BFGS}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ Circumplex models estimation }
\description{
  This function fits circumplex models for correlation matrices as described in Browne (1992). Results are convergent with those obtained using CIRCUM program wrote by Michael W. Browne and Stephen H.C. Du Toit (1992), available for download at this address \url{http://faculty.psy.ohio-state.edu/browne/software.php}. 
}
\usage{
CircE.BFGS(R, v.names, m, N, r = 1, equal.com = FALSE, equal.ang = FALSE, 
           mcsc = "unconstrained", start.values="IFA",ci.level=0.95,factr = 1e+09, 
           pgtol = 0, lmm = NULL, iterlim = 250, upper = NULL, lower = NULL,  
           print.level = 1, file = NULL, title = "Circumplex Estimation",
           try.refit.BFGS=FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{R}{ input covariance/correlation matrix. If the matrix is obtained trough \code{\link{cov}} or \code{\link{cor}}, the precision to be used (decimal places) must be specified with \code{\link{round}}.}
  \item{v.names}{ a string that contains the name of the variable used in R.}
  \item{m}{ numbers of betas to use in the Fourier correlation function. }
  \item{N}{ number of observation. }
  \item{r}{ the reference variable in the correlation matrix. This variable will be positioned at 0 degree. }
  \item{equal.com}{ logical: does the communality (radius length) for each variable have to been considered as equal? Default \code{equal.com=FALSE}.}
  \item{equal.ang}{ logical: does the circular position of the variables have to been considered as equal spaced? Default \code{equal.ang=FALSE}. }
  \item{mcsc}{ minimum common score correlation value: \code{"unconstrained"} (default), \code{"-1"} or \code{"0"}. }
  \item{start.values}{ if \code{start.values="IFA"} (default), initial estimates are provided by the factor analysis method described in Browne (1992; section 6.7) and based on Image Factor Analysis  (IFA). When the input covariance/correlation matrix is not positive definite, the IFA cannot be carried out; in this case the Principal Factor Analysis (PFA) supply likely starting values  (\code{start.values="IFA"}).}
  \item{ci.level}{ level for confidence interval for the parameter estimates (default is .95). }
  \item{factr}{ controls the convergence of the "L-BFGS-B" method. Convergence occurs when the reduction in the objective is within this factor of the machine tolerance. Default is 1e09, that is a tolerance of about 2e-07. }
  \item{pgtol}{ helps control the convergence of the "L-BFGS-B" method. It is a tolerance on the projected gradient in the current search direction. This defaults to zero, when the check is suppressed.}
  \item{lmm}{ is an integer giving the number of BFGS updates retained in the "L-BFGS-B" method. It defaults to number of free parameters estimated. }
  \item{iterlim}{ maximum number of iterations. }
  \item{upper,lower}{ Bounds on the variables for the "L-BFGS-B" method. See \code{\link{bound.assign}}}
  \item{print.level}{ Integer. Higher values may produce more tracing information on the progress of the optimization (\code{print.level=0} no information is generated,\code{print.level=1} print \eqn{F} value at every iterations, \code{print.level=3} print \eqn{F} and also \eqn{||proj g||}).}
  \item{file}{ a connection or a character string naming the file to write to, or NULL (default) for do not send R output to a file. }
  \item{title}{ title for the output (for identification purpose). }
  \item{try.refit.BFGS}{ if \code{TRUE}, attempt to refit the model removing default box constraints on z,v, and a parameters, if L-BFGS-B fails to converge.  }
}
\details{
  Optimization is based on L-BFGS-B algorithm. See \code{\link{optim}} for further details.
}

\value{
  \item{AGFI }{adjusted goodness-of-fit index}
  \item{AIC }{Akaike Information Criterion}
  \item{BCI }{ECVI- expected cross-validation index}
  \item{BIC }{Schwarz's Bayesian Information Criterion}
  \item{CAIC }{Bozdogans's Consistent AIC }
  \item{CFI }{Bentler CFI}
  \item{CNI }{Hoelter's critical N (CN) index}
  \item{Cs }{reproduced covariance matrix}
  \item{Fzero }{population discrepancy function value; point estimate}
  \item{Fzero.L }{population discrepancy function value; lower 90\% confidence limit}
  \item{Fzero.U }{population discrepancy function value; upper 90\% confidence limit}
  \item{GFI }{goodness-of-fit index}
  \item{MCSC }{minimum common score correlation}
  \item{NFI }{Bentler-Bonnett NFI}
  \item{NNFI }{Tucker-Lewis TLI (or NNFI)}
  \item{Pc }{reproduced common score correlation matrix}
  \item{R }{observed covariance/correlation matrix}
  \item{RMSEA }{root mean square error of approximation; point estimate}
  \item{RMSEA.L }{root mean square error of approximation; lower 90\% confidence limit}
  \item{RMSEA.U }{root mean square error of approximation; upper 90\% confidence limit}
  \item{S }{reproduced correlation matrix}
  \item{SRMR }{standardized root mean squared residual}
  \item{beta }{Fourier correlation function's betas}
  \item{chisq }{the chisquare test statistic for the model}
  \item{chisqNull }{the chisquare value associated with a null model in which all of the observed variables are uncorrelated}
  \item{coeff }{ data frame containing parameters value and their standard errors after convergence}
  \item{communality }{communality values for each observed variable}
  \item{communality.index }{communality index values for each observed variable}
  \item{criterion }{sample discrepancy function value}
  \item{d }{degree of freedom of the model}
  \item{dfNull }{degree of freedom of the Null model}
  \item{equal.ang }{if \code{TRUE}, the variables are constrained to be equally distributed on the circumference. The default is \code{FALSE}}
  \item{equal.com }{if \code{TRUE}, the communality indices are constrained to be equal. The default is \code{FALSE}}
  \item{m }{number of free parameters in the Fourier correlation function}
  \item{n }{number of observations}
  \item{polar.angles }{data frame containing the estimated polar angles, the lower (L) and the upper (U) limits of an approximate  95\% confidence interval for each variable}
  \item{q }{effective number of parameters}
  \item{residuals }{The residuals are defined as R - S (or R- Cs), where R is the sample correlation (or sample covariance) matrix of the observed variables and S (or Cs) is the model-reproduced correlation (or covariance) matrix}
  \item{standardized.residuals }{The standardized residual covariance for a pair of variables divides the residual covariance by the product of the sample standard deviations of the two variables}
  \item{v.names }{variable names}
   }


\references{  Grassi, M., Luccio, R., \& Di Blas, L. (2010) CircE: An R implementation of Browne's circular stochastic process model. \emph{Behavior Research Methods}, 42(1), pp. 55-73.\cr
	      Browne, M. W. (1992) Circumplex models for correlation matrices. \emph{Psychometrika}, 57, pp. 469-497.\cr
              Browne, M. W., \& Du Toit, S. H. C. (1992) Automated fitting of nonstandard models. \emph{Multivariate  Behavioral Research}, 27, pp. 269-300.\cr

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


#______ Some useful residual matrix with residual.CircE() function...

residual.CircE(model,digits=3)

#______ Save output on .txt file at the current directory ___________________
# get current directory
getwd()

# save the example.txt file at the current directory with 
\dontrun{
CircE.BFGS(R,v.names,m=3,N=175,r=1,file="example CircE.BFGS.txt")
}
 }
