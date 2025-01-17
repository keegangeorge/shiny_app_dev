# qualityControlTab <- tabItem(tabName = "qualityControl",
#                           fluidRow(
#                             column(9,
#                               HTML("Quality Control Page")
#                             ),
#                             column(width = 3,
#                                    div(style = "display:inline-block; float:right", 
#                                        actionButton('qcAnalyzed', label = 'Proceed', status = "success")))
#                           )
# )

qCTab <- tabItem(tabName = "qC",
                              fluidRow(
                                  column(1,
                                         div(style = "display:inline-block; float:left", 
                                             actionButton('backTo_dataImport', label = 'Back', status = "success"))
                                  ),
                                  column(5,
                                         selectInput("qc_method", "Choose a QC visualization method before normalization.", choices = c("NUSE","RLE")),
                                         actionButton("vis_dat","Visualize Data")
                                  ),
                                  column(5,
                                         
                                         plotOutput("plot_raw"),
                                         textOutput("normal"),
                                         textOutput("norm_comp"),
                                         
                                  ),
                                  # @roman_ramirez
                                  column(width = 1,
                                         div(style = "display:inline-block; float:right", 
                                             actionButton('to_normalization', label = 'Next', status = "success"))
                                  )
                              )
)

normalizationTab <- tabItem(tabName = "normalization",
                              fluidRow(
                                  column(1,
                                         div(style = "display:inline-block; float:left", 
                                             actionButton('backTo_qC', label = 'Back', status = "success"))
                                  ),
                                  column(5,
                                         #Disha
                                         radioButtons("normlztype","Which normalization method do you want to use?", choices=list("RMA","GCRMA","MAS5")),
                                         actionButton("normlzdata","Begin Normalization"),
                                  ),
                                  column(5,
                                         textOutput("batch_com"),
                                         htmlOutput("pc_comp"),
                                         htmlOutput("feat"),
                                  ),
                                  # @roman_ramirez
                                  column(width = 1,
                                         div(style = "display:inline-block; float:right", 
                                             actionButton('to_batchCorrection', label = 'Next', status = "success"))
                                  )
                              )
)

batchCorrectionTab <- tabItem(tabName = "batchCorrection",
                             fluidRow(
                                 column(1, 
                                     div(style = "display:inline-block; float:left", 
                                         actionButton('backTo_normalization', label = 'Back', status = "success"))
                                 ),
                                 column(5,
                                        htmlOutput("batch_cat"),
                                        actionButton("startbatch","Perform Batch Correction"),
                                        selectInput("qc_method2", "Choose a QC visualization method after normalization.", choices = c("Boxplot","PCA")),
                                        actionButton("vis_button", "Generate Plot", icon = icon("play")),
                                 ),
                                 column(5,
                                        actionButton("pcplot","Plot Principal Components"),
                                        textOutput("pcwarn"),
                                        textOutput("plot_status"),
                                        plotOutput("qcplot"),
                                        htmlOutput("remove"),
                                        
                                 ),
                                 # @roman_ramirez
                                 column(width = 1,
                                        div(style = "display:inline-block; float:right", 
                                            actionButton('to_potentialOutliers', label = 'Next', status = "success"))
                                 )
                             )
)

potentialOutliersTab <- tabItem(tabName = "potentialOutliers",
                                    fluidRow(
                                        column(1,
                                               div(style = "display:inline-block; float:left", 
                                                   actionButton('backTo_batchCorrection', label = 'Back', status = "success"))
                                        ),
                                        column(5,
                                               selectInput("outmethod","Outlier Detection Method",choices=c("KS","sum", "upperquartile")),
                                               actionButton("getout","Find Potential Outliers"),
                                               actionButton("update","Show Updated List of Samples")   
                                        ),
                                        column(5,
                                               p("Potential Outliers:"),
                                               uiOutput("potout"),
                                               plotOutput("outplot"),
                                               dataTableOutput("newexprs")
                                            
                                        ),
                                        # @roman_ramirez
                                        column(width = 1,
                                               div(style = "display:inline-block; float:right", 
                                                   actionButton('to_sampleGrouping', label = 'Next', status = "success"))
                                        )
                                    )
)
