library(shiny)
library(ISLR)

training=Wage

modFit = lm(wage~age+jobclass+education, data=training)

calculatePrediction= function(age, education, jobclass) {
    experiment = data.frame(age=age, 
                            "education"=factor(education, 
                                               levels=c("1. < HS Grad",
                                                        "2. HS Grad",
                                                        "3. Some College", 
                                                        "4. College Grad",
                                                        "5. Advanced Degree")), 
                            "jobclass"=factor(jobclass, 
                                              levels=c("1. Industrial", 
                                                       "2. Information"))
                            )
    experimentWage = predict(modFit, newdata=experiment)
}


shinyServer(
    function(input, output) {
        output$age <- renderPrint({input$age})
        output$education = renderPrint({input$education})
        output$jobclass = renderPrint({input$jobclass})
        
        output$prediction = reactive({as.integer(calculatePrediction(input$age, input$education, input$jobclass))})
    }
)