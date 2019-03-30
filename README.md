# Rplots-NGS

----

This repository contains R scripts for data visualizing with ggplot2, gplots, pheatmap and DESeq2 packages.

* [DEseq2.R](https://github.com/zhaoshuoxp/Rplots-NGS#DEseq2r): an independent R script separated from [RNAseq pipeline](https://github.com/zhaoshuoxp/Pipelines-Wrappers#rnaseqsh).

* [GO_BP_bubble.R](https://github.com/zhaoshuoxp/Rplots-NGS#go_bpkegggadmf_bubbler) bubble plot for DAVID GO analysis in Biological Processes category.
* [GO_KEGG_bubble.R](https://github.com/zhaoshuoxp/Rplots-NGS#go_bpkegggadmf_bubbler): bubble plot for DAVID GO analysis in KEGG pathways category.
* [GO_GAD_bubble.R](https://github.com/zhaoshuoxp/Rplots-NGS#go_bpkegggadmf_bubbler): bubble plot for DAVID GO analysis in Genetic Associated Diseases category.

* [GO_MF_bubble.R](https://github.com/zhaoshuoxp/Rplots-NGS#go_bpkegggadmf_bubbler): bubble plot for DAVID GO analysis in Molecular Function category.

* [GO_barplot.R](https://github.com/zhaoshuoxp/Rplots-NGS#go_barplotr): barplot for any GO analysis in multiple categories.
* [barplot.R](https://github.com/zhaoshuoxp/Rplots-NGS#barplotr), [boxplot.R](https://github.com/zhaoshuoxp/Rplots-NGS#boxplotr), [lineplot.R](https://github.com/zhaoshuoxp/Rplots-NGS#lineplotr), [ggplot.R](https://github.com/zhaoshuoxp/Rplots-NGS#ggplotr), [histogram.R](https://github.com/zhaoshuoxp/Rplots-NGS#histogramr), [heatmap.R](https://github.com/zhaoshuoxp/Rplots-NGS#heatmapr):  bar/box/line/plot/histogram/heatmap for customized data.
* [cisVar_pvalues.R](https://github.com/zhaoshuoxp/Rplots-NGS#cisvar_pvaluesr): double Y-axis for [enrich_pvalues](https://github.com/TheFraserLab/enrich_pvalues) analysis of [cisVar output](https://github.com/TheFraserLab/cisVar).

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

![BP](https://raw.githubusercontent.com/zhaoshuoxp/Rplots-NGS/master/assets/BP.png)

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

![GO](https://raw.githubusercontent.com/zhaoshuoxp/Rplots-NGS/master/assets/GO.png)

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

![bar](https://raw.githubusercontent.com/zhaoshuoxp/Rplots-NGS/master/assets/bar.png)



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
....
```

Run the script:

```shell
./boxplot.R nc-jun.txt
```

The result will be named nc-jun.png:

![box](https://raw.githubusercontent.com/zhaoshuoxp/Rplots-NGS/master/assets/box.png)



----

## lineplot.R

Plots FPM matrix files from [reads_density.py](https://github.com/zhaoshuoxp/Py-NGS#reads_densitypy) or [split_turn_FPM.py](https://github.com/zhaoshuoxp/Py-NGS#split_turn_fpmpy). e.g.

```shell
./lineplot.R jun.matrix tcf21.matrix h3k27ac.matrix hnf1a.matrix
```

The script calculates the average FPM for each column and then layer all the lines:

![line](https://raw.githubusercontent.com/zhaoshuoxp/Rplots-NGS/master/assets/line.png)





----

## ggplot.R

A tab-delimited text file with 3 columns and headers (pre_freq, post_freq, sig):

```R
pre_freq	post_freq	sig
0.70847495320260700513	0.84210526315789502316	non_sig
0.9615127090692440204	1.0	non_sig
0.88124078849661391377	0.79310344827586198857	non_sig
0.88124078849661391377	0.78787878787878795617	non_sig
0.5351486772587950025	0.96153846153846200817	p<e-3
0.696367534957764045	0.625	non_sig
0.6862146422851030936	0.6666666666666669627	non_sig
0.9791971032881491288	1.0	non_sig
0.88124078849661391377	0.84210526315789502316	non_sig
0.9791971032881491288	1.0	non_sig
0.6862146422851030936	0.90476190476190510026	e-2<p<0.05
0.9791971032881491288	1.0	non_sig
....
```

Run `./ggplot.R plot.txt`

The figure is  will be named plot.png:

![plot](https://raw.githubusercontent.com/zhaoshuoxp/Rplots-NGS/master/assets/plot.png)



---

## histogram.R

Input: two columns with header (dist and name),  e.g. 

```R
dist	name
1754559	TCF21ToHNF1A
1729807	TCF21ToHNF1A
40	JUNToTCF21
103141	JUNToTCF21
1159	TCF21ToJUN
135	TCF21ToJUN
17	TCF21ToJUN
....
```

Run `./histogram.R his.txt`

![histo](https://raw.githubusercontent.com/zhaoshuoxp/Rplots-NGS/master/assets/histo.png)



----

## heatmap.R

Input: three columns without header, 1st: gene, 2nd: exp1, 3rd:exp3.  e.g. 

```R
CFH	7499.49805411	6264.10194253
SLC25A13	153.279671439	88.1102301471
CRLF1	50.018873082	110.84302439
RALA	1642.61455338	1164.83399075
PIK3C2A	892.558770512	729.359640082
DCN	30560.5410263	26172.4138123
CLDN11	3014.60289599	1614.69810131
GPRC5A	73.3835654507	169.7576812
....
```

Run `heatmap.R heatmap.txt`

![heatmap](https://raw.githubusercontent.com/zhaoshuoxp/Rplots-NGS/master/assets/heatmap.png)



----

## cisVar_pvalues.R

This script plots double Y-axis figure for [enrich_pvalues](https://github.com/TheFraserLab/enrich_pvalues) analysis of [cisVar output](https://github.com/TheFraserLab/cisVar). It is only used when non-significant data is unavailable so that the built-in plot function of enrich_pvalues doesn't work.

> Change $sig_score to $enrichment_score if non_sig data available.

The input looks like:

```R
nonsig_score	sig_data	nonsig_overlap	cutoff	sig_score	sig_overlap
0	41902	0	0.05	0.053267147	2232
0	18430	0	0.01	0.088551275	1632
0	13979	0	0.005	0.104943129	1467
0	8347	0	0.001	0.139211693	1162
0	6988	0	0.0005	0.150973097	1055
....
```

Run `cisVar_pvalues.R enrich_p.xlsx`

![enrich](https://raw.githubusercontent.com/zhaoshuoxp/Rplots-NGS/master/assets/enrich.png)



----

Author  [@zhaoshuoxp](https://github.com/zhaoshuoxp)  

Mar 29 2019  