# shiny_cuffdiff

Welcome to the shiny_cuffdiff project.

This project is at an early phase of development, but is under active development.

Participants (either users, testers, or code developers) are encouraged!

Put simply, this code uses the outputs of the Tuxedo workflow (Tophat2 > Cufflinks > Cuffdiff) which is a cuffdiff SQL database file called cuffData.db. Then, using the R package cummeRbund, various plots are created on-the fly. 

There are two subdirectories, containing the server.R and ui.R files required for all Shiny apps, and a load_packages.R file to handle loading dependencies.

<b>gene_expression_panel_cuffdiff:</b>

Takes a cuffdiff database (rebuilding if required) and displays information on a single named gene (as defined by the gene short name or the XLOC number). After the gene information is defined, gene expression plots can be restricted by sample.

<b>To use</b>: Open the server.R or ui.R file within RStudio. Click on the "Run App" button, or run from the R console:

<code>shiny::runApp('shiny_cuffdiff/gene_expression_panel_cuffdiff'))</code>

Type the path to the cuffdiff directory <br />
Type the gene short name or XLOC number <br />
Press "Plot"

<b>gene_comparison_panel_cuffdiff:</b>

Takes a cuffdiff database (rebuilding if required) and displays information on a set of named genes (as defined by the gene short name or the XLOC number). Displays a heatmap and a barplot. After the gene information is defined, gene expression plots can be restricted by sample.

<b>To use</b>: Open the server.R or ui.R file within RStudio. Click on the "Run App" button, or run from the R console:

<code>shiny::runApp('shiny_cuffdiff/gene_comparison_panel_cuffdiff'))</code>

Type the path to the cuffdiff directory <br />
Type the gene short names or XLOC numbers <br />
Press "Plot"


<b>Contributors and Users:</b> Welcome. We intend to use the Git branching model described in this post for development of this code.

http://nvie.com/posts/a-successful-git-branching-model/ (Thanks to Vincent Driessen for the post).

Put simply, <br />
..if you just want to try the code out but don't want to contribute to the code, clone the <b>master</b> branch <br />
..if you want to contribute to the code, clone the <b>develop</b> branch, and please read the above post.

<b>Users:</b> Please note that, while this code is usable and may already be helpful when interrogating your gene expression results, it is a project at an early stage of development and there is a lot of error handling and code optimisation to be done.

<b>Contributors:</b> Welcome and thanks! Please take the time to read the current issues list, and feel free to create new issues or suggestions for improvements.

<b>Requirements (tested on these versions)</b>

R version 3.2.2 (2015-08-14) -- "Fire Safety" <br />
RStudio (open source edition) <br />
R package: Shiny version	0.13.0 (this is installed during the startup process) <br />
R package: cummeRbund version 2.12.0 (this is installed during the startup process) <br />
A valid cuffdiff directory (the cuffdiff.db can be rebuilt, but this is a very, very slow process, so this option is turned off by default)


We are also developing Shiny code to interrogate the outputs of other common gene expression / differential expression workflows (intially starting with DESeq2), which will be published as a separate repository.
