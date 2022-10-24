# lymphocytr

## About lymphocytr

lymphocytr is a package to create correlation plots and correlation matrices. The idea of creating lymphocytr begin when I was working with COVID-19 patients and with different research groups. The predominant read out with human patients that scientists want to evaluate is to correlate viral toters or metabolites with immune responses. Since, with human research, the data is vast and hard to organize due to many people involved. Therefore, I wanted to create a pipeline, which everyone can use easily and which also help them arrange the data in a meaningful way. 

## Styles

    output: 
      rmarkdown::html_vignette:
        css: mystyles.css

## Load package

```{r}
library(devtools)
library(lymphocytr)
```

## How to run your data

### Read data
Read_data function in the package reads your data and also makes the data "tidy". It is important that you arrange the data in the format where your cell types will be in one excel sheet and your variable (for example: viral titer, colony forming units, metabolites, age , BMI, etc) can be in the other sheet. This format helps you in arrange your data in a more organized way. 

```{r}
combined_data <- system.file("extdata", "correlation_data.xlsx", package = "lymphocytr", mustWork = FALSE)
combined_data <- read_data(combined_data)
head(combined_data)
```
