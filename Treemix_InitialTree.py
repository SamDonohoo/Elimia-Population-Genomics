#!/bin/python3

# conda init
# conda create -n treemix
# conda activate treemix
# conda install treemix -c bioconda -c conda-forge
# conda install ipyrad -c bioconda -c conda-forge
# conda install jupyter -c conda-forge
# conda install toytree -c eaton-lab -c conda-forge

import ipyrad.analysis as ipa
import pandas as pd
import toytree
import toyplot
import toyplot.pdf

# the path to your HDF5 formatted snps file
data = "ElimiaS.snps.hdf5"

# group individuals into populations
imap = {
	"EcarNWR": ["Ebell_63", "Ebell_76"],
	"EspNWR": ["Ebell_61", "Ebell_62", "Ebell_63", "Ebell_64", "Ebell_65", "Ebell_66", "Ebell_67", "Ebell_68", "Ebell_69", "Ebell_71", "Ebell_72", "Ebell_73", "Ebell_74", "Ebell_75"],
	"EbellBase": ["Ebell_pop01", "Ebell_pop02", "Ebell_pop03", "Ebell_pop04", "Ebell_pop05", "Ebell_pop06", "Ebell_pop07", "Ebell_pop08", "Ebell_pop09", "Ebell_pop10", "Ebell_pop11", "Ebell_pop13", "Ebell_pop14", "Ebell_pop15", "Ebell_pop16", "Ebell_pop17", "Ebell_pop18", "Ebell_pop19", "Ebell_pop20"],
	"EbellAME": ["Ebell_pop21", "Ebell_pop22", "Ebell_pop23", "Ebell_pop24", "Ebell_pop25", "Ebell_pop26", "Ebell_pop27", "Ebell_pop28", "Ebell_pop29", "Ebell_pop30", "Ebell_pop31", "Ebell_pop34", "Ebell_pop35", "Ebell_pop36", "Ebell_pop37", "Ebell_pop38", "Ebell_pop39"],
	"EbellFarm": ["Ebell_pop41", "Ebell_pop43", "Ebell_pop44", "Ebell_pop45", "Ebell_pop46", "Ebell_pop48", "Ebell_pop49", "Ebell_pop51", "Ebell_pop52", "Ebell_pop53", "Ebell_pop54", "Ebell_pop55", "Ebell_pop57", "Ebell_pop58", "Ebell_pop59", "Ebell_pop60"],
	"EcocTrigger": ["Ecoc_pop01", "Ecoc_pop02", "Ecoc_pop03", "Ecoc_pop04", "Ecoc_pop05", "Ecoc_pop06", "Ecoc_pop07", "Ecoc_pop08", "Ecoc_pop09", "Ecoc_pop10", "Ecoc_pop11", "Ecoc_pop12", "Ecoc_pop13", "Ecoc_pop14", "Ecoc_pop15", "Ecoc_pop16"],
	"EcocValleyC": ["Ecoc_pop21", "Ecoc_pop22", "Ecoc_pop23", "Ecoc_pop24", "Ecoc_pop25", "Ecoc_pop26", "Ecoc_pop27", "Ecoc_pop28", "Ecoc_pop29", "Ecoc_pop31", "Ecoc_pop32", "Ecoc_pop33", "Ecoc_pop34", "Ecoc_pop35", "Ecoc_pop36", "Ecoc_pop37", "Ecoc_pop38", "Ecoc_pop39", "Ecoc_pop40"],
}

# minimum % of samples that must be present in each SNP from each group	
minmap = {i: 0.5 for i in imap}

# Initial treemix analysis object with some param arguments
tmx = ipa.treemix(
	data=data,
	imap=imap,
	minmap=minmap,
	root="EcarNWR",
	m=0,
	bootstrap=1000,
)

print(tmx.command)
tmx.run()