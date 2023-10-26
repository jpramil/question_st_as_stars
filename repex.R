library(sf)
library(stars)
library(dplyr)

# Create example spatial data --------------------------------------------------

spatial_dim <- st_sf(
  ID = 1:3, 
  geometry = list(
    st_polygon(list(
      cbind(c(0, 1, 1, 0, 0), c(0, 0, 1, 1, 0))
    )),
    st_polygon(list(
      cbind(c(1, 2, 2, 1, 1), c(0, 0, 1, 1, 0))
    )),
    st_polygon(list(
      cbind(c(2, 3, 3, 2, 2), c(0, 0, 1, 1, 0))
    ))
  )
)

weekdays <- data.frame(weekdays = c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"))
hours_dim <- data.frame(hours = c("8am", "11am", "4pm", "11pm"))
sf_dta <- spatial_dim |> 
  cross_join(weekdays)|> 
  cross_join(hours_dim) |> 
  mutate(population = rnorm(n(), mean = 1000, sd = 200)) |> 
  select(everything(), geometry)


# Try to transform as a stars object with dimensions : geometry, weekdays, hours

st_as_stars(dta, name = attr(dta, "sf_column"), dims = c('jour','geometry'))




