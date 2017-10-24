# Genomic Data Analysis Assessment 1B
#Name: Olateju Idowu
#ID: 17231720
#Date: 24/10/2017
# Defining UI to create the application layout
library(shiny)
ui<-fluidPage(
  #App title----
  titlePanel("Patient Information"),
  sidebarLayout(
    sidebarPanel(
      # Input the patient file and label it
      fileInput("Patient_Data","Choose CSV File", accept = c("pateint_data.csv"))
    ,
    checkboxInput("Put_in_header", "Headers", TRUE),
    #Allow the user to select a variable column of interest
    selectInput("var","Variables:",c("Age"="age","Height"="h", "Weight"="w", "BMI"="bmi")),
    #RadioButtons to allow colour selection
    radioButtons("radio_buttons", h3 ("Colour Selection"),
                 c("Red"="red", "Blue"="blue", "Yellow"="yellow", "Green"="green"))
  
  ),
    mainPanel(
      tableOutput("Contents"),
      plotOutput("Patient_info")
    )
  )
)

# Filling in the ouput
server<-function(input,output){
  output$Patient_info<-renderPlot({
    (req(input$Patient_Data))
    patient_file<-input$Patient_Data
    Content<-read.csv(patient_file$datapath,header=input$Put_in_header)
    var<-input$var
    cols<-input$radio_buttons
    boxplot(Content[,var],col=cols,main=paste("Selected Variable:",var))
    
  })
  output$Contents<- renderTable({
    (req(input$Patient_Data))
    patient_file<-read.csv(input$Patient_Data$datapath)
  })
}
shinyApp(ui=ui,server = server)