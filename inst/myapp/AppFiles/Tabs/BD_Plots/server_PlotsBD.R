#Function for plotting single plot based on parameters
#-Filtering of parameters- 
observeEvent(input$Generate_Plot_BD, {
  is.null(input$Pre_Processing_Button_BD) 
  Filtered_Data_Plot_BD <- TableFinal_BD 
  if (!is.null(input$Instruments_BD)) {
      Filtered_Data_Plot_BD <- Filtered_Data_Plot_BD[which(Filtered_Data_Plot_BD$Instrument %in% input$Instruments_BD),]
  }
  if (!is.null(input$Parameters_BD)) {
      Filtered_Data_Plot_BD <- Filtered_Data_Plot_BD[which(Filtered_Data_Plot_BD$variable %in% input$Parameters_BD),]
  }
  if (!is.null(input$LasDetec_BD)) {
     Filtered_Data_Plot_BD <- Filtered_Data_Plot_BD[which(Filtered_Data_Plot_BD$Laser_Detector %in% input$LasDetec_BD),]
  } 

#Define if laser or detectors have to be colored
  Lasers_DetectorscolorBD <- ColorVarPlot(Filter1 = input$LasDetec_BD,
                                         Column1 = Filtered_Data_Plot_BD$Laser_Detector
                                          )

  
#Define ggplot function
Plot_Standard_BD <- (QCPlotFunctionStand(
                                   Finaldf = Filtered_Data_Plot_BD,
                                   x_axis = Filtered_Data_Plot_BD$Date,
                                   y_axis = Filtered_Data_Plot_BD$value,
                                   Lasers_Detectors = Lasers_DetectorscolorBD,
                                   Instrument = Filtered_Data_Plot_BD$Instrument,
                                   widthline = 0.75,
                                   limxmin = as.Date(input$Xmin_BD),
                                   limxmax =  as.Date(input$Xmax_BD),
                                   limymin = as.numeric(input$Ymin_BD),
                                   limymax = as.numeric(input$Ymax_BD),
                                   titleplot = input$Title_Graph_BD,
                                   ylabaxis = input$Title_Yaxis_BD,
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
  
  Plot_Standard_BD <- Plot_Standard_BD +    
    vline(
      Nameline = "Line1",
      Lineselect = input$Add_Lines_BD,
      vlinexintcep = as.numeric(as.Date(input$Line1_Position_BD)),
      vlinecolor = input$Line1_Name_BD,
      vlinetype = 2,
      vlinewitdh = 1.0)
  
  Plot_Standard_BD <- Plot_Standard_BD + 
    vline(
      Nameline = "Line2",
      Lineselect = input$Add_Lines_BD,
      vlinexintcep = as.numeric(as.Date(input$Line2_Position_BD)),
      vlinecolor = input$Line2_Name_BD,
      vlinetype = 2,
      vlinewitdh = 1.0)
  
  Plot_Standard_BD <- Plot_Standard_BD +   
    vline(
      Nameline = "Line3",
      Lineselect = input$Add_Lines_BD,
      vlinexintcep = as.numeric(as.Date(input$Line3_Position_BD)),
      vlinecolor = input$Line3_Name_BD,
      vlinetype = 2,
      vlinewitdh = 1.0)
  
  Plot_Standard_BD <- Plot_Standard_BD + 
    vline(
      Nameline = "Line4",
      Lineselect = input$Add_Lines_BD,
      vlinexintcep = as.numeric(as.Date(input$Line4_Position_BD)),
      vlinecolor = input$Line4_Name_BD,
      vlinetype = 2,
      vlinewitdh = 1.0)
  
  Plot_Standard_BD <- Plot_Standard_BD +    
    vline(
      Nameline = "Line5",
      Lineselect = input$Add_Lines_BD,
      vlinexintcep = as.numeric(as.Date(input$Line5_Position_BD)),
      vlinecolor = input$Line5_Name_BD,
      vlinetype = 2,
      vlinewitdh = 1.0)
  
  Plot_Standard_BD <- Plot_Standard_BD +   
    vline(
      Nameline = "Line6",
      Lineselect = input$Add_Lines_BD,
      vlinexintcep = as.numeric(as.Date(input$Line6_Position_BD)),
      vlinecolor = input$Line6_Name_BD,
      vlinetype = 2,
      vlinewitdh = 1.0)
  

  
#Add hline  
    Plot_Standard_BD <- Plot_Standard_BD +
    hline(
      Nameline = "Add line",
      Lineselect = input$Hline_BD_1,
      hlineyintcep = as.numeric(input$Hline_Position_BD_1),
      hlinecolor = "red",
      hlinetype = "longdash",
      hlinewitdh = 1.0)
  
  Plot_Standard_BD <- Plot_Standard_BD +
    hline(
      Nameline = "Add line",
      Lineselect = input$Hline_BD_2,
      hlineyintcep = as.numeric(input$Hline_Position_BD_2),
      hlinecolor = "red",
      hlinetype = "longdash",
      hlinewitdh = 1.0)
  

Varimageplot(ImageName = "plot_visualization2ExpBD",
             Varimage = Plot_Standard_BD)  

#Define ggplotly 
Plot_Detail_BD <- (QCPlotFunctionDetail(
                                       Finaldf = Filtered_Data_Plot_BD,
                                       x_axis = Filtered_Data_Plot_BD$Date,
                                       y_axis = Filtered_Data_Plot_BD$value,
                                       Lasers_Detectors = Lasers_DetectorscolorBD,
                                       Instrument = Filtered_Data_Plot_BD$Instrument,
                                       widthline = 0.75,
                                       limxmin = as.Date(input$Xmin_BD),
                                       limxmax =  as.Date(input$Xmax_BD),
                                       limymin = as.numeric(input$Ymin_BD),
                                       limymax = as.numeric(input$Ymax_BD),
                                       titleplot = input$Title_Graph_BD,
                                       ylabaxis = input$Title_Yaxis_BD,
                                       xlabaxis = "Date",
                                       colorscale = scale_colour_viridis_d(
                                                   alpha = 1,
                                                   begin = 0,
                                                   end = 1,
                                                   direction = 1,
                                                   option = "H",
                                                   aesthetics = "color")))

  
# Script for vlines and lables
Plot_Detail_BD <- Plot_Detail_BD +
  vlinedetail(
    Nameline = "Line1",
    Lineselect = input$Add_Lines_BD,
    vlinexintcep = as.numeric(as.Date(input$Line1_Position_BD)),
    vlinecolor = "black",
    vlinetype = input$Line1_Name_BD,
    vlinewitdh = 1.0,
    showlegd = FALSE)


Plot_Detail_BD <- Plot_Detail_BD +
  vlinedetail(
    Nameline = "Line2",
    Lineselect = input$Add_Lines_BD,
    vlinexintcep = as.numeric(as.Date(input$Line2_Position_BD)),
    vlinecolor = "red",
    vlinetype = input$Line2_Name_BD,
    vlinewitdh = 1.0,
    showlegd = FALSE)

Plot_Detail_BD <- Plot_Detail_BD +
  vlinedetail(
    Nameline = "Line3",
    Lineselect = input$Add_Lines_BD,
    vlinexintcep = as.numeric(as.Date(input$Line3_Position_BD)),
    vlinecolor = "orange",
    vlinetype = input$Line3_Name_BD,
    vlinewitdh = 1.0,
    showlegd = FALSE)

Plot_Detail_BD <- Plot_Detail_BD +
  vlinedetail(
    Nameline = "Line4",
    Lineselect = input$Add_Lines_BD,
    vlinexintcep = as.numeric(as.Date(input$Line4_Position_BD)),
    vlinecolor = "yellow",
    vlinetype = input$Line4_Name_BD,
    vlinewitdh = 1.0,
    showlegd = FALSE)

Plot_Detail_BD <- Plot_Detail_BD +
  vlinedetail(
    Nameline = "Line5",
    Lineselect = input$Add_Lines_BD,
    vlinexintcep = as.numeric(as.Date(input$Line5_Position_BD)),
    vlinecolor = "green",
    vlinetype = input$Line5_Name_BD,
    vlinewitdh = 1.0,
    showlegd = FALSE)


Plot_Detail_BD <- Plot_Detail_BD +
  vlinedetail(
    Nameline = "Line6",
    Lineselect = input$Add_Lines_BD,
    vlinexintcep = as.numeric(as.Date(input$Line6_Position_BD)),
    vlinecolor = "blue",
    vlinetype = input$Line6_Name_BD,
    vlinewitdh = 1.0,
    showlegd = FALSE)



  
#Script for hline
Plot_Detail_BD <- Plot_Detail_BD +
  hline(
    Nameline = "Add line",
    Lineselect = input$Hline_BD_1,
    hlineyintcep = as.numeric(input$Hline_Position_BD_1),
    hlinecolor = "red",
    hlinetype = "longdash",
    hlinewitdh = 1.0)

Plot_Detail_BD <- Plot_Detail_BD +
  hline(
    Nameline = "Add line",
    Lineselect = input$Hline_BD_2,
    hlineyintcep = as.numeric(input$Hline_Position_BD_2),
    hlinecolor = "red",
    hlinetype = "longdash",
    hlinewitdh = 1.0)
  
  
#Plot the defined plots
  output$StandardPlotBD <- renderPlot({Plot_Standard_BD})
  output$PlotlyBD <- renderPlotly({ggplotly(Plot_Detail_BD)})
})

#-Ui elements for visualization standard tab-
# Selection boxes 
# Selection Instrument
output[["Instruments_BD"]] <- renderUI({
  tryCatch({
  is.null(input$Pre_Processing_Button_BD)
    checkboxGroupInput(inputId = "Instruments_BD",
                       label = "Instruments_BD",
                       choices = c(unique(TableFinal_BD$Instrument)))
    },    error = function(err) {
          return(NULL)
  })
})

# Selection parameter
output[["Parameters_BD"]] <- renderUI({
  tryCatch({
  is.null(input$Pre_Processing_Button_BD)
    radioButtons(inputId = "Parameters_BD",
                label = "Parameters_BD",
                choices = c(unique(TableFinal_BD$variable[TableFinal_BD$Instrument == input$Instruments_BD])))
    },    error = function(err) {
          print(err)
          return(NULL)
  })
})


# Selection laser
output[["LasDetec_BD"]] <- renderUI({
  tryCatch({
    is.null(input$Pre_Processing_Button_BD)
      checkboxGroupInput(inputId = "LasDetec_BD",
                         label = "LasDetec_BD",
                         choices = c(unique(TableFinal_BD$Laser_Detector[TableFinal_BD$variable == input$Parameters_BD
                                    & TableFinal_BD$Instrument == input$Instruments_BD])))
     },  error = function(err) {
         print(err)
         return(NULL)
  })
})



#Ymax_BD en Ymin_BD selection boxes
#Ymin_BD text box
output[["Ymin_BD"]] <- renderUI({ 
  YaxisminBD <- Filteraxisinputmin(Columninputwigdet = TableFinal_BD$value, 
                                   Instrument_input = input$Instruments_BD, 
                                   Parameter_input = input$Parameters_BD, 
                                   Laser_input = input$LasDetec_BD, 
                                   TableInstrument = TableFinal_BD$Instrument, 
                                   TableParameter = TableFinal_BD$variable , 
                                   TableLaser = TableFinal_BD$Laser_Detector
                                )
  tryCatch({
    is.null(input$Pre_Processing_Button_BD)
      textInput(inputId= "Ymin_BD",
               label = "Ymin",
               value = min(YaxisminBD, na.rm = TRUE),
               width = NULL,
               placeholder = NULL)
  },   error = function(err) {
       print(err)
      return(NULL)
  })
})


#Ymax_BD text box
output[["Ymax_BD"]] <- renderUI({
  YaxismaxBD <- Filteraxisinputmax(Columninputwigdet = TableFinal_BD$value, 
                                   Instrument_input = input$Instruments_BD, 
                                   Parameter_input = input$Parameters_BD, 
                                   Laser_input = input$LasDetec_BD, 
                                   TableInstrument = TableFinal_BD$Instrument, 
                                   TableParameter = TableFinal_BD$variable , 
                                   TableLaser = TableFinal_BD$Laser_Detector
  )
  
  tryCatch({
    is.null(input$Pre_Processing_Button_BD)
    textInput(inputId= "Ymax_BD",
              label = "Ymax",
              value = as.numeric(YaxismaxBD, na.rm = TRUE),
              width = NULL,
              placeholder = NULL)
  },  error = function(err) {
      print(err)
      return(NULL)
  })
})  


#Xmax_BD en Ymin_BD selection boxes
#Xmin_BD text box
output[["Xmin_BD"]] <- renderUI({  
  Xaxismin_BD <- Filteraxisinputmin(Columninputwigdet = TableFinal_BD$Date, 
                                    Instrument_input = input$Instruments_BD, 
                                    Parameter_input = input$Parameters_BD, 
                                    Laser_input = input$LasDetec_BD, 
                                    TableInstrument = TableFinal_BD$Instrument, 
                                    TableParameter = TableFinal_BD$variable , 
                                    TableLaser = TableFinal_BD$Laser_Detector)
  
  
  tryCatch({
    is.null(input$Pre_Processing_Button_BD)
      dateInput(inputId= "Xmin_BD",
                label = "Xmin", 
                value = min(Xaxismin_BD, na.rm = TRUE),
                width = NULL)
   }, error = function(err) {
      print(err)
      return(NULL)
  })
})

#Xmax_BD text box
output[["Xmax_BD"]] <- renderUI({ 
  Xaxismax_BD <- Filteraxisinputmax(Columninputwigdet = TableFinal_BD$Date, 
                                    Instrument_input = input$Instruments_BD, 
                                    Parameter_input = input$Parameters_BD, 
                                    Laser_input = input$LasDetec_BD, 
                                    TableInstrument = TableFinal_BD$Instrument, 
                                    TableParameter = TableFinal_BD$variable , 
                                    TableLaser = TableFinal_BD$Laser_Detector)
  tryCatch({
    is.null(input$Pre_Processing_Button_BD)
      dateInput(inputId= "Xmax_BD",
               label = "Xmax",
               value = max(Xaxismax_BD, na.rm = TRUE),
               width = NULL)
   }, error = function(err) {
      print(err)
      return(NULL)
  })
})

#Image BD download button 
output[["Image_BD_plot"]]<- renderUI({
  downloadHandler(filename = "YourplotBD.png" ,
                 content = function(file3) {
                   StandplotBD <- GenerateStandplotimage(PlotvarName = plot_visualization2ExpBD,
                                                       Formatwidth = 30,
                                                       Formatheight = 20,
                                                       Formatunit = "cm",
                                                       filecontent = file3)
  })   
})   

