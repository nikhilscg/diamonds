library(shiny)
library(dplyr)
library(ggplot2)

data(diamonds)

## GUI
ui <- fluidPage(
  titlePanel("Diamonds Data"),
  sidebarLayout(
    sidebarPanel(
      helpText("This app is to visualize Diamonds Dataset"),
      textInput(inputId = "title",
                label="Chart Title",
                value=""),
      selectInput(inputId = "pos",
                  label = "Position",
                  choices = list("stack","dodge"),
                  selected = "stack")
    ),
    mainPanel(
      plotOutput(outputId = "plot")
      
    )
    
  )
  
  
  
)


##Server
server <- function(input,output) {
 output$plot= renderPlot({
    ggplot(diamonds,aes(x=cut,fill=clarity))+
      geom_bar(position=input$pos)+
     ggtitle(input$title)
    
    
  })

}

#Run the app

shinyApp(ui,server)

