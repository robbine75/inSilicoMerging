\name{plotMDS}
\alias{plotMDS}
\title{Create double-labeled MDS plot from (merged) ExpressionSet}
\description{Create Multidimensional Scaling (MDS) plot from ExpressionSet. Very similar to Principal Component Analysis (PCA) plots all samples are plotted in a two-dimensional space where both axis represent the two principle axis of expression variation. In this plot each sample can be labeled with a color and with a symbol.}

\usage{
plotMDS(eset, colLabel, symLabel, legend=TRUE, file=NULL, ...)
}

\arguments{
\item{eset}{ExpressionSet object.}
\item{colLabel}{colname in pData(eset) to retrieve information for the labeling of samples with a color. All samples with the same value in pData(eset)[,colLabel] will share the same color.}
\item{symLabel}{colname in pData(eset) to retrieve information for the labeling of samples with a symbol. All samples with the same value in pData(eset)[,symLabel] will share the same symbol.}
\item{legend}{If TRUE a legend will be provided next to the MDS plot for both colLabel and symlabel.}
\item{file}{If defined, the resulting plot will be stored as a pdf file instead of shown interactively.}
\item{...}{Additional parameters for the 'plot' function (e.g. 'main').}
}

\examples{

# retrieve two datasets:
library(inSilicoDb);
eset1 = getDataset("GSE19804", "GPL570", norm="FRMA", genes=TRUE);
eset2 = getDataset("GSE10072", "GPL96",  norm="FRMA", genes=TRUE);
esets = list(eset1,eset2);

# merge them using the 'NONE' and 'COMBAT' method:
library(inSilicoMerging)
eset_NONE = merge(esets, method="NONE");
eset_COMBAT = merge(esets, method="COMBAT");

# check available annotations:
colnames(pData(eset_NONE))
table(pData(eset_NONE)[,"Disease"]);
table(pData(eset_NONE)[,"Study"]);

# Visual inspection of the two merged datasets through an MDS plot
plotMDS(eset_NONE, colLabel="Disease", symLabel="Study")
plotMDS(eset_COMBAT, colLabel="Disease", symLabel="Study")

}