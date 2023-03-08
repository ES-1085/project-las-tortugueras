#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
fluidPage(

    # Application title
    titlePanel("Sex Distribution by Species"),

    # Checkbox for sex 
    checkboxGroupInput("checkGroup", label = h3("Sex"), 
                       choices = list("Hembra" = 1, 
                                      "Macho" = 2, 
                                      "Indefinido" = 3),
                       selected = 1, 2, 3),

        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("distPlot")
        )
    )
)
