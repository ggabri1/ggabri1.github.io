library(shiny)
library(ggplot2)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    ## Simulating the results and saving them in a matrix.

    ## Rendering the output
    output$myplot <- renderPlot({

        data_sim_mean <- rowMeans(matrix(data = rexp(input$size*input$sim, input$lambda), nrow = input$sim))


        ##Theoretical Mean
        mean_theoretical <- 1/input$lambda
        mean_simulated <- mean(data_sim_mean)

        ##Theoretical Variance
        variance_theoretical <- (1/input$lambda)^2/input$size


        ## Distribution
        data_simulated <- data.frame(data_sim_mean)

        #Making a data frame for plotting
        title <- "Sample Mean Distribution Vs. Normal Distribution"
        ggplot(data_simulated, aes(x = data_sim_mean)) +
            geom_histogram(aes(y=..density..), color="#1F3552", fill = "cadetblue4", binwidth=0.1) +
            labs(y = "Frequency") +
            labs(x = "Sample Means") +
            ggtitle("Sample Mean Distribution Vs. Normal Distribution") +
            geom_density(alpha=.1, size =1, aes(color = "Simulated")) + # Overlay with transparent density plot
            stat_function(fun = dnorm, aes(color = "Theoretical"), size = 1, args = list(mean = mean_theoretical,
                                                                                         sd =sqrt(variance_theoretical))) +
            labs(colour = "Distributions")+
            geom_vline(aes(xintercept=mean_simulated), color="black", linetype="solid", size=1) +
            geom_vline(aes(xintercept=mean_theoretical), color="red", linetype="solid", size=1)
    })
})
