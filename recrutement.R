library(readxl)
library(tidyverse)
liste_centres <- read_xlsx("./liste_centres.xlsx")

recrutement_plot <- liste_centres |>
    group_by(Catégorie) |>
    summarise(total = n()) |>
    mutate(Catégorie = fct_reorder(Catégorie, desc(total))) |>
    ggplot(
        aes(
            x = Catégorie,
            y = total,
            fill = Catégorie,
            label = total
            )
        ) +
    geom_bar(        
        stat = "identity", 
        alpha = .6, 
        width = .4
        ) +
    labs(
        x = "Types de lieux",
        y = "Nombre de lieux identifiés"
    ) +
    geom_label() +
    theme_minimal() +
    theme(
        legend.position = "none",
        axis.title.x = element_blank()) +
    scale_fill_brewer(
        type = "qual",
        palette = 2
        )
