# Power-Data Webscraper
Web scraper for Power Data for ICT342 at UniSC

This repository contains a set of Python scripts designed to scrape and process sports data from Champion Data. The scripts extract match details, period statistics, and score flow data across multiple leagues and sports such as AFL, NRL, and Netball. The data is then saved in CSV format for further analysis.

## Table of Contents
- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
  - [Scraping Data](#scraping-data)
  - [Saving Unique Fields](#saving-unique-fields)
  - [Directory Structure](#directory-structure)
- [File Descriptions](#file-descriptions)
  - [full_scrape.py](#full_scrapepy)
  - [Match.py](#matchpy)
  - [Fixture.py](#fixturepy)
  - [csv_save.py](#csv_savepy)
  - [sport_category.py](#sport_categorypy)
  - [League_information.py](#league_informationpy)
  - [ScoreFlow.py](#scoreflowpy)
- [Contributing](#contributing)
- [License](#license)

## Features
- **Comprehensive Scraping:** Fetches match data, period stats, and score flow for various leagues.
- **Categorization:** Automatically determines the sport category based on league information and squad IDs.
- **Unique Field Extraction:** Identifies and saves unique fields for each sport to aid in data consistency and analysis.
- **CSV Management:** Organizes data into CSV files with unique directories for each league and sport.

## Installation

1. **Clone the repository:**
   ```bash
   git clone https://github.com/Harrison-Shepherd/Power-Data-Webscraper.git
   cd Power-Data-Webscraper


## Execution
- **full_scrape.py** Iterates through the entire database for all fixture data, match data, squad data, score flow, and period data.
- **main_script.py** Manually specify which League ID and Match ID you want to scrape. Retrieves match data, squad data, score flow and period data for that match or entire fixture.
