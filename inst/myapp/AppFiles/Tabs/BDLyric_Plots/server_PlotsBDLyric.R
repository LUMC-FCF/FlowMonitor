#Function for plotting single plot based on parameters
#-Filtering of parameters- 
observeEvent(input$Generate_Plot_BDLyric, {
  is.null(input$Pre_Processing_Button_BDLyric) 
  Filtered_Data_Plot_BDLyric <- TableFinal_BDLyric 

  if (!is.null(input$Instruments_BDLyric)) {
      Filtered_Data_Plot_BDLyric <- Filtered_Data_Plot_BDLyric[which(Filtered_Data_Plot_BDLyric$Instrument %in% input$Instruments_BDLyric),]
  }
  if (!is.null(input$Parameters_BDLyric)) {
      Filtered_Data_Plot_BDLyric <- Filtered_Data_Plot_BDLyric[which(Filtered_Data_Plot_BDLyric$variable %in% input$Parameters_BDLyric),]
  }
  if (!is.null(input$LasDetec_BDLyric)) {
     Filtered_Data_Plot_BDLyric <- Filtered_Data_Plot_BDLyric[which(Filtered_Data_Plot_BDLyric$Laser_Detector %in% input$LasDetec_BDLyric),]
  } 

 if (!is.null(input$PassFail_BDLyric)) {
    Filtered_Data_Plot_BDLyric <- Filtered_Data_Plot_BDLyric[which(Filtered_Data_Plot_BDLyric$Pass_and_Fail %in% input$PassFail_BDLyric),]
  }

#Define if laser or detectors have to be colored
  Lasers_DetectorscolorBDLyric <- ColorVarPlot(Filter1 = input$LasDetec_BDLyric,
                                         Column1 = Filtered_Data_Plot_BDLyric$Laser_Detector
                                          )

  
#Define ggplot function
Plot_Standard_BDLyric <- (QCPlotFunctionStand(
                                   Finaldf = Filtered_Data_Plot_BDLyric,
                                   x_axis = Filtered_Data_Plot_BDLyric$Date,
                                   y_axis = Filtered_Data_Plot_BDLyric$value,
                                   Lasers_Detectors = Lasers_DetectorscolorBDLyric,
                                   Instrument = Filtered_Data_Plot_BDLyric$Instrument,
                                   widthline = 0.75,
                                   limxmin = as.Date(input$Xmin_BDLyric),
                                   limxmax =  as.Date(input$Xmax_BDLyric),
                                   limymin = as.numeric(input$Ymin_BDLyric),
                                   limymax = as.numeric(input$Ymax_BDLyric),
                                   titleplot = input$Title_Graph_BDLyric,
                                   ylabaxis = input$Title_Yaxis_BDLyric,
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
  
  Plot_Standard_BDLyric <- Plot_Standard_BDLyric +    
    vline(
      Nameline = "Line1",
      Lineselect = input$Add_Lines_BDLyric,
      vlinexintcep = as.numeric(as.Date(input$Line1_Position_BDLyric)),
      vlinecolor = input$Line1_Name_BDLyric,
      vlinetype = 2,
      vlinewitdh = 1.0)
  
  Plot_Standard_BDLyric <- Plot_Standard_BDLyric + 
    vline(
      Nameline = "Line2",
      Lineselect = input$Add_Lines_BDLyric,
      vlinexintcep = as.numeric(as.Date(input$Line2_Position_BDLyric)),
      vlinecolor = input$Line2_Name_BDLyric,
      vlinetype = 2,
      vlinewitdh = 1.0)
  
  Plot_Standard_BDLyric <- Plot_Standard_BDLyric +   
    vline(
      Nameline = "Line3",
      Lineselect = input$Add_Lines_BDLyric,
      vlinexintcep = as.numeric(as.Date(input$Line3_Position_BDLyric)),
      vlinecolor = input$Line3_Name_BDLyric,
      vlinetype = 2,
      vlinewitdh = 1.0)
  
  Plot_Standard_BDLyric <- Plot_Standard_BDLyric + 
    vline(
      Nameline = "Line4",
      Lineselect = input$Add_Lines_BDLyric,
      vlinexintcep = as.numeric(as.Date(input$Line4_Position_BDLyric)),
      vlinecolor = input$Line4_Name_BDLyric,
      vlinetype = 2,
      vlinewitdh = 1.0)
  
  Plot_Standard_BDLyric <- Plot_Standard_BDLyric +    
    vline(
      Nameline = "Line5",
      Lineselect = input$Add_Lines_BDLyric,
      vlinexintcep = as.numeric(as.Date(input$Line5_Position_BDLyric)),
      vlinecolor = input$Line5_Name_BDLyric,
      vlinetype = 2,
      vlinewitdh = 1.0)
  
  Plot_Standard_BDLyric <- Plot_Standard_BDLyric +   
    vline(
      Nameline = "Line6",
      Lineselect = input$Add_Lines_BDLyric,
      vlinexintcep = as.numeric(as.Date(input$Line6_Position_BDLyric)),
      vlinecolor = input$Line6_Name_BDLyric,
      vlinetype = 2,
      vlinewitdh = 1.0)
  

  
#Add hline  
    Plot_Standard_BDLyric <- Plot_Standard_BDLyric +
    hline(
      Nameline = "Add line",
      Lineselect = input$Hline_BDLyric_1,
      hlineyintcep = as.numeric(input$Hline_Position_BDLyric_1),
      hlinecolor = "red",
      hlinetype = "longdash",
      hlinewitdh = 1.0)
  
  Plot_Standard_BDLyric <- Plot_Standard_BDLyric +
    hline(
      Nameline = "Add line",
      Lineselect = input$Hline_BDLyric_2,
      hlineyintcep = as.numeric(input$Hline_Position_BDLyric_2),
      hlinecolor = "red",
      hlinetype = "longdash",
      hlinewitdh = 1.0)
  

Varimageplot(ImageName = "plot_visualization2ExpBDLyric",
             Varimage = Plot_Standard_BDLyric)  

#Define ggplotly 
Plot_Detail_BDLyric <- (QCPlotFunctionDetail(
                                       Finaldf = Filtered_Data_Plot_BDLyric,
                                       x_axis = Filtered_Data_Plot_BDLyric$Date,
                                       y_axis = Filtered_Data_Plot_BDLyric$value,
                                       Lasers_Detectors = Lasers_DetectorscolorBDLyric,
                                       Instrument = Filtered_Data_Plot_BDLyric$Instrument,
                                       widthline = 0.75,
                                       limxmin = as.Date(input$Xmin_BDLyric),
                                       limxmax =  as.Date(input$Xmax_BDLyric),
                                       limymin = as.numeric(input$Ymin_BDLyric),
                                       limymax = as.numeric(input$Ymax_BDLyric),
                                       titleplot = input$Title_Graph_BDLyric,
                                       ylabaxis = input$Title_Yaxis_BDLyric,
                                       xlabaxis = "Date",
                                       colorscale = scale_colour_viridis_d(
                                                   alpha = 1,
                                                   begin = 0,
                                                   end = 1,
                                                   direction = 1,
                                                   option = "H",
                                                   aesthetics = "color")))

  
# Script for vlines and lables
Plot_Detail_BDLyric <- Plot_Detail_BDLyric +
  vlinedetail(
    Nameline = "Line1",
    Lineselect = input$Add_Lines_BDLyric,
    vlinexintcep = as.numeric(as.Date(input$Line1_Position_BDLyric)),
    vlinecolor = "black",
    vlinetype = input$Line1_Name_BDLyric,
    vlinewitdh = 1.0,
    showlegd = FALSE)


Plot_Detail_BDLyric <- Plot_Detail_BDLyric +
  vlinedetail(
    Nameline = "Line2",
    Lineselect = input$Add_Lines_BDLyric,
    vlinexintcep = as.numeric(as.Date(input$Line2_Position_BDLyric)),
    vlinecolor = "red",
    vlinetype = input$Line2_Name_BDLyric,
    vlinewitdh = 1.0,
    showlegd = FALSE)

Plot_Detail_BDLyric <- Plot_Detail_BDLyric +
  vlinedetail(
    Nameline = "Line3",
    Lineselect = input$Add_Lines_BDLyric,
    vlinexintcep = as.numeric(as.Date(input$Line3_Position_BDLyric)),
    vlinecolor = "orange",
    vlinetype = input$Line3_Name_BDLyric,
    vlinewitdh = 1.0,
    showlegd = FALSE)

Plot_Detail_BDLyric <- Plot_Detail_BDLyric +
  vlinedetail(
    Nameline = "Line4",
    Lineselect = input$Add_Lines_BDLyric,
    vlinexintcep = as.numeric(as.Date(input$Line4_Position_BDLyric)),
    vlinecolor = "yellow",
    vlinetype = input$Line4_Name_BDLyric,
    vlinewitdh = 1.0,
    showlegd = FALSE)

Plot_Detail_BDLyric <- Plot_Detail_BDLyric +
  vlinedetail(
    Nameline = "Line5",
    Lineselect = input$Add_Lines_BDLyric,
    vlinexintcep = as.numeric(as.Date(input$Line5_Position_BDLyric)),
    vlinecolor = "green",
    vlinetype = input$Line5_Name_BDLyric,
    vlinewitdh = 1.0,
    showlegd = FALSE)


Plot_Detail_BDLyric <- Plot_Detail_BDLyric +
  vlinedetail(
    Nameline = "Line6",
    Lineselect = input$Add_Lines_BDLyric,
    vlinexintcep = as.numeric(as.Date(input$Line6_Position_BDLyric)),
    vlinecolor = "blue",
    vlinetype = input$Line6_Name_BDLyric,
    vlinewitdh = 1.0,
    showlegd = FALSE)



  
#Script for hline
Plot_Detail_BDLyric <- Plot_Detail_BDLyric +
  hline(
    Nameline = "Add line",
    Lineselect = input$Hline_BDLyric_1,
    hlineyintcep = as.numeric(input$Hline_Position_BDLyric_1),
    hlinecolor = "red",
    hlinetype = "longdash",
    hlinewitdh = 1.0)

Plot_Detail_BDLyric <- Plot_Detail_BDLyric +
  hline(
    Nameline = "Add line",
    Lineselect = input$Hline_BDLyric_2,
    hlineyintcep = as.numeric(input$Hline_Position_BDLyric_2),
    hlinecolor = "red",
    hlinetype = "longdash",
    hlinewitdh = 1.0)
  
  
#Plot the defined plots
  output$StandardPlotBDLyric <- renderPlot({Plot_Standard_BDLyric})
  output$PlotlyBDLyric <- renderPlotly({ggplotly(Plot_Detail_BDLyric)})
})

#-Ui elements for visualization standard tab-
# Selection boxes 
# Selection Instrument
output[["Instruments_BDLyric"]] <- renderUI({
  tryCatch({
  is.null(input$Pre_Processing_Button_BDLyric)
    checkboxGroupInput(inputId = "Instruments_BDLyric",
                       label = "Instruments_BDLyric",
                       choices = c(unique(TableFinal_BDLyric$Instrument)))
    },    error = function(err) {
          return(NULL)
  })
})

# Selection parameter
output[["Parameters_BDLyric"]] <- renderUI({
  tryCatch({
  is.null(input$Pre_Processing_Button_BDLyric)
    radioButtons(inputId = "Parameters_BDLyric",
                label = "Parameters_BDLyric",
                choices = c(unique(TableFinal_BDLyric$variable[TableFinal_BDLyric$Instrument == input$Instruments_BDLyric])))
    },    error = function(err) {
          print(err)
          return(NULL)
  })
})


# Selection laser
output[["LasDetec_BDLyric"]] <- renderUI({
  tryCatch({
    is.null(input$Pre_Processing_Button_BDLyric)
      checkboxGroupInput(inputId = "LasDetec_BDLyric",
                         label = "LasDetec_BDLyric",
                         choices = c(unique(TableFinal_BDLyric$Laser_Detector[TableFinal_BDLyric$variable == input$Parameters_BDLyric
                                    & TableFinal_BDLyric$Instrument == input$Instruments_BDLyric])))
     },  error = function(err) {
         print(err)
         return(NULL)
  })
})

#Selection Pass and Fail
output[["PassFail_BDLyric"]] <- renderUI({
  tryCatch({
            is.null(input$Pre_Processing_Button_BDLyric)
            checkboxGroupInput(inputId = "PassFail_BDLyric",
                               label = "PassFail_BDLyric",
                               choices = c("PASSED", "FAILED"))
    },   error = function(err) {
         print(err)
         return(NULL)
  })
})

#Ymax_BDLyric en Ymin_BDLyric selection boxes
#Ymin_BDLyric text box
output[["Ymin_BDLyric"]] <- renderUI({ 
  YaxisminBDLyric <- Filteraxisinputmin(Columninputwigdet = TableFinal_BDLyric$value, 
                                   Instrument_input = input$Instruments_BDLyric, 
                                   Parameter_input = input$Parameters_BDLyric, 
                                   Laser_input = input$LasDetec_BDLyric, 
                                   TableInstrument = TableFinal_BDLyric$Instrument, 
                                   TableParameter = TableFinal_BDLyric$variable , 
                                   TableLaser = TableFinal_BDLyric$Laser_Detector
                                )
  tryCatch({
    is.null(input$Pre_Processing_Button_BDLyric)
      textInput(inputId= "Ymin_BDLyric",
               label = "Ymin",
               value = min(YaxisminBDLyric, na.rm = TRUE),
               width = NULL,
               placeholder = NULL)
  },   error = function(err) {
       print(err)
      return(NULL)
  })
})


#Ymax_BDLyric text box
output[["Ymax_BDLyric"]] <- renderUI({
  YaxismaxBDLyric <- Filteraxisinputmax(Columninputwigdet = TableFinal_BDLyric$value, 
                                   Instrument_input = input$Instruments_BDLyric, 
                                   Parameter_input = input$Parameters_BDLyric, 
                                   Laser_input = input$LasDetec_BDLyric, 
                                   TableInstrument = TableFinal_BDLyric$Instrument, 
                                   TableParameter = TableFinal_BDLyric$variable , 
                                   TableLaser = TableFinal_BDLyric$Laser_Detector
  )
  
  tryCatch({
    is.null(input$Pre_Processing_Button_BDLyric)
    textInput(inputId= "Ymax_BDLyric",
              label = "Ymax",
              value = as.numeric(YaxismaxBDLyric, na.rm = TRUE),
              width = NULL,
              placeholder = NULL)
  },  error = function(err) {
      print(err)
      return(NULL)
  })
})  


#Xmax_BDLyric en Ymin_BDLyric selection boxes
#Xmin_BDLyric text box
output[["Xmin_BDLyric"]] <- renderUI({  
  Xaxismin_BDLyric <- Filteraxisinputmin(Columninputwigdet = TableFinal_BDLyric$Date, 
                                    Instrument_input = input$Instruments_BDLyric, 
                                    Parameter_input = input$Parameters_BDLyric, 
                                    Laser_input = input$LasDetec_BDLyric, 
                                    TableInstrument = TableFinal_BDLyric$Instrument, 
                                    TableParameter = TableFinal_BDLyric$variable , 
                                    TableLaser = TableFinal_BDLyric$Laser_Detector)
  
  
  tryCatch({
    is.null(input$Pre_Processing_Button_BDLyric)
      dateInput(inputId= "Xmin_BDLyric",
                label = "Xmin", 
                value = min(Xaxismin_BDLyric, na.rm = TRUE),
                width = NULL)
   }, error = function(err) {
      print(err)
      return(NULL)
  })
})

#Xmax_BDLyric text box
output[["Xmax_BDLyric"]] <- renderUI({ 
  Xaxismax_BDLyric <- Filteraxisinputmax(Columninputwigdet = TableFinal_BDLyric$Date, 
                                    Instrument_input = input$Instruments_BDLyric, 
                                    Parameter_input = input$Parameters_BDLyric, 
                                    Laser_input = input$LasDetec_BDLyric, 
                                    TableInstrument = TableFinal_BDLyric$Instrument, 
                                    TableParameter = TableFinal_BDLyric$variable , 
                                    TableLaser = TableFinal_BDLyric$Laser_Detector)
  tryCatch({
    is.null(input$Pre_Processing_Button_BDLyric)
      dateInput(inputId= "Xmax_BDLyric",
               label = "Xmax",
               value = max(Xaxismax_BDLyric, na.rm = TRUE),
               width = NULL)
   }, error = function(err) {
      print(err)
      return(NULL)
  })
})

#Image BDLyric download button 
output[["Image_BDLyric_plot"]]<- renderUI({
  downloadHandler(filename = "YourplotBDLyric.png" ,
                 content = function(file3) {
                   StandplotBDLyric <- GenerateStandplotimage(PlotvarName = plot_visualization2ExpBDLyric,
                                                       Formatwidth = 30,
                                                       Formatheight = 20,
                                                       Formatunit = "cm",
                                                       filecontent = file3)
  })   
})   

