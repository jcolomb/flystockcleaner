

library(shiny)
library(tidyverse)

function(input, output, session) {
  values <- reactiveValues()
  
  values$inventory <- NULL
  # 
  # values$inventory <- ifelse (is.null(input$file1),NULL,
  #   read.csv(inFile$datapath, header=input$header, sep=input$sep, 
  #                              quote=input$quote)
  #                             )
output$contents <- renderTable({   
    # input$file1 will be NULL initially. After the user selects
    # and uploads a file, it will be a data frame with 'name',
    # 'size', 'type', and 'datapath' columns. The 'datapath'
    # column will contain the local filenames where the data can
    # be found.
    
    inFile <- input$file1
    
    if (is.null(input$file1))
      return(NULL)
    
    values$inventory=read.csv(inFile$datapath, header=input$header, sep=input$sep, 
             quote=input$quote)
  })



#selecting the fly name column-serverside
output$Box1 = renderUI(selectInput("fly_name", "Fly name column:",
                                              c(names (values$inventory))))

#selecting the bdsc number column-serverside
output$Box2 = renderUI(selectInput("BDSC", "bloomington stock number:",
                                                          c(names (values$inventory), "none"),'default'))                       
                                              
output$BDSC <- renderPrint ({input$BDSC})



#do stuff when action button pushed
cleanlist <- observeEvent(input$cleanlist, {
 # session$sendCustomMessage(type = 'testmessage',
  #                          message = 'this may take some time, plese wait')
  data  <- values$inventory
  BDSC <- input$BDSC
  fly_name <- input$fly_name
  
  source("cleanlist.r", local = T)
  values$inventorycl=data
})

output$downloadData <-downloadHandler(
  filename = function() {
    "stocklist_cleaned.csv"
  },
  content = function(file) {
    write.csv(values$inventorycl, file)
  }
)
  
output$contents2 <- renderTable({   
  
  if (is.null(values$inventorycl))
    return(NULL)
  
  values$inventorycl
})

}