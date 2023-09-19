#Function for plotting single plot based on parameters
#-Filtering of parameters- 
observeEvent(input$Generate_Plot_CytoFlex, {
  is.null(input$Pre_Processing_Button_cytoflex) 
  Filtered_Data_Plot_cytoflex <- TableFinal_cytoflex
  is.null(input$Pre_Processing_Button_cytoflex) 
  if (!is.null(input$Instruments_cytoflex)) {
    Filtered_Data_Plot_cytoflex <- Filtered_Data_Plot_cytoflex[which(Filtered_Data_Plot_cytoflex$Instrument %in% input$Instruments_cytoflex),]
  }
  if (!is.null(input$Parameters_cytoflex)) {
    Filtered_Data_Plot_cytoflex <- Filtered_Data_Plot_cytoflex[which(Filtered_Data_Plot_cytoflex$variable %in% input$Parameters_cytoflex),]
  } 
  if (!is.null(input$Lasers_cytoflex)) {
    Filtered_Data_Plot_cytoflex <- Filtered_Data_Plot_cytoflex[which(Filtered_Data_Plot_cytoflex$Laser %in% input$Lasers_cytoflex),]
  }
  if (!is.null(input$Detectors_cytoflex)) {
    Filtered_Data_Plot_cytoflex <- Filtered_Data_Plot_cytoflex[which(Filtered_Data_Plot_cytoflex$Detector %in% input$Detectors_cytoflex),]
  }
  if (!is.null(input$PassFail_cytoflex)) {
    Filtered_Data_Plot_cytoflex <- Filtered_Data_Plot_cytoflex[which(Filtered_Data_Plot_cytoflex$Pass_and_Fail %in% input$PassFail_cytoflex),]
  }
  


#Define if laser or detectors have to be colored
Lasers_Detectorscolorcytoflex <- ColorVarPlot(Filter1 = input$Detectors_cytoflex,
                                Filter2 = input$Lasers_cytoflex,
                                Column1 = Filtered_Data_Plot_cytoflex$Detector,
                                Column2 = Filtered_Data_Plot_cytoflex$Laser)

#Define ggplot function
Plot_Standard_cytoflex <- (QCPlotFunctionStand(
                                   Finaldf = Filtered_Data_Plot_cytoflex,
                                  x_axis = Filtered_Data_Plot_cytoflex$Date,
                                  y_axis = Filtered_Data_Plot_cytoflex$value,
                                  Lasers_Detectors = Lasers_Detectorscolorcytoflex,
                                  Instrument = Filtered_Data_Plot_cytoflex$Instrument,
                                  widthline = 0.75,
                                  limxmin = as.Date(input$Xmin_CytoFlex),
                                  limxmax =  as.Date(input$Xmax_CytoFlex),
                                  limymin = as.numeric(input$Ymin_CytoFlex),
                                  limymax = as.numeric(input$Ymax_CytoFlex),
                                  titleplot = input$Title_Graph_Auror,
                                  ylabaxis = input$Title_Yaxis_cytoflex,
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
   Plot_Standard_cytoflex <- Plot_Standard_cytoflex +
     vline(
        Nameline = "Line1",
        Lineselect = input$Add_Lines_cytoflex,
        vlinexintcep = as.numeric(as.Date(input$Line1_Position_cytoflex)),
        vlinecolor = input$Line1_Name_cytoflex,
        vlinetype = 2,
        vlinewitdh = 1.0)
   
   Plot_Standard_cytoflex <- Plot_Standard_cytoflex +
     vline(
       Nameline = "Line2",
       Lineselect = input$Add_Lines_cytoflex,
       vlinexintcep = as.numeric(as.Date(input$Line2_Position_cytoflex)),
       vlinecolor = input$Line2_Name_cytoflex,
       vlinetype = 2,
       vlinewitdh = 1.0)
   
   Plot_Standard_cytoflex <- Plot_Standard_cytoflex +
     vline(
       Nameline = "Line3",
       Lineselect = input$Add_Lines_cytoflex,
       vlinexintcep = as.numeric(as.Date(input$Line3_Position_cytoflex)),
       vlinecolor = input$Line3_Name_cytoflex,
       vlinetype = 2,
       vlinewitdh = 1.0)
   
   Plot_Standard_cytoflex <- Plot_Standard_cytoflex +
     vline(
       Nameline = "Line4",
       Lineselect = input$Add_Lines_cytoflex,
       vlinexintcep = as.numeric(as.Date(input$Line4_Position_cytoflex)),
       vlinecolor = input$Line4_Name_cytoflex,
       vlinetype = 2,
       vlinewitdh = 1.0)
   
   Plot_Standard_cytoflex <- Plot_Standard_cytoflex +
     vline(
       Nameline = "Line5",
       Lineselect = input$Add_Lines_cytoflex,
       vlinexintcep = as.numeric(as.Date(input$Line5_Position_cytoflex)),
       vlinecolor = input$Line5_Name_cytoflex,
       vlinetype = 2,
       vlinewitdh = 1.0)
   
   Plot_Standard_cytoflex <- Plot_Standard_cytoflex +
     vline(
       Nameline = "Line6",
       Lineselect = input$Add_Lines_cytoflex,
       vlinexintcep = as.numeric(as.Date(input$Line6_Position_cytoflex)),
       vlinecolor = input$Line6_Name_cytoflex,
       vlinetype = 2,
       vlinewitdh = 1.0)
  
     
#Script for hline
   Plot_Standard_cytoflex <- Plot_Standard_cytoflex +
     hline(
       Nameline = "Add line",
       Lineselect = input$Hline_cytoflex_1,
       hlineyintcep = as.numeric(input$Hline_Position_cytoflex_1),
       hlinecolor = "red",
       hlinetype = "longdash",
       hlinewitdh = 1.0)
   
   Plot_Standard_cytoflex <- Plot_Standard_cytoflex +
     hline(
       Nameline = "Add line",
       Lineselect = input$Hline_cytoflex_2,
       hlineyintcep = as.numeric(input$Hline_Position_cytoflex_2),
       hlinecolor = "red",
       hlinetype = "longdash",
       hlinewitdh = 1.0)
     
Varimageplot(ImageName = "plot_visualization2Expcytoflex",
             Varimage = Plot_Standard_cytoflex)   

#Function ggplotly
Plot_Detail_cytoflex <- (QCPlotFunctionDetail(
  Finaldf = Filtered_Data_Plot_cytoflex,
  x_axis = Filtered_Data_Plot_cytoflex$Date,
  y_axis = Filtered_Data_Plot_cytoflex$value,
  Lasers_Detectors =  Lasers_Detectorscolorcytoflex,
  Instrument = Filtered_Data_Plot_cytoflex$Instrument,
  widthline = 0.75,
  limxmin = as.Date(input$Xmin_cytoflex),
  limxmax =  as.Date(input$Xmax_cytoflex),
  limymin = as.numeric(input$Ymin_cytoflex),
  limymax = as.numeric(input$Ymax_cytoflex),
  titleplot = input$Title_Graph_cytoflex,
  ylabaxis = input$Title_Yaxis_cytoflex,
  xlabaxis = "Date",
  colorscale = scale_colour_viridis_d(
    alpha = 1,
    begin = 0,
    end = 1,
    direction = 1,
    option = "H",
    aesthetics = "color")))
 

  # Script for vlines and lables
Plot_Detail_cytoflex <- Plot_Detail_cytoflex +
  vlinedetail(
    Nameline = "Line1",
    Lineselect = input$Add_Lines_cytoflex,
    vlinexintcep = as.numeric(as.Date(input$Line1_Position_cytoflex)),
    vlinecolor = "black",
    vlinetype = input$Line1_Name_cytoflex,
    vlinewitdh = 1.0,
    showlegd = FALSE)

Plot_Detail_cytoflex <- Plot_Detail_cytoflex +
  vlinedetail(
    Nameline = "Line2",
    Lineselect = input$Add_Lines_cytoflex,
    vlinexintcep = as.numeric(as.Date(input$Line2_Position_cytoflex)),
    vlinecolor = "red",
    vlinetype = input$Line2_Name_cytoflex,
    vlinewitdh = 1.0,
    showlegd = FALSE)

Plot_Detail_cytoflex <- Plot_Detail_cytoflex +
  vlinedetail(
    Nameline = "Line3",
    Lineselect = input$Add_Lines_cytoflex,
    vlinexintcep = as.numeric(as.Date(input$Line3_Position_cytoflex)),
    vlinecolor = "orange",
    vlinetype = input$Line3_Name_cytoflex,
    vlinewitdh = 1.0,
    showlegd = FALSE)

Plot_Detail_cytoflex <- Plot_Detail_cytoflex +
  vlinedetail(
    Nameline = "Line4",
    Lineselect = input$Add_Lines_cytoflex,
    vlinexintcep = as.numeric(as.Date(input$Line4_Position_cytoflex)),
    vlinecolor = "yellow",
    vlinetype = input$Line4_Name_cytoflex,
    vlinewitdh = 1.0,
    showlegd = FALSE)

Plot_Detail_cytoflex <- Plot_Detail_cytoflex +
  vlinedetail(
    Nameline = "Line5",
    Lineselect = input$Add_Lines_cytoflex,
    vlinexintcep = as.numeric(as.Date(input$Line5_Position_cytoflex)),
    vlinecolor = "green",
    vlinetype = input$Line5_Name_cytoflex,
    vlinewitdh = 1.0,
    showlegd = FALSE)

Plot_Detail_cytoflex <- Plot_Detail_cytoflex +
  vlinedetail(
    Nameline = "Line6",
    Lineselect = input$Add_Lines_cytoflex,
    vlinexintcep = as.numeric(as.Date(input$Line6_Position_cytoflex)),
    vlinecolor = "blue",
    vlinetype = input$Line6_Name_cytoflex,
    vlinewitdh = 1.0,
    showlegd = FALSE)


#Script for hline
Plot_Detail_cytoflex <- Plot_Detail_cytoflex +
  hline(
    Nameline = "Add line",
    Lineselect = input$Hline_cytoflex_1,
    hlineyintcep = as.numeric(input$Hline_Position_cytoflex_1),
    hlinecolor = "red",
    hlinetype = "longdash",
    hlinewitdh = 1.0)

Plot_Detail_cytoflex <- Plot_Detail_cytoflex +
  hline(
    Nameline = "Add line",
    Lineselect = input$Hline_cytoflex_2,
    hlineyintcep = as.numeric(input$Hline_Position_cytoflex_2),
    hlinecolor = "red",
    hlinetype = "longdash",
    hlinewitdh = 1.0)     

     
     
#Plot the defined plots
  output$StandardPlotCytoFlex <- renderPlot({Plot_Standard_cytoflex})
  output$PlotlyCytoFlex <- renderPlotly({ggplotly(Plot_Detail_cytoflex)})
  })

#-Ui elements for visualization standard tab-
# Selection boxes 
# Selection Instrument
output[["Instruments_cytoflex"]] <- renderUI({
  tryCatch({
    is.null(input$Pre_Processing_Button_cytoflex)
      checkboxGroupInput(inputId = "Instruments_cytoflex",
                         label = "Instruments_cytoflex",
                         choices = unique(TableFinal_cytoflex$Instrument))
      },    error = function(err) {
            return(NULL)
  })
})
  
# Selection parameter
output[["Parameters_cytoflex"]] <- renderUI({
  tryCatch({
            is.null(input$Pre_Processing_Button_cytoflex)
            radioButtons(inputId = "Parameters_cytoflex",
                         label = "Parameters_cytoflex",
                         choices = unique(TableFinal_cytoflex$variable[TableFinal_cytoflex$Instrument == input$Instruments_cytoflex]))
      },  error = function(err) {
          print(err)
          return(NULL)
  })
})
  
  
# Selection laser
output[["Lasers_cytoflex"]] <- renderUI({
  tryCatch({
            is.null(input$Pre_Processing_Button_cytoflex)
            checkboxGroupInput(inputId = "Lasers_cytoflex",
                               label = "Lasers_cytoflex",
                               choices = unique(TableFinal_cytoflex$Laser[TableFinal_cytoflex$variable == input$Parameters_cytoflex
                                          & TableFinal_cytoflex$Instrument == input$Instruments_cytoflex]))
     },   error = function(err) {
          print(err)
          return(NULL)
  })
})
  
  
# Selection Detector
output[["Detectors_cytoflex"]] <- renderUI({
  tryCatch({
            is.null(input$Pre_Processing_Button_cytoflex)
            checkboxGroupInput(inputId = "Detectors_cytoflex",
                               label = "Detectors_cytoflex",
                               choices = unique(TableFinal_cytoflex$Detector[TableFinal_cytoflex$Laser == input$Lasers_cytoflex 
                                                & TableFinal_cytoflex$variable == input$Parameters_cytoflex]))
    },    error = function(err) {
          print(err)
          return(NULL)
  })
})
  
  
  
#Selection Pass and Fail
output[["PassFail_cytoflex"]] <- renderUI({
  tryCatch({
            is.null(input$Pre_Processing_Button_cytoflex)
            checkboxGroupInput(inputId = "PassFail_cytoflex",
                               label = "PassFail_cytoflex",
                               choices = c("Pass", "Fail"))
    },   error = function(err) {
         print(err)
         return(NULL)
  })
})
  
#Ymax en Ymin selection boxes
#Ymin text box
output[["Ymin_cytoflex"]] <- renderUI({ 
  Yaxismin <- Filteraxisinputmin(Columninputwigdet = TableFinal_cytoflex$value, 
                                 Instrument_input = input$Instruments_cytoflex, 
                                 Parameter_input = input$Parameters_cytoflex, 
                                 Laser_input = input$Lasers_cytoflex,
                                 Detector_input = input$Detectors_cytoflex, 
                                 TableInstrument = TableFinal_cytoflex$Instrument , 
                                 TableParameter = TableFinal_cytoflex$variable , 
                                 TableLaser = TableFinal_cytoflex$Laser , 
                                 TableDetector = TableFinal_cytoflex$Detector)
    
tryCatch({
  is.null(input$Pre_Processing_Button_cytoflex)
    textInput(inputId= "Ymin_cytoflex",
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
output[["Ymax_cytoflex"]] <- renderUI({
      Yaxismax <- Filteraxisinputmax(Columninputwigdet = TableFinal_cytoflex$value, 
                                    Instrument_input = input$Instruments_cytoflex, 
                                    Parameter_input = input$Parameters_cytoflex, 
                                    Laser_input = input$Lasers_cytoflex,
                                    Detector_input = input$Detectors_cytoflex, 
                                    TableInstrument = TableFinal_cytoflex$Instrument , 
                                    TableParameter = TableFinal_cytoflex$variable , 
                                    TableLaser = TableFinal_cytoflex$Laser , 
                                    TableDetector = TableFinal_cytoflex$Detector)
    
tryCatch({
  is.null(input$Pre_Processing_Button_cytoflex)
    textInput(inputId= "Ymax_cytoflex",
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
  output[["Xmin_cytoflex"]] <- renderUI({  
    Xaxismin <- Filteraxisinputmin(Columninputwigdet = TableFinal_cytoflex$Date, 
                                    Instrument_input = input$Instruments_cytoflex, 
                                    Parameter_input = input$Parameters_cytoflex, 
                                    Laser_input = input$Lasers_cytoflex,
                                    Detector_input = input$Detectors_cytoflex, 
                                    TableInstrument = TableFinal_cytoflex$Instrument , 
                                    TableParameter = TableFinal_cytoflex$variable , 
                                    TableLaser = TableFinal_cytoflex$Laser , 
                                    TableDetector = TableFinal_cytoflex$Detector)
tryCatch({
  is.null(input$Pre_Processing_Button_cytoflex)
    dateInput(inputId= "Xmin_cytoflex",
              label = "Xmin",
              value = min(Xaxismin),
              width = NULL)
    },  error = function(err) {
        print(err)
        return(NULL)
  })
})
  
#Xmax text box
output[["Xmax_cytoflex"]] <- renderUI({ 
  Xaxismax <- Filteraxisinputmax(Columninputwigdet = TableFinal_cytoflex$Date, 
                                 Instrument_input = input$Instruments_cytoflex, 
                                 Parameter_input = input$Parameters_cytoflex, 
                                 Laser_input = input$Lasers_cytoflex,
                                 Detector_input = input$Detectors_cytoflex, 
                                 TableInstrument = TableFinal_cytoflex$Instrument , 
                                 TableParameter = TableFinal_cytoflex$variable , 
                                 TableLaser = TableFinal_cytoflex$Laser , 
                                 TableDetector = TableFinal_cytoflex$Detector)
    
tryCatch({
  is.null(input$Pre_Processing_Button_cytoflex)
    dateInput(inputId= "Xmax_CytoFlex",
              label = "Xmax",
              value = max(Xaxismax),
              width = NULL)
    },  error = function(err) {
        print(err)
        return(NULL)
  })
})
  
#Image cytoflex download button 
output[["Image_CytoFlex_plot"]]<- renderUI({
  downloadHandler(
    filename = "Yourplotcytoflex.png" ,
    content = function(file2) {
      Standplot <- GenerateStandplotimage(PlotvarName = plot_visualization2Expcytoflex,
                                          Formatwidth = 30,
                                          Formatheight = 20,
                                          Formatunit = "cm",
                                          filecontent = file2) })
})   
  
  