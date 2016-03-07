#!/bin/R

shinyUI(fluidPage(
  
  titlePanel("Multi-gene comparison plots"),
  
  sidebarLayout(
    sidebarPanel(
      textInput("cuffdiff_dir", label = "Path to your Cuffdiff directory", value = ""),
      #checkboxInput("rebuild", label
      #              = "Rebuild cuffdiff database (very slow)", value = FALSE),
      #conditionalPanel(
      #  condition = "input.rebuild == true",
      #  textInput("cuffdiff_gtf", label = "Full path to your GTF file (optional, but recommended)"),
      #  textInput("cuffdiff_genome", label = "Genome name (Optional, free text)")
      #),
      tabsetPanel(
        tabPanel("Browse", style = "overflow-y: scroll; height: 10em;",
                 br(),
                 p("Enter dir above, then scroll to see all gene IDs:"),
                 conditionalPanel(
                   condition = "input.cuffdiff_dir.length > 0",
                   uiOutput("select_genes")
                 )), 
        tabPanel("Input", 
                 br(),
                 #radioButtons("inputtype", "Input type (File not functional):",
                 #             c("List" = "list",
                 #               "File" = "file")),
                 #conditionalPanel(
                 #  condition = "input.inputtype == 'list'",
                 strong("Gene list space separated"),
                 p("Use the gene short name (e.g. ACTB) or XLOC numbers (in the format XLOC_XXXXXX). Separate gene names or XLOC numbers with a space."),
                 textInput("gene_list", label = "", value = ""),
                 #),
                 #conditionalPanel(
                 # condition = "input.inputtype == 'file'",
                 #  fileInput("gene_list_file", label = "Gene list file")
                 #),
                 checkboxInput("reps", label="Include replicates ? (Not relevant for Barplot)", value = FALSE)#,
                 #submitButton(text="Plot!")
        )
      )
    ),
    sidebarPanel(strong("Gene information"),
                 uiOutput("gsn"), 
                 textOutput("id"),
                 uiOutput("sample_name_selector"))
  ),
  
  mainPanel(position = "right",
            tabsetPanel(
              tabPanel("Heatmap",plotOutput("heatmap")),
              tabPanel("Barplot", plotOutput("barplot"))
            )
  )))


### This file is part of shiny_cuffdiff.

### shiny_cuffdiff is free software: you can redistribute it and/or modify
### it under the terms of the GNU General Public License as published by
### the Free Software Foundation, either version 3 of the License, or
### (at your option) any later version.

### shiny_cuffdiff is distributed in the hope that it will be useful,
### but WITHOUT ANY WARRANTY; without even the implied warranty of
### MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
### GNU General Public License for more details.

### You should have received a copy of the GNU General Public License
### along with shiny_cuffdiff.  If not, see <http://www.gnu.org/licenses/>.
