library(tidyverse)

dash_df <- gapminder::gapminder %>% group_split(continent) %>%
  map(~ .x %>% filter(year == last(year)) %>%
        arrange(-gdpPercap) %>% head(10)) %>%
  set_names(sort(unique(factor(gapminder::gapminder$continent))))


# United States
us_df <- gapminder::gapminder %>% filter(country == 'United States') %>%
  rename(lifeExp_us = lifeExp,pop_us = pop,gdp_us = gdpPercap)

#*******************************************************************************
#*************************** CONTINENTS ****************************************
#*#*****************************************************************************

#********************
#******** AFRICA ****
#********************

names_africa <- str_replace(dash_df$Africa$country," ","-")

richest_africa <- gapminder::gapminder %>%
  filter(country == 'Egypt') %>%
  rename(richest_country = country,
         richest_LifeExp = lifeExp,
         richest_pop = pop,richest_gdp = gdpPercap)%>%
  select(year, richest_country,richest_LifeExp:last_col())

countries_selected_africa <- gapminder::gapminder %>%

  filter(country %in% dash_df$Africa$country)%>%
  group_split(country) %>%
  map(~ .x %>% left_join(richest_africa,by = 'year') %>%
        mutate(diff_lifeExp = round(lifeExp-richest_LifeExp,0),
               diff_pop = round(pop-richest_pop,0),
               diff_gdp = round(gdpPercap-richest_gdp,0)
        )) %>% set_names(sort(names_africa))


statistics_africa <- countries_selected_africa %>%
  map(~ .x  %>% summarise(
    diff_percent_life = round(((last(lifeExp)/first(lifeExp))-1)*100,2),
    diff_percent_pop = round(((last(pop)/first(pop))-1)*100,2),
    diff_percent_gdp = round(((last(gdpPercap)/first(gdpPercap))-1)*100)
  ))


#********************
#******** AMERICAS ****
#********************
names_americas <- str_replace_all(dash_df$Americas$country," ","-")

richest_americas <- gapminder::gapminder %>%
  filter(country == 'United States') %>%
  rename(richest_country = country,
         richest_LifeExp = lifeExp,
         richest_pop = pop,richest_gdp = gdpPercap)%>%
  select(year, richest_country,richest_LifeExp:last_col())

countries_selected_americas <- gapminder::gapminder %>%

  filter(country %in% dash_df$Americas$country)%>%
  group_split(country) %>%
  map(~ .x %>% left_join(richest_americas,by = 'year') %>%
        mutate(diff_lifeExp = round(lifeExp-richest_LifeExp,0),
               diff_pop = round(pop-richest_pop,0),
               diff_gdp = round(gdpPercap-richest_gdp,0)
        ))

statistics_americas <- countries_selected_americas %>%
  map(~ .x  %>% summarise(
    diff_percent_life = round(((last(lifeExp)/first(lifeExp))-1)*100,2),
    diff_percent_pop = round(((last(pop)/first(pop))-1)*100,2),
    diff_percent_gdp = round(((last(gdpPercap)/first(gdpPercap))-1)*100)
  ))

#********************
#******** ASIA ****
#********************
names_asia <- str_replace(dash_df$Asia$country," ","-")

richest_asia <- gapminder::gapminder %>%
  filter(country == 'Japan') %>%
  rename(richest_country = country,
         richest_LifeExp = lifeExp,
         richest_pop = pop,richest_gdp = gdpPercap)%>%
  select(year, richest_country,richest_LifeExp:last_col())

countries_selected_asia <- gapminder::gapminder %>%

  filter(country %in% dash_df$Asia$country)%>%
  group_split(country) %>%
  map(~ .x %>% left_join(richest_asia,by = 'year') %>%
        mutate(diff_lifeExp = round(lifeExp-richest_LifeExp,0),
               diff_pop = round(pop-richest_pop,0),
               diff_gdp = round(gdpPercap-richest_gdp,0)
        ))

statistics_asia <- countries_selected_asia %>%
  map(~ .x  %>% summarise(
    diff_percent_life = round(((last(lifeExp)/first(lifeExp))-1)*100,2),
    diff_percent_pop = round(((last(pop)/first(pop))-1)*100,2),
    diff_percent_gdp = round(((last(gdpPercap)/first(gdpPercap))-1)*100)
  ))

#********************
#******** EUROPE ****
#********************
names_europe <- str_replace(dash_df$Europe$country," ","-")

richest_europe <- gapminder::gapminder %>%
  filter(country == 'United Kingdom') %>%
  rename(richest_country = country,
         richest_LifeExp = lifeExp,
         richest_pop = pop,richest_gdp = gdpPercap)%>%
  select(year, richest_country,richest_LifeExp:last_col())

countries_selected_europe <- gapminder::gapminder %>%

  filter(country %in% dash_df$Europe$country)%>%
  group_split(country) %>%
  map(~ .x %>% left_join(richest_europe,by = 'year') %>%
        mutate(diff_lifeExp = round(lifeExp-richest_LifeExp,0),
               diff_pop = round(pop-richest_pop,0),
               diff_gdp = round(gdpPercap-richest_gdp,0)
        ))

statistics_europe <- countries_selected_europe %>%
  map(~ .x  %>% summarise(
    diff_percent_life = round(((last(lifeExp)/first(lifeExp))-1)*100,2),
    diff_percent_pop = round(((last(pop)/first(pop))-1)*100,2),
    diff_percent_gdp = round(((last(gdpPercap)/first(gdpPercap))-1)*100)
  ))


#********************
#******** OCEANIA ****
#********************
names_oceania <- str_replace(dash_df$Oceania$country," ","-")

richest_oceania <- gapminder::gapminder %>%
  filter(country == 'Australia') %>%
  rename(richest_country = country,
         richest_LifeExp = lifeExp,
         richest_pop = pop,richest_gdp = gdpPercap)%>%
  select(year, richest_country,richest_LifeExp:last_col())

countries_selected_oceania <- gapminder::gapminder %>%

  filter(country %in% dash_df$Oceania$country)%>%
  group_split(country) %>%
  map(~ .x %>% left_join(richest_oceania,by = 'year') %>%
        mutate(diff_lifeExp = round(lifeExp-richest_LifeExp,0),
               diff_pop = round(pop-richest_pop,0),
               diff_gdp = round(gdpPercap-richest_gdp,0)
        ))

statistics_oceania <- countries_selected_oceania %>%
  map(~ .x  %>% summarise(
    diff_percent_life = round(((last(lifeExp)/first(lifeExp))-1)*100,2),
    diff_percent_pop = round(((last(pop)/first(pop))-1)*100,2),
    diff_percent_gdp = round(((last(gdpPercap)/first(gdpPercap))-1)*100)
  ))
