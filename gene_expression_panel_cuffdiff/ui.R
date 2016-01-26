#!/bin/R
library(shiny)
library(shinyFiles)

shinyUI(fluidPage(
  titlePanel("Gene expression plot"),
  sidebarPanel(

          radioButtons(inputId="db_status",
                       label="Do you have an existing cuffData.db file?",
                       choices = c("Yes"=TRUE, "No"=FALSE),
                       selected = TRUE,
                       inline=TRUE),
          conditionalPanel(
            condition = "input.db_status == 'TRUE'",
            helpText("What to do when you've got a cuffData.db file"),
            shinyFilesButton('cuffData_file', 'File select', 'Please select a file', FALSE)
          ),
          conditionalPanel(
            condition = "input.db_status == 'FALSE'",
            helpText("What to do when you don't got a cuffData.db file"),
            shinyDirButton("cuffdiff_directory", "Folder select", "Select your cuffdiff directory", FALSE)
            
          ),
          textInput("gene_id", label = "Gene short name or XLOC number", value = ""),
          radioButtons("plottype", label="Plot type", choices = list("Line" = 1, "Bar" = 2),
                       selected = 1),
          checkboxInput("reps", label="Include replicates ?", value = FALSE)
    ),
  mainPanel(
    position = "right",
    verbatimTextOutput('cuffData_file_path'),
        tabsetPanel(
          tabPanel("Primary isoform",plotOutput("expression_plot_primary_isoform")),
          tabPanel("All isoforms", plotOutput("expression_plot_all_isoforms")),
          tabPanel("TSS groups",plotOutput("expression_plot_all_TSS")),
          tabPanel("CDS groups", plotOutput("expression_plot_all_CDS")),
          tabPanel("Raw plot data (Gene)", tableOutput("rawplotdatagene")),
          tabPanel("Raw plot data (Isoforms)", tableOutput("rawplotdataiso")),
          tabPanel("Isoform information", tableOutput("isoforminfo"))
                )
    )))

# shinyUI(fluidPage(
#   titlePanel("Gene expression plot"),
#   
#   sidebarLayout(
#     sidebarPanel(
#       shinyFilesButton("myfile","File select", "Select your cuffData.db file", FALSE),
#       radioButtons(inputId="db_status",
#                    label="Do you have an existing cuffData.db file?",
#                    choices = c("Yes"=TRUE, "No"=FALSE),
#                    selected = TRUE,
#                    inline=TRUE),
#       conditionalPanel(
#         condition = "input.db_status == 'TRUE'",
#         helpText("What to do when you've got a cuffData.db file")
#       ),
#       conditionalPanel(
#         condition = "input.db_status == 'FALSE'",
#         helpText("What to do when you don't got a cuffData.db file"),
#         shinyDirButton("myfolder", "Folder select", "Select your cuffdiff directory", FALSE)
#         
#       ),
#       textInput("gene_id", label = "Gene short name or XLOC number", value = ""),
#       radioButtons("plottype", label="Plot type", choices = list("Line" = 1, "Bar" = 2),
#                    selected = 1),
#       checkboxInput("reps", label="Include replicates ?", value = FALSE),
#       submitButton(text = "Input")
#       ),
#  
#  
#     sidebarPanel(strong("Gene information"),
#                           textOutput("gsn"), 
#                           textOutput("id"),
#                           textOutput("iso"),
#                           textOutput("tss"),
#                           textOutput("cds"),
#                           uiOutput("sample_name_selector"))
#   ),
#   
#   mainPanel(position = "right",
#     tabsetPanel(
#       tabPanel("Primary isoform",plotOutput("expression_plot_primary_isoform")),
#       tabPanel("All isoforms", plotOutput("expression_plot_all_isoforms")),
#       tabPanel("TSS groups",plotOutput("expression_plot_all_TSS")),
#       tabPanel("CDS groups", plotOutput("expression_plot_all_CDS")),
#       tabPanel("Raw plot data (Gene)", tableOutput("rawplotdatagene")),
#       tabPanel("Raw plot data (Isoforms)", tableOutput("rawplotdataiso")),
#       tabPanel("Isoform information", tableOutput("isoforminfo"))
#     )
# )))


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