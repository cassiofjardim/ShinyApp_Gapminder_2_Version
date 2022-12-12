splits_years <- gapminder::gapminder$year %>% unique()

countries_africa_years <- countries_selected_africa %>% bind_rows() %>% group_split(year) %>% set_names(splits_years)
countries_americas_years <- countries_selected_americas %>% bind_rows() %>% group_split(year) %>% set_names(splits_years)
countries_asia_years <- countries_selected_asia %>% bind_rows() %>% group_split(year) %>% set_names(splits_years)
countries_europe_years <- countries_selected_europe %>% bind_rows() %>% group_split(year) %>% set_names(splits_years)
countries_oceania_years <- countries_selected_oceania %>% bind_rows() %>% group_split(year) %>% set_names(splits_years)

vars_vec <- c('pop','lifeExp','gdpPercap')
africa_list <- rep(list(list()), 3) %>% set_names(vars_vec)
americas_list <- rep(list(list()), 3) %>% set_names(vars_vec)
asia_list <- rep(list(list()), 3) %>% set_names(vars_vec)
europe_list <- rep(list(list()), 3) %>% set_names(vars_vec)
oceania_list <- rep(list(list()), 3) %>% set_names(vars_vec)




for (j in 1:3) {
  for (i in 1:12) {
    africa_list[[j]][[i]] <- countries_africa_years[[i]] %>%    general_overview_charts(var = vars_vec[j], year = splits_years[i])
    americas_list[[j]][[i]] <- countries_americas_years[[i]] %>%    general_overview_charts(var = vars_vec[j], year = splits_years[i])
    asia_list[[j]][[i]] <- countries_asia_years[[i]] %>%    general_overview_charts(var = vars_vec[j], year = splits_years[i])
    europe_list[[j]][[i]] <- countries_europe_years[[i]] %>%    general_overview_charts(var = vars_vec[j], year = splits_years[i])
    oceania_list[[j]][[i]] <- countries_oceania_years[[i]] %>%    general_overview_charts(var = vars_vec[j], year = splits_years[i])


  }
}


for (k in 1:3) {

  africa_list[[k]] <- africa_list[[k]] %>% set_names(splits_years)
  americas_list[[k]] <- americas_list[[k]] %>% set_names(splits_years)
  asia_list[[k]] <- asia_list[[k]] %>% set_names(splits_years)
  europe_list[[k]] <- europe_list[[k]] %>% set_names(splits_years)
  oceania_list[[k]] <- oceania_list[[k]] %>% set_names(splits_years)

  }


continents_charts_list <- vector(mode = 'list', length = 5)


continents_charts_list$Africa <- africa_list
continents_charts_list$Americas <- americas_list
continents_charts_list$Asia <- asia_list
continents_charts_list$Europe <- europe_list
continents_charts_list$Oceania <- oceania_list




