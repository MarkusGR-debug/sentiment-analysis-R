source("require_packages.R")
require_packages(c(
  "xml2",
  "httr",
  "dplyr",
  "sentimentr",
  "rvest"
)

# Function to extract titles and descriptions from RSS feed
extract_titles_descriptions <- function(url) {
  rss_feed <- GET(url)
  rss_content <- content(rss_feed, as = "parsed")
  titles <- xml_text(xml_find_all(rss_content, "//item/title"))
  descriptions <- xml_text(xml_find_all(rss_content, "//item/description"))
  data.frame(title = titles, description = descriptions, stringsAsFactors = FALSE)
}

# URL of the RSS feed
rss_url <- "http://rss.cnn.com/rss/cnn_latest.rss."

# Extract titles and descriptions
news_data <- extract_titles_descriptions(rss_url)

# Perform sentiment analysis on titles and descriptions
sentiment_scores_titles <- sentiment_by(news_data$title, by = "sentence")
sentiment_scores_descriptions <- sentiment_by(news_data$description, by = "sentence")

# Calculate summary statistics
summary_stats_titles <- summary(sentiment_scores_titles$ave_sentiment)
summary_stats_descriptions <- summary(sentiment_scores_descriptions$ave_sentiment)

# Print summary statistics
cat("Summary statistics for titles:\n")
print(summary_stats_titles)

cat("\nSummary statistics for descriptions:\n")
print(summary_stats_descriptions)

# Save summary statistics to a text file
date <- format(Sys.Date(), "%Y-%m-%d")
writeLines(paste("Summary statistics for titles (", date, "):\n", capture.output(summary_stats_titles), collapse = "\n"), paste("summary_titles_", date, ".txt", sep = ""))
writeLines(paste("\nSummary statistics for descriptions (", date, "):\n", capture.output(summary_stats_descriptions), collapse = "\n"), paste("summary_descriptions_", date, ".txt", sep = ""))
