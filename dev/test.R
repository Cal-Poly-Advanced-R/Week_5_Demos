

iris %>%
  simple_addition("Sepal.Length", "Petal.Length")


iris %>%
  grouped_mean_tidy(Species, Petal.Length)

iris %>%
  group_by(Species) %>%
  summarize...


iris %>%
  mutate(
    new_col = Petal.Length + Sepal.Length
  )


iris %>%
  simple_addition_tidy(Sepal.Length, Petal.Length)
