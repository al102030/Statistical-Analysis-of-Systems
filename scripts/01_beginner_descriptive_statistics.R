required_packages <- c("dplyr", "ggplot2", "tidyr")

install_if_missing <- function(package_name) {
  if (!requireNamespace(package_name, quietly = TRUE)) {
    install.packages(package_name, repos = "https://cloud.r-project.org")
  }
  suppressPackageStartupMessages(
    library(package_name, character.only = TRUE)
  )
}

invisible(lapply(required_packages, install_if_missing))

set.seed(42)
n <- 120

system_data <- data.frame(
  system_id = seq_len(n),
  load = rnorm(n, mean = 70, sd = 12),
  temperature = rnorm(n, mean = 55, sd = 8),
  response_time = rnorm(n, mean = 240, sd = 30)
)

system_data <- system_data |>
  dplyr::mutate(
    load_level = dplyr::case_when(
      load < 60 ~ "Low",
      load < 80 ~ "Medium",
      TRUE ~ "High"
    )
  )

cat("=== Head of data ===\n")
print(head(system_data))

cat("\n=== Summary statistics ===\n")
print(summary(system_data[c("load", "temperature", "response_time")]))

cat("\n=== Grouped means (by load level) ===\n")
grouped_means <- system_data |>
  dplyr::group_by(load_level) |>
  dplyr::summarise(
    mean_load = mean(load),
    mean_temperature = mean(temperature),
    mean_response_time = mean(response_time),
    .groups = "drop"
  )
print(grouped_means)

cat("\n=== Correlation matrix ===\n")
print(cor(system_data[c("load", "temperature", "response_time")]))

plot <- ggplot2::ggplot(
  system_data,
  ggplot2::aes(x = load, y = response_time, color = load_level)
) +
  ggplot2::geom_point(alpha = 0.7) +
  ggplot2::geom_smooth(method = "lm", se = FALSE) +
  ggplot2::labs(
    title = "Beginner Analysis: Load vs Response Time",
    x = "System Load",
    y = "Response Time (ms)",
    color = "Load Level"
  ) +
  ggplot2::theme_minimal()

print(plot)
