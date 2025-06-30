# 📊 CNN News Sentiment Analysis with R & GitHub Actions

This repository contains a GitHub Action workflow that automatically performs sentiment analysis on the [CNN World News RSS Feed](https://edition.cnn.com/world) using R. The analysis is scheduled to run weekly and generates insights based on the emotional tone of current news headlines.

## 🔁 Automation with GitHub Actions

The workflow is set up to:
- Trigger weekly or upon any commit to the repository.
- Pull the latest headlines from CNN's RSS feed via HTTP GET.
- Process and analyze the sentiment of headlines using R.
- Save the results to the repository with a timestamped filename (monthly).

The workflow uses:
- `r-lib/actions/setup-renv@v2` for managing and caching the R environment.
- `require_packages.R` to install only the necessary R packages if not already installed.
- `script.R` for data retrieval, sentiment scoring, and output generation.

## 📄 Report

A detailed report outlining:
- The sentiment analysis approach
- Libraries and techniques used
- Monthly trends in emotional tone
- Interpretation of results

...can be found in the [report](Sentiment%20Analysis/doc/Sentiment%20Analysis.docx).
## ⚙️ Setup Notes

If you want to test or run this locally, make sure to install required R dependencies, and for systems using Linux, run:

```bash
sudo apt-get install libcurl4-openssl-dev
