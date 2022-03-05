library(tidyverse)

install.packages("skimr")

install.packages("lubridate")
library(lubridate)

brewing_materials <- read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-03-31/brewing_materials.csv')
brewing_materials <- read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-03-31/brewing_materials.csv')
brewer_size <- read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-03-31/brewer_size.csv')
skim(brewing_materials)

#lubridate

brewing_materials <- brewing_materials %>%
    mutate(date = ymd(paste(year, month, 1)))%>%
    filter(year < 2016)

# Remove Total values
brewing_materials %>%
  filter(!str_detect(material_type, "Total")) %>%
  mutate(type = fct_reorder(type, month_current)) %>%
  ggplot(aes(type, month_current, fill = material_type)) +
  geom_col() +
  coord_flip() +
  scale_y_continuous(labels = scales::comma) +
  labs(x = "Ingredients", y = "Total Production", fill = "Material Type",
       title = "Bar Chart")
class(brewing_materials$type)

brewing_materials$type <- as_factor(brewing_materials$type)

brewer_size %>%
  count(brewer_size) %>%
  arrange(desc(n))

brewer_size %>%
  mutate(brewer_size = fct_lump(brewer_size, n=10)) %>%
  count(brewer_size)

