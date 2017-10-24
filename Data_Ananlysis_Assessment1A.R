# Genomic Data Analysis Assessment 1A
#Name: Olateju Idowu
#ID: 17231720
#Date: 24/10/2017
library(shiny)
ui<-fluidPage(
  #Sidebar layout with input and output definitions----
      numericInput(inputId = "Samples",
                   label = "Number of Random Samples:",
                   min = 1,
                   max = 500,
                   value = 100),
      #Input: Slider for the mean----
      sliderInput(inputId = "mean",
                  label = "Mean",
                  min = 1,
                  max = 500,
                  value = 50),
      #Input:Slider for the SD----
      sliderInput(inputId = "SD",
                  label = "Standard Deviation",
                  min = 1,
                  max = 500,
                  value = 20),
      plotOutput(outputId = "histogram")
  
    )

server<-function(input,output){
  output$histogram<-renderPlot({
    hist(rnorm(input$Samples, input$mean, input$SD))
  })
}
shinyApp(ui=ui,server = server)