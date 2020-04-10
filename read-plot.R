library(tidyverse)

df <- read_csv("2020-04-05_PL_Mobility_Report_en.csv")
    df %>%
      mutate(plot_name = ifelse(plot_name == "Workplace", "Workplaces", plot_name),
             region = str_replace(region, "  April 5, 2020| Voivodeship", ""),
             region = factor(region, c("Poland", "Greater Poland", "Kuyavian-Pomeranian", "Lesser Poland", "Lower Silesian",
                                   "Lublin", "Lubusz", "Masovian", "Opole", "Podkarpackie", "Podlaskie", "Pomeranian",
                                   "Silesian", "Swietokrzyskie", "Warmian-Masurian", "West Pomeranian", "Łódź"),
                             c("Poland", "Greater Poland", "Kuyavian-Pomeranian", "Lesser Poland", "Lower Silesian",
                                   "Lublin", "Lubusz", "Masovian", "Opole", "Podkarpackie", "Podlaskie", "Pomeranian",
                                   "Silesian", "Swietokrzyskie", "Warmian-Masurian", "West Pomeranian", "Łódź"))) -> df 
    
    ggplot(data = df, aes(x = date, y = value, color = factor(plot_name), group = factor(plot_name))) +
    geom_line() +
    facet_wrap(~ region) +
    scale_color_brewer(name = "Category", palette = "Paired") + 
    theme_bw() + 
    labs(x = "", y = "Mobility changes", 
          title = "COVID-19 Community Mobility Report", 
          subtitle = "Poland April 5, 2020", 
          caption = "Source: Maciej Beręsewicz based on codes from https://github.com/datasciencecampus/mobility-report-data-extractor.") +
    theme(legend.position = "bottom") -> p
