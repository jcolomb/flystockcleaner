

library(shiny)
library(tidyverse)
library(openxlsx)
library (readxl)

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
    inFilexls <- input$filexls
    
    
    
    
    
    if (is.null(input$file1) & is.null(input$filexls) )
      return(NULL)
    
    if (!is.null(input$file1))
      {values$inventory=read.csv(inFile$datapath, header=input$header, sep=input$sep, 
                                       quote=input$quote)}
    
    if (!is.null(input$filexls))
    { ext <- tools::file_ext(inFilexls$name)
    if (ext == "xlsx"){
      values$inventory=as.data.frame(readxl::read_xlsx(inFilexls$datapath) )
    }else {
      values$inventory=as.data.frame(readxl::read_xls(inFilexls$datapath) )
    }
    }
  
    values$inventory
  })



#selecting the fly name column-serverside
output$Box1 = renderUI(selectInput("fly_name", "Column with fly stock names:",
                                              c(names (values$inventory))))

#selecting the bdsc number column-serverside
output$Box2 = renderUI(selectInput("BDSC", "Column with bloomington stock number or FBst_ID:",
                                                          c(names (values$inventory), "none"),'default'))                       
                                              
output$BDSC <- renderPrint ({input$BDSC})



#do stuff when action button pushed
cleanlist <- observeEvent(input$cleanlist, {
 # session$sendCustomMessage(type = 'testmessage',
  #                          message = 'this may take some time, plese wait')
  data  <- values$inventory
  BDSC <- input$BDSC
  fly_name <- input$fly_name
  
  source("cleanlist.r", local = TRUE)
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

output$downloadDataxl <-downloadHandler(
  filename = function() {
    "stocklist_cleaned.xlsx"
  },
  content = function(file) {
    openxlsx::write.xlsx(values$inventorycl, file)

  }
)
  
output$contents2 <- renderDataTable({   
  if (is.null(values$inventory))
    return(NULL)
  
  if (is.null(values$inventorycl))
    return(values$inventory)
  
  values$inventorycl
}, escape = FALSE,  options = list(lengthMenu = c(100, 200, -1), pageLength = 100))



output$contents3 <- renderDataTable({   
  if (is.null(values$inventory))
    return(NULL)
  
  if (is.null(values$inventorycl))
    return(head(values$inventory))
  
  head(values$inventorycl)
}, escape = FALSE,  options = list(lengthMenu = c(100, 200, -1), pageLength = 100))

}