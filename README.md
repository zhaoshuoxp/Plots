# Rplots-NGS

----

This repository contains R scripts for data visualizing with ggplot2, gplots, pheatmap and DESeq2 packages.

* DEseq2.R: a independent R script seperated from [RNAseq pipeline](https://github.com/zhaoshuoxp/Pipelines-Wrappers#rnaseqsh).

* GO_BP_bubble.R: bubble plot for DAVID GO analysis in Biological Processes category.
* GO_KEGG_bubble.R: bubble plot for DAVID GO analysis in KEGG pathways category.
* GO_GAD_bubble.R: bubble plot for DAVID GO analysis in Genetic Associated Diseases category.

* GO_MF_bubble.R: bubble plot for DAVID GO analysis in Molecular Function category.

* GO_barplot.R: barplot for any GO analysis in multiple categories.
* barplot.R, boxplot.R, lineplot.R, ggplot.R, histogram.R, heatmap.R:  bar/box/line/plot/histogram/heatmap for customized data.
* cisVar_pvalues.R: double Y-axis for [enrich_pvalues](https://github.com/TheFraserLab/enrich_pvalues) analysis of [cisVar output](https://github.com/TheFraserLab/cisVar).

> Requirements:
>
> R, DESeq2 and its dependents, ggplot2, gplots, pheatmap.



----

## DEseq2.R

A DEseq2 script to run differential expression genes analysis.

#### Input

* featureCounts output.
* a condition text file, see [RNAseq.sh](https://github.com/zhaoshuoxp/Pipelines-Wrappers#rnaseqsh).

#### Usage

```shell
./DEseq2.R featureCounts.txt conditions.txt
```

> NOTE: This script cannot compare the DE genes condition by condition automatically if you have >2 conditions to compare, uncoment line26 and edit the condition names.

#### Output

* all_genes_exp.txt

See more about [DESeq2](https://bioconductor.org/packages/release/bioc/html/DESeq2.html).



----

## GO_BP/KEGG/GAD/MF_bubble.R

These scripts directly use the text output of [DAVID](https://david.ncifcrf.gov) without any format convert.

Just run with the input file:

```shell
./GO_BP_bubble.R BP.txt
```

The output will be BP.png

> You might want to change the height and width on line8 and 9 to adjust the figure and text size.

![BP](/Users/Aone/Documents/Bioinf/R/assets/BP.png)

* X-axis indicates -log*P values*.
* Y-axis indicates terms.
* Color indicates fold enrichment.
* Bubble size indicates enriched gene number.



----

## GO_barplot.R

A tab-delimited text file with 3 columns and headers (Term, group and Pvalue):

```R
Term	group	Pvalue						
platelet degranulation	Biological Process	1.61847E-06						
blood vessel endothelial cell migration	Biological Process	4.93053E-05						
actin filament bundle assembly	Biological Process	8.65968E-05						
abnormal wound healing	Mouse Phenotype	1.64E-11						
abnormal cell adhesion	Mouse Phenotype	1.46E-08						
delayed wound healing	Mouse Phenotype	2.12628E-06						
abnormal vascular wound healing	Mouse Phenotype	8.71974E-05						
abnormal choroid vasculature morphology	Mouse Phenotype	0.000175231						
impaired wound healing	Mouse Phenotype	0.000184417						
Genes involved in Smooth Muscle Contraction	MSigDB Pathway	6.40E-09						
AP-1 transcription factor network	MSigDB Pathway	1.93489E-06						
Transcriptional targets of AP1 family members Fra1 and Fra2	MSigDB Pathway	4.56405E-06			
RhoA signaling pathway	MSigDB Pathway	6.33505E-06						
Integrin Signaling Pathway	MSigDB Pathway	1.52305E-05						
PDGF Signaling Pathway	MSigDB Pathway	0.000108793						
Beta3 integrin cell surface interactions	MSigDB Pathway	0.000222277						
PDGFR-alpha signaling pathway	MSigDB Pathway	0.000333935						
```

Then run the script:

```shell
./GO_barplot.R GO.txt
```

The GO.png will be generated:

![GO](/Users/Aone/Documents/Bioinf/R/assets/GO.png)

> line8 and 9 for figure height and width

- X-axis indicates -log*P values*.
- Y-axis indicates terms.
- Color indicates categories.



----

## barplot.R

A tab-delimited text file with 2 columns and headers (Gene, log2FoldChange):

```R
Gene	log2FoldChange
CCND1	1.088554626
COL4A5	0.643112384
COL5A3	1.287000505
COL15A1	2.289502681
ECM1	0.885022315
CCL7	2.585949095
CCL8	2.641281056
MMP1	1.275866988
ACTA2	-1.271249703
TAGLN	-0.458876773
CNN1	-0.707720472
ACTG2	-2.781711974
MYLK	-0.685258488
LMOD1	-0.972606123
```

Run the script:

```shell
./barplot.R exp.txt
```

The exp.png looks like:

![Book1](/Users/Aone/Documents/Bioinf/R/assets/bar.png)



----

## boxplot.R

A tab-delimited text file with 2 columns and headers (length, sample):

```R
length	sample
319	Ctrl
1269	Ctrl
1730	Ctrl
1376	Ctrl
2411	Ctrl
1343	Ctrl
1159	Ctrl
1369	siJUN
282	siJUN
1459	siJUN
744	siJUN
```

Run the script:

```shell
./boxplot.R nc-jun.txt
```

The result will be named nc-jun.png:

<img src="/Users/Aone/Documents/Bioinf/R/assets/nc-JUN.png" style="zoom:15%" />



----









----

Author  [@zhaoshuoxp](https://github.com/zhaoshuoxp)  

Mar 29 2019  