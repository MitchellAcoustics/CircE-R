\name{Block}
\alias{Block}
\title{ Intercorrelation of Emotions in a Female Sample (N=48) }
\description{The Osgood's "semantic differential" form was administered to 40 male and 48 female college students in an undergraduate psychologycourse. Fifteen emotions, selected a priori but with the intention of comprehensive coverage of the affective sphere, were used as the concepts to be defined. Each concept was evaluated in terms of twenty connotative 7-point scales. The intercorrelations matrix based upon the female sample is given in this object.}
\usage{
data(Block)
}
\source{
Block, J. (1957). Studies in the phenomenology of emotions. \emph{Journal of Abnormal and Social Psychology}, 54, 358-363.
}
\examples{
data(Block)

Block

block.names=colnames(Block)
block.names

\dontrun{
Block.m.1<-CircE.BFGS(R=Block,v.names=block.names,m=1,N=48,start.values="IFA")
# You will get the following warnings:
# WARNING! 
# INPUT COVARIANCE/CORRELATION MATRIX IS NOT POSITIVE DEFINITE. 
# STARTING VALUES CANNOT BE COMPUTED USING 'IFA': SET start.values='PFA' 
# Error in ifa(R, k) : 
# Make sure the listwise, not pairwise, missing data treatment has been selected 
# in computing the input matrix
#
# The error message reported by CircE highlights that the problem in fitting a CSPMF 
# to Block's data occurs at the early stage of starting values computation. 
# CircE offers a way to sidestep this problem without actually trying to discern its cause: 
# In fact, at this stage, the IFA cannot be carried out since the inverse of the 
# non-positive definite Block's matrix has negative values 
# on the diagonal (Joreskog, 1969, p. 54): 


diag(solve(Block))

# To overcome this problem, CircE offers an alternative ways to obtain initial 
# parameters estimation, based on Principal Factor Analysis (PFA):  

Block.m.1<-CircE.BFGS(R=Block,v.names=block.names,m=1,N=48,start.values="PFA")
}





}