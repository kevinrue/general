\name{calculateEiAB}
\alias{calculateEiAB}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Computes the average expression of gene features in each of two conditions.
}
\description{
\code{calculateEiAB} calls twice \code{calculateEiA} to compute the 
average expression of each gene feature in each of the two conditions
compared.}
\usage{
calculateEiAB(eSet, classCol, A, B)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{eSet}{
An object of class \code{ExpressionSet} containing the gene expression data.
}
  \item{classCol}{
The column name in \code{pData(eSet)} which contains the label 
of the condition to subset.
}
  \item{A}{
The label of the first condition to calculate the average expression for.
}
  \item{B}{
The label of the second condition to calculate the average expression for.
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
Matrix of average expression value for each gene feature (rows) present in
\code{rownames(exprs(eSet))} for each of the two conditions considered (columns).
}
\references{
\itemize{
\item{Hudson, N. J., B. P. Dalrymple, et al. (2012). "Beyond differential expression:
the quest for causal mutations and effector molecules." BMC Genomics 13: 356.
{\href{http://www.ncbi.nlm.nih.gov/pubmed/22849396}{Pubmed}}}
\item{Hudson, N. J., A. Reverter, et al. (2009). "A differential wiring analysis of
expression data correctly identifies the gene containing the causal mutation."
PLoS Comput Biol 5(5): e1000382.
\href{http://www.ncbi.nlm.nih.gov/pubmed/19412532}{Pubmed}}
}
}
\author{
Kevin Rue-Albrecht <\href{mailto:kevin.rue@ucdconnect.ie}{email}>
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
Related methods \code{\link{calculateEiA}}, \code{\link{exprs}}, \code{\link{pData}} and class \code{\link{eSet}}. 
}
\examples{
calculateEiA(eSet, "Treatment", "infected", "control")

## The function is currently defined as
function (eSet, classCol, A, B) 
{
    EiAB = calculateEiA(eSet, classCol, A)
    EiAB = cbind(EiAB, calculateEiA(eSet, classCol, B))
    colnames(EiAB) = c(A, B)
    return(EiAB)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ Hudson }
\keyword{ RIF }