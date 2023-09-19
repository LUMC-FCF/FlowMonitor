#Function for plotting single plot based on parameters
#-Filtering of parameters- 
observeEvent(input$Generate_Plot_CytoflexSRT, {
  is.null(input$Pre_Processing_Button_CytoflexSRT) 
  Filtered_Data_Plot_CytoflexSRT <- TableFinal_CytoflexSRT 
  if (!is.null(input$Instruments_CytoflexSRT)) {
      Filtered_Data_Plot_CytoflexSRT <- Filtered_Data_Plot_CytoflexSRT[which(Filtered_Data_Plot_CytoflexSRT$Instrument %in% input$Instruments_CytoflexSRT),]
  }
  if (!is.null(input$Parameters_CytoflexSRT)) {
      Filtered_Data_Plot_CytoflexSRT <- Filtered_Data_Plot_CytoflexSRT[which(Filtered_Data_Plot_CytoflexSRT$variable %in% input$Parameters_CytoflexSRT),]
  }
  if (!is.null(input$LasDetec_CytoflexSRT)) {
     Filtered_Data_Plot_CytoflexSRT <- Filtered_Data_Plot_CytoflexSRT[which(Filtered_Data_Plot_CytoflexSRT$Laser_Detector %in% input$LasDetec_CytoflexSRT),]
  } 
  if (!is.null(input$PassFail_CytoflexSRT)) {
    Filtered_Data_Plot_CytoflexSRT <- Filtered_Data_Plot_CytoflexSRT[which(Filtered_Data_Plot_CytoflexSRT$Pass_and_Fail %in% input$PassFail_CytoflexSRT),]
  }

#Define if laser or detectors have to be colored
  Lasers_DetectorscolorCytoflexSRT <- ColorVarPlot(Filter1 = input$LasDetec_CytoflexSRT,
                                         Column1 = Filtered_Data_Plot_CytoflexSRT$Laser_Detector
                                          )

  
#Define ggplot function
Plot_Standard_CytoflexSRT <- (QCPlotFunctionStand(
                                   Finaldf = Filtered_Data_Plot_CytoflexSRT,
                                   x_axis = Filtered_Data_Plot_CytoflexSRT$Date,
                                   y_axis = Filtered_Data_Plot_CytoflexSRT$value,
                                   Lasers_Detectors = Lasers_DetectorscolorCytoflexSRT,
                                   Instrument = Filtered_Data_Plot_CytoflexSRT$Instrument,
                                   widthline = 0.75,
                                   limxmin = as.Date(input$Xmin_CytoflexSRT),
                                   limxmax =  as.Date(input$Xmax_CytoflexSRT),
                                   limymin = as.numeric(input$Ymin_CytoflexSRT),
                                   limymax = as.numeric(input$Ymax_CytoflexSRT),
                                   titleplot = input$Title_Graph_CytoflexSRT,
                                   ylabaxis = input$Title_Yaxis_CytoflexSRT,
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
  
  Plot_Standard_CytoflexSRT <- Plot_Standard_CytoflexSRT +    
    vline(
      Nameline = "Line1",
      Lineselect = input$Add_Lines_CytoflexSRT,
      vlinexintcep = as.numeric(as.Date(input$Line1_Position_CytoflexSRT)),
      vlinecolor = input$Line1_Name_CytoflexSRT,
      vlinetype = 2,
      vlinewitdh = 1.0)
  
  Plot_Standard_CytoflexSRT <- Plot_Standard_CytoflexSRT + 
    vline(
      Nameline = "Line2",
      Lineselect = input$Add_Lines_CytoflexSRT,
      vlinexintcep = as.numeric(as.Date(input$Line2_Position_CytoflexSRT)),
      vlinecolor = input$Line2_Name_CytoflexSRT,
      vlinetype = 2,
      vlinewitdh = 1.0)
  
  Plot_Standard_CytoflexSRT <- Plot_Standard_CytoflexSRT +   
    vline(
      Nameline = "Line3",
      Lineselect = input$Add_Lines_CytoflexSRT,
      vlinexintcep = as.numeric(as.Date(input$Line3_Position_CytoflexSRT)),
      vlinecolor = input$Line3_Name_CytoflexSRT,
      vlinetype = 2,
      vlinewitdh = 1.0)
  
  Plot_Standard_CytoflexSRT <- Plot_Standard_CytoflexSRT + 
    vline(
      Nameline = "Line4",
      Lineselect = input$Add_Lines_CytoflexSRT,
      vlinexintcep = as.numeric(as.Date(input$Line4_Position_CytoflexSRT)),
      vlinecolor = input$Line4_Name_CytoflexSRT,
      vlinetype = 2,
      vlinewitdh = 1.0)
  
  Plot_Standard_CytoflexSRT <- Plot_Standard_CytoflexSRT +    
    vline(
      Nameline = "Line5",
      Lineselect = input$Add_Lines_CytoflexSRT,
      vlinexintcep = as.numeric(as.Date(input$Line5_Position_CytoflexSRT)),
      vlinecolor = input$Line5_Name_CytoflexSRT,
      vlinetype = 2,
      vlinewitdh = 1.0)
  
  Plot_Standard_CytoflexSRT <- Plot_Standard_CytoflexSRT +   
    vline(
      Nameline = "Line6",
      Lineselect = input$Add_Lines_CytoflexSRT,
      vlinexintcep = as.numeric(as.Date(input$Line6_Position_CytoflexSRT)),
      vlinecolor = input$Line6_Name_CytoflexSRT,
      vlinetype = 2,
      vlinewitdh = 1.0)
  

  
#Add hline  
    Plot_Standard_CytoflexSRT <- Plot_Standard_CytoflexSRT +
    hline(
      Nameline = "Add line",
      Lineselect = input$Hline_CytoflexSRT_1,
      hlineyintcep = as.numeric(input$Hline_Position_CytoflexSRT_1),
      hlinecolor = "red",
      hlinetype = "longdash",
      hlinewitdh = 1.0)
  
  Plot_Standard_CytoflexSRT <- Plot_Standard_CytoflexSRT +
    hline(
      Nameline = "Add line",
      Lineselect = input$Hline_CytoflexSRT_2,
      hlineyintcep = as.numeric(input$Hline_Position_CytoflexSRT_2),
      hlinecolor = "red",
      hlinetype = "longdash",
      hlinewitdh = 1.0)
  

Varimageplot(ImageName = "plot_visualization2ExpCytoflexSRT",
             Varimage = Plot_Standard_CytoflexSRT)  

#Define ggplotly 
Plot_Detail_CytoflexSRT <- (QCPlotFunctionDetail(
                                       Finaldf = Filtered_Data_Plot_CytoflexSRT,
                                       x_axis = Filtered_Data_Plot_CytoflexSRT$Date,
                                       y_axis = Filtered_Data_Plot_CytoflexSRT$value,
                                       Lasers_Detectors = Lasers_DetectorscolorCytoflexSRT,
                                       Instrument = Filtered_Data_Plot_CytoflexSRT$Instrument,
                                       widthline = 0.75,
                                       limxmin = as.Date(input$Xmin_CytoflexSRT),
                                       limxmax =  as.Date(input$Xmax_CytoflexSRT),
                                       limymin = as.numeric(input$Ymin_CytoflexSRT),
                                       limymax = as.numeric(input$Ymax_CytoflexSRT),
                                       titleplot = input$Title_Graph_CytoflexSRT,
                                       ylabaxis = input$Title_Yaxis_CytoflexSRT,
                                       xlabaxis = "Date",
                                       colorscale = scale_colour_viridis_d(
                                                   alpha = 1,
                                                   begin = 0,
                                                   end = 1,
                                                   direction = 1,
                                                   option = "H",
                                                   aesthetics = "color")))

  
# Script for vlines and lables
Plot_Detail_CytoflexSRT <- Plot_Detail_CytoflexSRT +
  vlinedetail(
    Nameline = "Line1",
    Lineselect = input$Add_Lines_CytoflexSRT,
    vlinexintcep = as.numeric(as.Date(input$Line1_Position_CytoflexSRT)),
    vlinecolor = "black",
    vlinetype = input$Line1_Name_CytoflexSRT,
    vlinewitdh = 1.0,
    showlegd = FALSE)


Plot_Detail_CytoflexSRT <- Plot_Detail_CytoflexSRT +
  vlinedetail(
    Nameline = "Line2",
    Lineselect = input$Add_Lines_CytoflexSRT,
    vlinexintcep = as.numeric(as.Date(input$Line2_Position_CytoflexSRT)),
    vlinecolor = "red",
    vlinetype = input$Line2_Name_CytoflexSRT,
    vlinewitdh = 1.0,
    showlegd = FALSE)

Plot_Detail_CytoflexSRT <- Plot_Detail_CytoflexSRT +
  vlinedetail(
    Nameline = "Line3",
    Lineselect = input$Add_Lines_CytoflexSRT,
    vlinexintcep = as.numeric(as.Date(input$Line3_Position_CytoflexSRT)),
    vlinecolor = "orange",
    vlinetype = input$Line3_Name_CytoflexSRT,
    vlinewitdh = 1.0,
    showlegd = FALSE)

Plot_Detail_CytoflexSRT <- Plot_Detail_CytoflexSRT +
  vlinedetail(
    Nameline = "Line4",
    Lineselect = input$Add_Lines_CytoflexSRT,
    vlinexintcep = as.numeric(as.Date(input$Line4_Position_CytoflexSRT)),
    vlinecolor = "yellow",
    vlinetype = input$Line4_Name_CytoflexSRT,
    vlinewitdh = 1.0,
    showlegd = FALSE)

Plot_Detail_CytoflexSRT <- Plot_Detail_CytoflexSRT +
  vlinedetail(
    Nameline = "Line5",
    Lineselect = input$Add_Lines_CytoflexSRT,
    vlinexintcep = as.numeric(as.Date(input$Line5_Position_CytoflexSRT)),
    vlinecolor = "green",
    vlinetype = input$Line5_Name_CytoflexSRT,
    vlinewitdh = 1.0,
    showlegd = FALSE)


Plot_Detail_CytoflexSRT <- Plot_Detail_CytoflexSRT +
  vlinedetail(
    Nameline = "Line6",
    Lineselect = input$Add_Lines_CytoflexSRT,
    vlinexintcep = as.numeric(as.Date(input$Line6_Position_CytoflexSRT)),
    vlinecolor = "blue",
    vlinetype = input$Line6_Name_CytoflexSRT,
    vlinewitdh = 1.0,
    showlegd = FALSE)



  
#Script for hline
Plot_Detail_CytoflexSRT <- Plot_Detail_CytoflexSRT +
  hline(
    Nameline = "Add line",
    Lineselect = input$Hline_CytoflexSRT_1,
    hlineyintcep = as.numeric(input$Hline_Position_CytoflexSRT_1),
    hlinecolor = "red",
    hlinetype = "longdash",
    hlinewitdh = 1.0)

Plot_Detail_CytoflexSRT <- Plot_Detail_CytoflexSRT +
  hline(
    Nameline = "Add line",
    Lineselect = input$Hline_CytoflexSRT_2,
    hlineyintcep = as.numeric(input$Hline_Position_CytoflexSRT_2),
    hlinecolor = "red",
    hlinetype = "longdash",
    hlinewitdh = 1.0)
  
  
#Plot the defined plots
  output$StandardPlotCytoflexSRT <- renderPlot({Plot_Standard_CytoflexSRT})
  output$PlotlyCytoflexSRT <- renderPlotly({ggplotly(Plot_Detail_CytoflexSRT)})
})

#-Ui elements for visualization standard tab-
# Selection boxes 
# Selection Instrument
output[["Instruments_CytoflexSRT"]] <- renderUI({
  tryCatch({
  is.null(input$Pre_Processing_Button_CytoflexSRT)
    checkboxGroupInput(inputId = "Instruments_CytoflexSRT",
                       label = "Instruments_CytoflexSRT",
                       choices = c(unique(TableFinal_CytoflexSRT$Instrument)))
    },    error = function(err) {
          return(NULL)
  })
})

# Selection parameter
output[["Parameters_CytoflexSRT"]] <- renderUI({
  tryCatch({
  is.null(input$Pre_Processing_Button_CytoflexSRT)
    radioButtons(inputId = "Parameters_CytoflexSRT",
                label = "Parameters_CytoflexSRT",
                choices = c(unique(TableFinal_CytoflexSRT$variable[TableFinal_CytoflexSRT$Instrument == input$Instruments_CytoflexSRT])))
    },    error = function(err) {
          print(err)
          return(NULL)
  })
})


# Selection laser
output[["LasDetec_CytoflexSRT"]] <- renderUI({
  tryCatch({
    is.null(input$Pre_Processing_Button_CytoflexSRT)
      checkboxGroupInput(inputId = "LasDetec_CytoflexSRT",
                         label = "LasDetec_CytoflexSRT",
                         choices = c(unique(TableFinal_CytoflexSRT$Laser_Detector[TableFinal_CytoflexSRT$variable == input$Parameters_CytoflexSRT
                                    & TableFinal_CytoflexSRT$Instrument == input$Instruments_CytoflexSRT])))
     },  error = function(err) {
         print(err)
         return(NULL)
  })
})

#Selection Pass and Fail
output[["PassFail_CytoflexSRT"]] <- renderUI({
  tryCatch({
            is.null(input$Pre_Processing_Button_CytoflexSRT)
            checkboxGroupInput(inputId = "PassFail_CytoflexSRT",
                               label = "PassFail_CytoflexSRT",
                               choices = c("Pass", "Fail"))
    },   error = function(err) {
         print(err)
         return(NULL)
  })
})

#Ymax_CytoflexSRT en Ymin_CytoflexSRT selection boxes
#Ymin_CytoflexSRT text box
output[["Ymin_CytoflexSRT"]] <- renderUI({ 
  YaxisminCytoflexSRT <- Filteraxisinputmin(Columninputwigdet = TableFinal_CytoflexSRT$value, 
                                   Instrument_input = input$Instruments_CytoflexSRT, 
                                   Parameter_input = input$Parameters_CytoflexSRT, 
                                   Laser_input = input$LasDetec_CytoflexSRT, 
                                   TableInstrument = TableFinal_CytoflexSRT$Instrument, 
                                   TableParameter = TableFinal_CytoflexSRT$variable , 
                                   TableLaser = TableFinal_CytoflexSRT$Laser_Detector
                                )
  tryCatch({
    is.null(input$Pre_Processing_Button_CytoflexSRT)
      textInput(inputId= "Ymin_CytoflexSRT",
               label = "Ymin",
               value = min(YaxisminCytoflexSRT, na.rm = TRUE),
               width = NULL,
               placeholder = NULL)
  },   error = function(err) {
       print(err)
      return(NULL)
  })
})


#Ymax_CytoflexSRT text box
output[["Ymax_CytoflexSRT"]] <- renderUI({
  YaxismaxCytoflexSRT <- Filteraxisinputmax(Columninputwigdet = TableFinal_CytoflexSRT$value, 
                                   Instrument_input = input$Instruments_CytoflexSRT, 
                                   Parameter_input = input$Parameters_CytoflexSRT, 
                                   Laser_input = input$LasDetec_CytoflexSRT, 
                                   TableInstrument = TableFinal_CytoflexSRT$Instrument, 
                                   TableParameter = TableFinal_CytoflexSRT$variable , 
                                   TableLaser = TableFinal_CytoflexSRT$Laser_Detector
  )
  
  tryCatch({
    is.null(input$Pre_Processing_Button_CytoflexSRT)
    textInput(inputId= "Ymax_CytoflexSRT",
              label = "Ymax",
              value = as.numeric(YaxismaxCytoflexSRT, na.rm = TRUE),
              width = NULL,
              placeholder = NULL)
  },  error = function(err) {
      print(err)
      return(NULL)
  })
})  


#Xmax_CytoflexSRT en Ymin_CytoflexSRT selection boxes
#Xmin_CytoflexSRT text box
output[["Xmin_CytoflexSRT"]] <- renderUI({  
  Xaxismin_CytoflexSRT <- Filteraxisinputmin(Columninputwigdet = TableFinal_CytoflexSRT$Date, 
                                    Instrument_input = input$Instruments_CytoflexSRT, 
                                    Parameter_input = input$Parameters_CytoflexSRT, 
                                    Laser_input = input$LasDetec_CytoflexSRT, 
                                    TableInstrument = TableFinal_CytoflexSRT$Instrument, 
                                    TableParameter = TableFinal_CytoflexSRT$variable , 
                                    TableLaser = TableFinal_CytoflexSRT$Laser_Detector)
  
  
  tryCatch({
    is.null(input$Pre_Processing_Button_CytoflexSRT)
      dateInput(inputId= "Xmin_CytoflexSRT",
                label = "Xmin", 
                value = min(Xaxismin_CytoflexSRT, na.rm = TRUE),
                width = NULL)
   }, error = function(err) {
      print(err)
      return(NULL)
  })
})

#Xmax_CytoflexSRT text box
output[["Xmax_CytoflexSRT"]] <- renderUI({ 
  Xaxismax_CytoflexSRT <- Filteraxisinputmax(Columninputwigdet = TableFinal_CytoflexSRT$Date, 
                                    Instrument_input = input$Instruments_CytoflexSRT, 
                                    Parameter_input = input$Parameters_CytoflexSRT, 
                                    Laser_input = input$LasDetec_CytoflexSRT, 
                                    TableInstrument = TableFinal_CytoflexSRT$Instrument, 
                                    TableParameter = TableFinal_CytoflexSRT$variable , 
                                    TableLaser = TableFinal_CytoflexSRT$Laser_Detector)
  tryCatch({
    is.null(input$Pre_Processing_Button_CytoflexSRT)
      dateInput(inputId= "Xmax_CytoflexSRT",
               label = "Xmax",
               value = max(Xaxismax_CytoflexSRT, na.rm = TRUE),
               width = NULL)
   }, error = function(err) {
      print(err)
      return(NULL)
  })
})

#Image CytoflexSRT download button 
output[["Image_CytoflexSRT_plot"]]<- renderUI({
  downloadHandler(filename = "YourplotCytoflexSRT.png" ,
                 content = function(file3) {
                   StandplotCytoflexSRT <- GenerateStandplotimage(PlotvarName = plot_visualization2ExpCytoflexSRT,
                                                       Formatwidth = 30,
                                                       Formatheight = 20,
                                                       Formatunit = "cm",
                                                       filecontent = file3)
  })   
})   

