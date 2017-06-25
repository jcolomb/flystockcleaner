library(shiny)

fluidPage(
  titlePanel("Uploading Files"),
  sidebarLayout(
    sidebarPanel(
      fileInput('file1', 'Choose CSV File',
                accept=c('text/csv', 
                         'text/comma-separated-values,text/plain', 
                         '.csv')),
      tags$hr(),
      checkboxInput('header', 'Header', TRUE),
      radioButtons('sep', 'Separator',
                   c(Comma=',',
                     Semicolon=';',
                     Tab='\t'),
                   ','),
      radioButtons('quote', 'Quote',
                   c(None='',
                     'Double Quote'='"',
                     'Single Quote'="'"),
                   '"')
    ),
    mainPanel(
      tabsetPanel(
        tabPanel ('file',tableOutput('contents') ),
        tabPanel('clean', 
                 
                 'this is the cleaning page',
                 
                 #selecting the fly name column-uiside
                 uiOutput("Box1"),
                 
                 #selecting the bdsc number column-uiside
                 uiOutput("Box2")
                 
                 , 'use input$BDSC to get:', textOutput('BDSC'),
                 
                 tags$br(),tags$br(),
                 
                 actionButton ('cleanlist', 'add correct name if BDSC number given. (this may take some time, be patient.)')
                 ,tags$br()
                 ,"NB: flybase names are returned, they are sometimes different from BDSC names. Genotype column is moved with the new column to the far right to make it easier to compare the two."
                 ,tags$br()
                 , downloadLink("downloadData", "Download the result file")
                 ,tableOutput('contents2')
                 )
      )  
      
    )
  )
)