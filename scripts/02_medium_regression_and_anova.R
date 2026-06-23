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

set.seed(123)
n <- 180

analysis_data <- data.frame(
  subsystem = sample(c("Network", "Storage", "Compute"), n, replace = TRUE),
  load = runif(n, min = 40, max = 95),
  uptime_days = runif(n, min = 20, max = 365)
)

analysis_data <- analysis_data |>
  dplyr::mutate(
    error_rate = 0.08 * load + 0.01 * uptime_days +
      dplyr::case_when(
        subsystem == "Network" ~ 2.0,
        subsystem == "Storage" ~ 1.2,
        TRUE ~ 0.6
      ) + rnorm(n, 0, 2.8),
    subsystem = factor(subsystem)
  )

cat("=== Head of data ===\n")
print(head(analysis_data))

cat("\n=== Linear regression model ===\n")
lm_model <- lm(error_rate ~ load + uptime_days + subsystem, data = analysis_data)
print(summary(lm_model))

cat("\n=== ANOVA for subsystem effect ===\n")
anova_model <- aov(error_rate ~ subsystem, data = analysis_data)
print(summary(anova_model))

cat("\n=== Tukey post-hoc comparison ===\n")
print(TukeyHSD(anova_model))

cat("\n=== Group summaries ===\n")
group_summary <- analysis_data |>
  dplyr::group_by(subsystem) |>
  dplyr::summarise(
    avg_error = mean(error_rate),
    sd_error = sd(error_rate),
    avg_load = mean(load),
    .groups = "drop"
  )
print(group_summary)

plot <- ggplot2::ggplot(
  analysis_data,
  ggplot2::aes(x = subsystem, y = error_rate, fill = subsystem)
) +
  ggplot2::geom_boxplot(alpha = 0.7) +
  ggplot2::labs(
    title = "Medium Analysis: Error Rate by Subsystem",
    x = "Subsystem",
    y = "Error Rate"
  ) +
  ggplot2::theme_minimal() +
  ggplot2::theme(legend.position = "none")

print(plot)
