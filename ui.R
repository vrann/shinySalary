library(shiny)
shinyUI(
    pageWithSidebar(
        headerPanel("Wage prediction"),
        sidebarPanel(
            numericInput('age', 'Age', 16, min = 16, max = 80, step = 1),
            selectInput("education", label = h3("Education"), 
                        choices = list("1. < HS Grad" = "1. < HS Grad", 
                                       "2. HS Grad" = "2. HS Grad",
                                       "3. Some College" = "3. Some College", 
                                       "4. College Grad" = "4. College Grad", 
                                       "5. Advanced Degree"="5. Advanced Degree"), 
                        selected = "1. < HS Grad"),
            selectInput("jobclass", label = h3("Job Class"), 
                        choices = list("1. Industrial" = "1. Industrial", 
                                       "2. Information" = "2. Information"), 
                        selected = "1. Industrial"),
            submitButton('Submit')
        ),
        mainPanel(
            h3('Instructions'),
            p('This is an application which allows to predict a salary based on number of factors.
              Prediction is based on a model trained on a Wage data set form ISLR package.
              It uses age, class of job and level of education to predict the wage.'),
            p('To use application enter your age: it should be more than 16 (minimal working age) and less than 80.
              Then, enter your Eductaion level. Suported levels are "< HS Grad" which stands for "less than high school degree",
High School Degree, Some College, College Graduated, Advanced Degree. Next, enter your job class. Supported classes
are Industrial for workers in industry and Information for workers in IT
              '),
            p('Output of the program is a predicted wage, based on the prediction model. 
              Output is provided in thousands dollars per year'),
            h3('Results of prediction'),
            h5('You entered: Age'),
            verbatimTextOutput("age"),
            h5('You entered: Education'),
            verbatimTextOutput("education"),
            h5('You entered: Job Class'),
            verbatimTextOutput("jobclass"),
            h5('The expected salary is ($1000/year) '),
            verbatimTextOutput("prediction")
        )
    )
)