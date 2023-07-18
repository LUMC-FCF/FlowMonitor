#Function for plotting single plot based on parameters
#-Filtering of parameters- 
observeEvent(input$Generate_Plot_Aurora, {
  is.null(input$Pre_Processing_Button_Aurora) 
  Filtered_Data_Plot_Aurora <- TableFinal_Aurora
  is.null(input$Pre_Processing_Button_Aurora) 
  if (!is.null(input$Instruments_Aurora)) {
    Filtered_Data_Plot_Aurora <- Filtered_Data_Plot_Aurora[which(Filtered_Data_Plot_Aurora$Instrument %in% input$Instruments_Aurora),]
  }
  if (!is.null(input$Parameters_Aurora)) {
    Filtered_Data_Plot_Aurora <- Filtered_Data_Plot_Aurora[which(Filtered_Data_Plot_Aurora$variable %in% input$Parameters_Aurora),]
  } 
  if (!is.null(input$Lasers_Aurora)) {
    Filtered_Data_Plot_Aurora <- Filtered_Data_Plot_Aurora[which(Filtered_Data_Plot_Aurora$Laser %in% input$Lasers_Aurora),]
  }
  if (!is.null(input$Detectors_Aurora)) {
    Filtered_Data_Plot_Aurora <- Filtered_Data_Plot_Aurora[which(Filtered_Data_Plot_Aurora$Detector %in% input$Detectors_Aurora),]
  }
  if (!is.null(input$PassFail_Aurora)) {
    Filtered_Data_Plot_Aurora <- Filtered_Data_Plot_Aurora[which(Filtered_Data_Plot_Aurora$Pass_and_Fail %in% input$PassFail_Aurora),]
  }
  


#Define if laser or detectors have to be colored
Lasers_DetectorscolorAurora <- ColorVarPlot(Filter1 = input$Detectors_Aurora,
                                Filter2 = input$Lasers_Aurora,
                                Column1 = Filtered_Data_Plot_Aurora$Detector,
                                Column2 = Filtered_Data_Plot_Aurora$Laser)

#Define ggplot function
Plot_Standard_Aurora <- (QCPlotFunctionStand(
                                   Finaldf = Filtered_Data_Plot_Aurora,
                                  x_axis = Filtered_Data_Plot_Aurora$Date,
                                  y_axis = Filtered_Data_Plot_Aurora$value,
                                  Lasers_Detectors = Lasers_DetectorscolorAurora,
                                  Instrument = Filtered_Data_Plot_Aurora$Instrument,
                                  widthline = 0.75,
                                  limxmin = as.Date(input$Xmin_Aurora),
                                  limxmax =  as.Date(input$Xmax_Aurora),
                                  limymin = as.numeric(input$Ymin_Aurora),
                                  limymax = as.numeric(input$Ymax_Aurora),
                                  titleplot = input$Title_Graph_Auror,
                                  ylabaxis = input$Title_Yaxis_Aurora,
                                  xlabaxis = "Date",
                                  colorscale = scale_colour_viridis_d(
                                    alpha = 1,
                                    begin = 0,
                                    end = 1,
                                    direction = 1,
                                    option = "H",
                                    aesthetics = "color"),
                                    color1 = "black",
                                    color2 = "red", 
                                    color3 = "orange",
                                    color4 = "yellow",
                                    color5 = "green",
                                    color6 = "blue",
                                    color7 = "purple"))


     
# Script for vlines and labels
   Plot_Standard_Aurora <- Plot_Standard_Aurora +
     vline(
        Nameline = "Line1",
        Lineselect = input$Add_Lines_Aurora,
        vlinexintcep = as.numeric(as.Date(input$Line1_Position_Aurora)),
        vlinecolor = input$Line1_Name_Aurora,
        vlinetype = 2,
        vlinewitdh = 1.0)
   
   Plot_Standard_Aurora <- Plot_Standard_Aurora +
     vline(
       Nameline = "Line2",
       Lineselect = input$Add_Lines_Aurora,
       vlinexintcep = as.numeric(as.Date(input$Line2_Position_Aurora)),
       vlinecolor = input$Line2_Name_Aurora,
       vlinetype = 2,
       vlinewitdh = 1.0)
   
   Plot_Standard_Aurora <- Plot_Standard_Aurora +
     vline(
       Nameline = "Line3",
       Lineselect = input$Add_Lines_Aurora,
       vlinexintcep = as.numeric(as.Date(input$Line3_Position_Aurora)),
       vlinecolor = input$Line3_Name_Aurora,
       vlinetype = 2,
       vlinewitdh = 1.0)
   
   Plot_Standard_Aurora <- Plot_Standard_Aurora +
     vline(
       Nameline = "Line4",
       Lineselect = input$Add_Lines_Aurora,
       vlinexintcep = as.numeric(as.Date(input$Line4_Position_Aurora)),
       vlinecolor = input$Line4_Name_Aurora,
       vlinetype = 2,
       vlinewitdh = 1.0)
   
   Plot_Standard_Aurora <- Plot_Standard_Aurora +
     vline(
       Nameline = "Line5",
       Lineselect = input$Add_Lines_Aurora,
       vlinexintcep = as.numeric(as.Date(input$Line5_Position_Aurora)),
       vlinecolor = input$Line5_Name_Aurora,
       vlinetype = 2,
       vlinewitdh = 1.0)
   
   Plot_Standard_Aurora <- Plot_Standard_Aurora +
     vline(
       Nameline = "Line6",
       Lineselect = input$Add_Lines_Aurora,
       vlinexintcep = as.numeric(as.Date(input$Line6_Position_Aurora)),
       vlinecolor = input$Line6_Name_Aurora,
       vlinetype = 2,
       vlinewitdh = 1.0)
  
     
#Script for hline
   Plot_Standard_Aurora <- Plot_Standard_Aurora +
     hline(
       Nameline = "Add line",
       Lineselect = input$Hline_Aurora_1,
       hlineyintcep = as.numeric(input$Hline_Position_Aurora_1),
       hlinecolor = "red",
       hlinetype = "longdash",
       hlinewitdh = 1.0)
   
   Plot_Standard_Aurora <- Plot_Standard_Aurora +
     hline(
       Nameline = "Add line",
       Lineselect = input$Hline_Aurora_2,
       hlineyintcep = as.numeric(input$Hline_Position_Aurora_2),
       hlinecolor = "red",
       hlinetype = "longdash",
       hlinewitdh = 1.0)
     
Varimageplot(ImageName = "plot_visualization2ExpAurora",
             Varimage = Plot_Standard_Aurora)   

#Function ggplotly
Plot_Detail_Aurora <- (QCPlotFunctionDetail(
  Finaldf = Filtered_Data_Plot_Aurora,
  x_axis = Filtered_Data_Plot_Aurora$Date,
  y_axis = Filtered_Data_Plot_Aurora$value,
  Lasers_Detectors =  Lasers_DetectorscolorAurora,
  Instrument = Filtered_Data_Plot_Aurora$Instrument,
  widthline = 0.75,
  limxmin = as.Date(input$Xmin_Aurora),
  limxmax =  as.Date(input$Xmax_Aurora),
  limymin = as.numeric(input$Ymin_Aurora),
  limymax = as.numeric(input$Ymax_Aurora),
  titleplot = input$Title_Graph_Aurora,
  ylabaxis = input$Title_Yaxis_Aurora,
  xlabaxis = "Date",
  colorscale = scale_colour_viridis_d(
    alpha = 1,
    begin = 0,
    end = 1,
    direction = 1,
    option = "H",
    aesthetics = "color")))
 

  # Script for vlines and lables
Plot_Detail_Aurora <- Plot_Detail_Aurora +
  vlinedetail(
    Nameline = "Line1",
    Lineselect = input$Add_Lines_Aurora,
    vlinexintcep = as.numeric(as.Date(input$Line1_Position_Aurora)),
    vlinecolor = "black",
    vlinetype = input$Line1_Name_Aurora,
    vlinewitdh = 1.0,
    showlegd = FALSE)

Plot_Detail_Aurora <- Plot_Detail_Aurora +
  vlinedetail(
    Nameline = "Line2",
    Lineselect = input$Add_Lines_Aurora,
    vlinexintcep = as.numeric(as.Date(input$Line2_Position_Aurora)),
    vlinecolor = "red",
    vlinetype = input$Line2_Name_Aurora,
    vlinewitdh = 1.0,
    showlegd = FALSE)

Plot_Detail_Aurora <- Plot_Detail_Aurora +
  vlinedetail(
    Nameline = "Line3",
    Lineselect = input$Add_Lines_Aurora,
    vlinexintcep = as.numeric(as.Date(input$Line3_Position_Aurora)),
    vlinecolor = "orange",
    vlinetype = input$Line3_Name_Aurora,
    vlinewitdh = 1.0,
    showlegd = FALSE)

Plot_Detail_Aurora <- Plot_Detail_Aurora +
  vlinedetail(
    Nameline = "Line4",
    Lineselect = input$Add_Lines_Aurora,
    vlinexintcep = as.numeric(as.Date(input$Line4_Position_Aurora)),
    vlinecolor = "yellow",
    vlinetype = input$Line4_Name_Aurora,
    vlinewitdh = 1.0,
    showlegd = FALSE)

Plot_Detail_Aurora <- Plot_Detail_Aurora +
  vlinedetail(
    Nameline = "Line5",
    Lineselect = input$Add_Lines_Aurora,
    vlinexintcep = as.numeric(as.Date(input$Line5_Position_Aurora)),
    vlinecolor = "green",
    vlinetype = input$Line5_Name_Aurora,
    vlinewitdh = 1.0,
    showlegd = FALSE)

Plot_Detail_Aurora <- Plot_Detail_Aurora +
  vlinedetail(
    Nameline = "Line6",
    Lineselect = input$Add_Lines_Aurora,
    vlinexintcep = as.numeric(as.Date(input$Line6_Position_Aurora)),
    vlinecolor = "blue",
    vlinetype = input$Line6_Name_Aurora,
    vlinewitdh = 1.0,
    showlegd = FALSE)


#Script for hline
Plot_Detail_Aurora <- Plot_Detail_Aurora +
  hline(
    Nameline = "Add line",
    Lineselect = input$Hline_Aurora_1,
    hlineyintcep = as.numeric(input$Hline_Position_Aurora_1),
    hlinecolor = "red",
    hlinetype = "longdash",
    hlinewitdh = 1.0)

Plot_Detail_Aurora <- Plot_Detail_Aurora +
  hline(
    Nameline = "Add line",
    Lineselect = input$Hline_Aurora_2,
    hlineyintcep = as.numeric(input$Hline_Position_Aurora_2),
    hlinecolor = "red",
    hlinetype = "longdash",
    hlinewitdh = 1.0)     

     
     
#Plot the defined plots
  output$StandardPlotAurora <- renderPlot({Plot_Standard_Aurora})
  output$PlotlyAurora <- renderPlotly({ggplotly(Plot_Detail_Aurora)})
  })

#-Ui elements for visualization standard tab-
# Selection boxes 
# Selection Instrument
output[["Instruments_Aurora"]] <- renderUI({
  tryCatch({
    is.null(input$Pre_Processing_Button_Aurora)
      checkboxGroupInput(inputId = "Instruments_Aurora",
                         label = "Instruments_Aurora",
                         choices = unique(TableFinal_Aurora$Instrument))
      },    error = function(err) {
            return(NULL)
  })
})
  
# Selection parameter
output[["Parameters_Aurora"]] <- renderUI({
  tryCatch({
            is.null(input$Pre_Processing_Button_Aurora)
            radioButtons(inputId = "Parameters_Aurora",
                         label = "Parameters_Aurora",
                         choices = unique(TableFinal_Aurora$variable[TableFinal_Aurora$Instrument == input$Instruments_Aurora]))
      },  error = function(err) {
          print(err)
          return(NULL)
  })
})
  
  
# Selection laser
output[["Lasers_Aurora"]] <- renderUI({
  tryCatch({
            is.null(input$Pre_Processing_Button_Aurora)
            checkboxGroupInput(inputId = "Lasers_Aurora",
                               label = "Lasers_Aurora",
                               choices = unique(TableFinal_Aurora$Laser[TableFinal_Aurora$variable == input$Parameters_Aurora
                                          & TableFinal_Aurora$Instrument == input$Instruments_Aurora]))
     },   error = function(err) {
          print(err)
          return(NULL)
  })
})
  
  
# Selection Detector
output[["Detectors_Aurora"]] <- renderUI({
  tryCatch({
            is.null(input$Pre_Processing_Button_Aurora)
            checkboxGroupInput(inputId = "Detectors_Aurora",
                               label = "Detectors_Aurora",
                               choices = unique(TableFinal_Aurora$Detector[TableFinal_Aurora$Laser == input$Lasers_Aurora 
                                                & TableFinal_Aurora$variable == input$Parameters_Aurora]))
    },    error = function(err) {
          print(err)
          return(NULL)
  })
})
  
  
  
#Selection Pass and Fail
output[["PassFail_Aurora"]] <- renderUI({
  tryCatch({
            is.null(input$Pre_Processing_Button_Aurora)
            checkboxGroupInput(inputId = "PassFail_Aurora",
                               label = "PassFail_Aurora",
                               choices = c("Pass", "Fail"))
    },   error = function(err) {
         print(err)
         return(NULL)
  })
})
  
#Ymax en Ymin selection boxes
#Ymin text box
output[["Ymin_Aurora"]] <- renderUI({ 
  Yaxismin <- Filteraxisinputmin(Columninputwigdet = TableFinal_Aurora$value, 
                                 Instrument_input = input$Instruments_Aurora, 
                                 Parameter_input = input$Parameters_Aurora, 
                                 Laser_input = input$Lasers_Aurora,
                                 Detector_input = input$Detectors_Aurora, 
                                 TableInstrument = TableFinal_Aurora$Instrument , 
                                 TableParameter = TableFinal_Aurora$variable , 
                                 TableLaser = TableFinal_Aurora$Laser , 
                                 TableDetector = TableFinal_Aurora$Detector)
    
tryCatch({
  is.null(input$Pre_Processing_Button_Aurora)
    textInput(inputId= "Ymin_Aurora",
              label = "Ymin",
              value = as.numeric(min(Yaxismin)),
              width = NULL,
              placeholder = NULL)
   }, error = function(err) {
      print(err)
      return(NULL)
  })
})
  
  
#Ymax text box
output[["Ymax_Aurora"]] <- renderUI({
      Yaxismax <- Filteraxisinputmax(Columninputwigdet = TableFinal_Aurora$value, 
                                    Instrument_input = input$Instruments_Aurora, 
                                    Parameter_input = input$Parameters_Aurora, 
                                    Laser_input = input$Lasers_Aurora,
                                    Detector_input = input$Detectors_Aurora, 
                                    TableInstrument = TableFinal_Aurora$Instrument , 
                                    TableParameter = TableFinal_Aurora$variable , 
                                    TableLaser = TableFinal_Aurora$Laser , 
                                    TableDetector = TableFinal_Aurora$Detector)
    
tryCatch({
  is.null(input$Pre_Processing_Button_Aurora)
    textInput(inputId= "Ymax_Aurora",
              label = "Ymax",
              value = as.numeric(max(Yaxismax)),
              width = NULL,
              placeholder = NULL)
    }, error = function(err) {
       print(err)
       return(NULL)
  })
})  
  
#Xmax en Ymin selection boxes
 #Xmin text box
  output[["Xmin_Aurora"]] <- renderUI({  
    Xaxismin <- Filteraxisinputmin(Columninputwigdet = TableFinal_Aurora$Date, 
                                    Instrument_input = input$Instruments_Aurora, 
                                    Parameter_input = input$Parameters_Aurora, 
                                    Laser_input = input$Lasers_Aurora,
                                    Detector_input = input$Detectors_Aurora, 
                                    TableInstrument = TableFinal_Aurora$Instrument , 
                                    TableParameter = TableFinal_Aurora$variable , 
                                    TableLaser = TableFinal_Aurora$Laser , 
                                    TableDetector = TableFinal_Aurora$Detector)
tryCatch({
  is.null(input$Pre_Processing_Button_Aurora)
    dateInput(inputId= "Xmin_Aurora",
              label = "Xmin",
              value = min(Xaxismin),
              width = NULL)
    },  error = function(err) {
        print(err)
        return(NULL)
  })
})
  
#Xmax text box
output[["Xmax_Aurora"]] <- renderUI({ 
  Xaxismax <- Filteraxisinputmax(Columninputwigdet = TableFinal_Aurora$Date, 
                                 Instrument_input = input$Instruments_Aurora, 
                                 Parameter_input = input$Parameters_Aurora, 
                                 Laser_input = input$Lasers_Aurora,
                                 Detector_input = input$Detectors_Aurora, 
                                 TableInstrument = TableFinal_Aurora$Instrument , 
                                 TableParameter = TableFinal_Aurora$variable , 
                                 TableLaser = TableFinal_Aurora$Laser , 
                                 TableDetector = TableFinal_Aurora$Detector)
    
tryCatch({
  is.null(input$Pre_Processing_Button_Aurora)
    dateInput(inputId= "Xmax_Aurora",
              label = "Xmax",
              value = max(Xaxismax),
              width = NULL)
    },  error = function(err) {
        print(err)
        return(NULL)
  })
})
  
#Image Aurora download button 
output[["Image_Aurora_plot"]]<- renderUI({
  downloadHandler(
    filename = "YourplotAurora.png" ,
    content = function(file2) {
      Standplot <- GenerateStandplotimage(PlotvarName = plot_visualization2ExpAurora,
                                          Formatwidth = 30,
                                          Formatheight = 20,
                                          Formatunit = "cm",
                                          filecontent = file2) })
})   
  
  