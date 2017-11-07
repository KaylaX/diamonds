library(shiny)
library(ggplot2)
#All the webs have the same skeleton

#GUI
ui<-fluidPage(
  titlePanel("Diamonds Data"),
  h1("I am header 1"),
  #different arguments, need commas
  h2("I am header 2"),
  sidebarLayout(
    sidebarPanel(
      helpText("This app is to visulaize diamonds dataset"),
      textInput(inputId="title",
                #this is case sensitive, 
                #this is the widget's name in R
                label="Chart title",
                value=""),
      selectInput(inputId="pos",
                  label="Position",
                  choices=list("stack","dodge"),
                  selected="stack") #making stack the default
                  #do not use capital letter or else R will 
                  #will not recognize
    ),
  mainPanel(
    plotOutput(outputId="plot")
    #make sure for every widget, you assign an Id
  )
    #run the line once you write a few lines
  )
)
#automatically adjust the size of the page


#Server
server<-function(input,output){
  output$plot=renderPlot({
    ggplot(diamonds,aes(x=cut, fill=clarity))+
      geom_bar(position=input$pos)+
      ggtitle(input$title)
    #the title of a plot should be inside renderPlot
    
  })
  

}

#Run the App
shinyApp(ui,server)
