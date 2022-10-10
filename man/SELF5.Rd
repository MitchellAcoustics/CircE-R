\name{SELF5}
\alias{SELF5}
\title{ Child Interpersonal Circumplex data}
\description{
This data set contains 286 self-reports provided by 5th grade children who rated their interpersonal behavior along 48 items, i.e. six items for each of eight scales octants, conceptually organized around Dominance (DOM) and Love (LOV) domains according to Wiggins' interpersonal circumplex (IPC) model (Wiggins, 1979; Wiggins & Trapnell, 1996). Briefly, Wiggins' model is based on the idea that people in interaction attempt to negotiate relations of hierarchy and cooperation by granting or denying the resources of power (Dominance) and warmth (Love). Accordingly, the IPC model differently combines elements of the reference axes (DOM and LOV) and defines eight possible interpersonal styles circularly ordered around DOM and LOV in compliance with a law of neighboring, positing that two variables are neighbors if they share more variance with each other than with other variables. 
}
\usage{data(SELF5)}
\references{
Di Blas, L., Grassi, M., Luccio, R., Momente', S. (2012). Assessing the Interpersonal Circumplex Model in Late Childhood: The Interpersonal Behavior Questionnaire for Children. \emph{Assessment}, 19(4), pp. 421-441.\cr
Wiggins, J. S.(1979). A psychological taxonomy of trait-descriptive terms: The interpersonal domain. \emph{Journal of Personality and Social Psychology}, 37 (6), 395-412.\crWiggins, J. S., & Trapnell, P. (1996). A dyadic-interactional perspective on the five-factor model. In J. S. Wiggins (Ed.), \emph{The five-factor model of personality} (pp. 88-162). New York: The Guilford Press.\cr
}
\examples{
data(SELF5)

 dim(SELF5)

 RS5<-cor(SELF5,use="pairwise.complete.obs")

 colnames(RS5)

}