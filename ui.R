
library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
        titlePanel(h1("Exponential Distribution Vs. Central Limit Theorem")),
        h2("Description"),
        h4("The current project investigates the exponential distribution in R and compares it with
                the Central Limit Theorem. We can see that as we increase the sample size and the number
                of simulations the simulated variation becomes really close to the theoretical variation.
                We also allow to adjust the lambda value (rate parameter in exponential distribution) for extra fun.
                The starting values are set as sample size = 10, number of simulations 500, and lambda = 0.2."),
        numericInput(inputId = "sim",
                label = "The number of simulations", value = 500, min = 1, max = 10000000),

        numericInput(inputId = "size",
                label = "The sample size", value = 10, min = 1, max = 100),
        numericInput(inputId = "lambda",
                label = "The lambda value", value = 0.2, min = 0, max = 1),
        submitButton("Calculate"),
        plotOutput("myplot")
))
