#!/bin/python3

# conda install ipyrad -c bioconda
# conda install htslib -c bioconda
# conda install bcftools -c bioconda

import ipyrad.analysis as ipa
import pandas as pd

%%bash

# compress the VCF file if not already done (creates .vcf.gz)
bgzip ElimiaS.populations.snps.vcf

# tabix index the compressed VCF (creates .vcf.gz.tbi)
tabix ElimiaS.populations.snps.vcf.gz

# init a conversion tool. Block Size is 1 since we used a single-snp per locus approach in populations.
converter = ipa.vcf_to_hdf5(
    name="ElimiaS",
    data="ElimiaS.populations.snps.vcf.gz",
    ld_block_size=1,
)

# run the converter
converter.run()