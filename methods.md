
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
