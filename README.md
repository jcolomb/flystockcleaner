# flystockcleaner

The goal of this project is to build a shiny app where users can clean their stock list. They should be able to:

- upload a fly stock list
- automatically check and label each entry for cleaness (is the name an unique idenfier for that line)
- create a new column with a reference ID for clean entries
- create new reference ID for lines not in flybase (new combination of existing genetic elements)  
- make an interactive function to clean other entries:
  - look for the existing name in flybase entries
  - ask the user to select the right entry
  
  
Contributions are welcome, we will need to expand the rflybase package for this to work, too.