
## Methods


### Resource Development
In order to get a fasta file of all genes in the oyster genome

```
bedtools getfasta \
-fi GCF_002022765.2_C_virginica-3.0_genomic.fa \
-bed ref_C_virginica-3.0_Gnomon_gene.gff3 \
> ../data/ref_C_virginica-3.0_Gnomon_gene.fa
```

This fasta file is available: https://d.pr/f/nfzK36 (400MB)


Using `Combined.SNP.TRSdp5g95FnDNAmaf05.vcf.gz` (31GB) [link](http://gannet.fish.washington.edu/seashell/eog_v2/VCF_files/Combined.SNP.TRSdp5g95FnDNAmaf05.vcf.gz) separate VCF files were derived for each library. [Details](https://robertslab.github.io/sams-notebook/2019/01/02/VCF-Splitting-C.virginica-VCF-Using-BCFtools.html)


Full genome sequences were generated using individual VCF files from each library
```
find Atumefaciens/20190103_Cvirginica_vcf_splitting/*vcf.gz \
| xargs basename -s .vcf.gz | xargs -I{} /bcftools consensus \
-f GCF_002022765.2_C_virginica-3.0_genomic.fa \
20190103_Cvirginica_vcf_splitting/{}.vcf.gz \
-o /Volumes/Serine/wd/19-01-08/{}.fa
```

Then grabbed gene level fasta files for all samples
```
find /Volumes/Serine/wd/19-01-08/*.fa \
| xargs basename -s .fa | xargs -I{} bedtools getfasta \
-fi /Volumes/Serine/wd/19-01-08/{}.fa \
-bed ref_C_virginica-3.0_Gnomon_gene.gff3 \
-fo /Volumes/Serine/wd/19-01-08/{}_GENE.fa
```  

These 91 fasta files are available [here](http://gannet.fish.washington.edu/seashell/bu-serine-wd/19-01-08/). Both full genome `{}.fa` and gene `{}_GENE.fa`
([jupyter notebook](https://github.com/hputnam/EastOyEpi/blob/master/jupyter/10-Consensus-new-split.ipynb))
