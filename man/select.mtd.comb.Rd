% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/select.mtd.comb.R
\name{select.mtd.comb}
\alias{select.mtd.comb}
\title{Select the maximum tolerated dose (MTD) or MTD contour for drug combination trials}
\usage{
select.mtd.comb(
  target,
  npts,
  ntox,
  cutoff.eli = 0.95,
  extrasafe = FALSE,
  offset = 0.05,
  boundMTD = FALSE,
  p.tox = 1.4 * target,
  mtd.contour = FALSE
)
}
\arguments{
\item{target}{the target DLT rate}

\item{npts}{a \code{J*K} matrix \code{(J<=K)} containing the number of patients treated at each dose combination}

\item{ntox}{a \code{J*K} matrix \code{(J<=K)} containing the number of patients experienced
dose-limiting toxicity at each dose combination}

\item{cutoff.eli}{the cutoff to eliminate an overly toxic dose for safety.
We recommend the default value of (\code{cutoff.eli=0.95})
for general use.}

\item{extrasafe}{set \code{extrasafe=TRUE} to impose a more strict stopping
rule for extra safety}

\item{offset}{a small positive number (between \code{0} and \code{0.5}) to control how
strict the stopping rule is when \code{extrasafe=TRUE}. A
larger value leads to a more strict stopping rule. The
default value \code{offset=0.05} generally works well.}

\item{boundMTD}{set \code{boundMTD=TRUE} to impose the condition: the isotonic estimate of toxicity
probability for the selected MTD must be less than de-escalation boundary.}

\item{p.tox}{the lowest toxicity probability that is deemed overly toxic such
that deescalation is required. The default value is
  \code{p.tox=1.4*target}.}

\item{mtd.contour}{set \code{mtd.contour=TRUE} to select the MTD contour,
otherwise select a single MTD. The value of \code{mtd.contour}
should be consistent with that in \code{get.oc.comb()}.}
}
\value{
\code{select.mtd.comb()} returns returns (1) target toxicity probability (\code{$target}),
(2) selected MTD or MTD contour (\code{$MTD}),
(3) isotonic estimate of the DLT probablity at each dose (\code{$p_est}).
}
\description{
Select the maximum tolerated dose (MTD) or MTD contour after the drug combination trial is
completed using the BOIN design or waterfall design
}
\details{
\code{select.mtd.comb()} selects a MTD or the MTD contour based
         on matrix isotonic estimates of toxicity probabilities, depending on
         \code{mtd.contour} is set as \code{TRUE} or \code{FALSE}. The (matrix)
         isotonic estimates are obtained by the R package (Iso::biviso).
}
\note{
The MTD selection and dose escalation/deescalation rule are two independent
      components of the trial design. When appropriate, another dose selection
      procedure (e.g., based on a fitted logistic model) can be used to select
      the MTD after the completion of the trial using the BOIN or waterfall design.
}
\examples{

### drug-combination trial to find a single MTD

## Select the MTD based on the data from a 3x5 combination trial
## matrix n contains the number of patients treated at each dose combination
## matrix y contains the number of patients experienced toxicity at each dose combination
n <- matrix(c(3, 5, 0, 0, 0, 7, 6, 15, 0, 0, 0, 0, 4, 0, 0), ncol=5, byrow=TRUE)
y <- matrix(c(0, 1, 0, 0, 0, 1, 1, 4, 0, 0, 0, 0, 2, 0, 0), ncol=5, byrow=TRUE)
sel.comb <- select.mtd.comb(target=0.3, npts=n, ntox=y)
summary(sel.comb)
plot(sel.comb)


### drug-combination trial to find the MTD contour

## Select the MTD contour based on the data from a 3x4 combination trial
## matrix n contains the number of patients treated at each dose combination
## matrix y contains the number of patients experienced toxicity at each dose combination
n <- matrix(c(6, 9, 24, 0,  6, 24, 9, 0,  12, 18, 0, 0), ncol=4, byrow=TRUE)
y <- matrix(c(0, 1,  5, 0,  1,  5, 4, 0,  1, 5, 0, 0), ncol=4, byrow=TRUE)
sel.comb2 <- select.mtd.comb(target=0.3, npts=n, ntox=y, mtd.contour=TRUE)
summary(sel.comb2)
plot(sel.comb2)

}
\references{
Liu S. and Yuan, Y. (2015). Bayesian Optimal Interval Designs for Phase I Clinical
            Trials, \emph{Journal of the Royal Statistical Society: Series C}, 64, 507-523.

           Lin R. and Yin, G. (2017). Bayesian Optimal Interval Designs for Dose Finding in
           Drug-combination Trials, \emph{Statistical Methods in Medical Research}, 26, 2155-2167.

           Yan, F., Zhang, L., Zhou, Y., Pan, H., Liu, S. and Yuan, Y. (2020).BOIN: An R Package
           for Designing Single-Agent and Drug-Combination Dose-Finding Trials Using Bayesian Optimal
           Interval Designs. \emph{Journal of Statistical Software}, 94(13),1-32.<doi:10.18637/jss.v094.i13>.


           Zhang L. and Yuan, Y. (2016). A Simple Bayesian Design to Identify the Maximum
           Tolerated Dose Contour for Drug Combination Trials, \emph{Statistics in Medicine}, 35, 4924-4936.
}
\seealso{
Tutorial: \url{http://odin.mdacc.tmc.edu/~yyuan/Software/BOIN/BOIN2.6_tutorial.pdf}

          Paper: \url{http://odin.mdacc.tmc.edu/~yyuan/Software/BOIN/paper.pdf}
}
\author{
Suyu Liu, Liangcai Zhang, Yanhong Zhou, and Ying Yuan
}
