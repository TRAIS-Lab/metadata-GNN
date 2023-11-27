# A Metadata-Driven Approach to Understand Graph Neural Networks

This file contains description of the code used for Section 3 and 5 in the paper. 

## Section 3: Multivariate Sparse Group Lasso

In Section 3, given the dataset and GNN performance metadata (as CSV format), we provide an example code (```msglasso_example.R```) to run the sparse regression analysis, which is mainly taken from the [R documentation](https://rdrr.io/cran/MSGLasso/man/MSGLasso.html) provided by the authors of the [original paper](https://deepblue.lib.umich.edu/bitstream/handle/2027.42/111927/biom12292.pdf?sequence=2). We also provide the two CSV files we used in the analysis (```Data Properties.csv``` and ```Model Performance.csv```), which is metadata obtained from [GLI library](https://github.com/Graph-Learning-Benchmarks/gli).

### Requirements
The R package [MSGLasso](https://github.com/cran/MSGLasso) is required.

### Run the Code

The file ```msglasso_example.R``` can be directly complied in RStudio.


## Section 5: Controlled Experiments

In Section 5, we use [GraphWorld toolbox](https://github.com/google-research/graphworld) to generate synthetic datasets with varying dataset properties and use [GLI library](https://github.com/Graph-Learning-Benchmarks/gli) to get GNNs' model performance. The pipeline can be reproduced via the ```Simulation_Study.ipynb``` notebook. The parameters used by GraphWorld random dataset generator is included in the Appendix of the paper (also can be observed in the above notebok). For the training and model details, please see Appendix B of the paper.

For better reproducibility, we also include the synthetic datasets that we used to present the results in Table 5-8 in Appendix. In particular, for *Gini-Degree* experiment (Table 5), we use the datsets in ```all_data_gini.zip``` ; for *Average Degree* experiment (Table 6), we use datasets in ```all_data_deg.zip``` ; for *Edge Homogeneity* experiment (Table 7), we use datasets in ```all_data_homo.zip```; for *In-Feature Similarity / Featre Angular SNR* experiment (Table 8), we use datasets in ```all_data_var.zip```.

### Requirements
The above two libraries' README files contain sufficient information to install dependent packages and build up the repos. Our experiments do not require additional packages.

### Run the Code

The notebook can be complied via Google Colab. Note that we do not provide dataloader to load the pre-generated datasets. The conclusion and discussion made in the paper are consistant if we use different random datasets generated with the same set of GraphWorld parameters.


## Citation

If you find this repo helpful for your research, please consider citing our paper below.

```latex
@misc{li2023metadatadriven,
      title={A Metadata-Driven Approach to Understand Graph Neural Networks}, 
      author={Ting Wei Li and Qiaozhu Mei and Jiaqi Ma},
      year={2023},
      eprint={2310.19263},
      archivePrefix={arXiv},
      primaryClass={cs.LG}
}
```
