library(shiny)

fluidPage(theme = "bootstrap.css",
    headerPanel("Drosophila stock list cleaner"),
    

    
    mainPanel("v. 0.1.0, © Mozilla Public License 2.0;  ", tags$a(href="https://github.com/jcolomb/flystockcleaner", "open source project hosted on github"),
      tabsetPanel(
        tabPanel ('Upload your list',
                  sidebarPanel(
                    
                    fileInput('file1', 'Choose CSV File',
                              accept=c('text/csv', 
                                       'text/comma-separated-values,text/plain', 
                                       '.csv')),
                    
                    fileInput('filexls', 'Choose excel File',
                              accept=c('.xls','.xlsx')),
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
                            tableOutput('contents') )
                ),
        tabPanel('Clean the list', 
                 
                 'Use the buttons left to start cleaning',
                sidebarPanel(
                 #selecting the fly name column-uiside
                 uiOutput("Box1"),
                 
                 #selecting the bdsc number column-uiside
                 uiOutput("Box2"),
                 
                
                 
                 tags$br(),tags$br(),
                 
                 actionButton ('cleanlist', 'Clean from stock number')
                 
                 ),
                mainPanel('Clean from stock number: works if BDSC number or FBstID is given. (this may take some time, be patient.)'
                          ,tags$br()
                          ,"NB: flybase names are returned, they are sometimes different from BDSC names. Genotype column is copied with the new columns to the far right to make it easier to compare the three."
                          ,dataTableOutput('contents3')
                          )
                 ),
        
         tabPanel('View the list'
            ,dataTableOutput('contents2')
         ),
        
        tabPanel('export output',
                 mainPanel(    
                    downloadLink("downloadData", "Download the result in a csv file")
                   ,tags$br()
                   , downloadLink("downloadDataxl", "Download the result in a xlsx file")
                 )
         
        )
      )  
      
    ),
    mainPanel(
      HTML("<hr>"),
      tags$p("Initially created by Dr. Julien Colomb,", tags$a(href="https://drososhare.wordpress.com/2017/06/08/fly-hunter-for-hire/", "Fly hunter"), "and founder of " ,
      tags$a(href="www.drososhare.net", tags$img(src = "drososhare_logo.png", width = "60%"))
      , tags$br(),
      tags$a(href="https://github.com/jcolomb/flystockcleaner", "Click here to see the source code and"),
      'contribute to the project (including give feedback, report bugs, ask for new features,re-use the sourche code,...)'  
      
      )
    )
      )
