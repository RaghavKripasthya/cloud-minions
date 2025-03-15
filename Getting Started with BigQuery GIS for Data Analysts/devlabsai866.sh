#!/bin/bash

# Define color variables
BLACK_TEXT=$'\033[0;90m'
RED_TEXT=$'\033[0;91m'
GREEN_TEXT=$'\033[0;92m'
YELLOW_TEXT=$'\033[0;93m'
BLUE_TEXT=$'\033[0;94m'
MAGENTA_TEXT=$'\033[0;95m'
CYAN_TEXT=$'\033[0;96m'
WHITE_TEXT=$'\033[0;97m'

NO_COLOR=$'\033[0m'
RESET_FORMAT=$'\033[0m'
BOLD_TEXT=$'\033[1m'
UNDERLINE_TEXT=$'\033[4m'

echo
echo "${CYAN_TEXT}${BOLD_TEXT}╔════════════════════════════════════════════════════════╗${RESET_FORMAT}"
echo "${CYAN_TEXT}${BOLD_TEXT}                  Starting the process...                   ${RESET_FORMAT}"
echo "${CYAN_TEXT}${BOLD_TEXT}╚════════════════════════════════════════════════════════╝${RESET_FORMAT}"
echo

# Error handling function
handle_error() {
  echo "${RED_TEXT}${BOLD_TEXT}ERROR: $1${RESET_FORMAT}"
}

# Function to display section headers
display_header() {
  echo "${BLUE_TEXT}${BOLD_TEXT}===============================================${RESET_FORMAT}"
  echo "${YELLOW_TEXT}${BOLD_TEXT}$1${RESET_FORMAT}"
  echo "${BLUE_TEXT}${BOLD_TEXT}===============================================${RESET_FORMAT}"
}

# Function to display task completion messages
task_complete() {
  echo "${GREEN_TEXT}${BOLD_TEXT}✓ $1 COMPLETED SUCCESSFULLY${RESET_FORMAT}"
}

# Get current project ID
PROJECT_ID=$(gcloud config get-value project) || handle_error "Failed to get project ID"

# Main execution
display_header "GOOGLE CLOUD SKILLS BOOST LAB: NYC Citi Bike Trips Dataset"

# Task 1: Explore the NYC Citi Bike Trips dataset
display_header "TASK 1: Explore the NYC Citi Bike Trips dataset"

echo "${CYAN_TEXT}${BOLD_TEXT}Querying a few rows from the citibike_stations table...${RESET_FORMAT}"

# Execute the first query to sample data
QUERY1="SELECT * FROM \`bigquery-public-data.new_york_citibike.citibike_stations\` LIMIT 10"
echo "${MAGENTA_TEXT}Executing:${RESET_FORMAT} bq query --use_legacy_sql=false \"$QUERY1\""
bq query --use_legacy_sql=false "$QUERY1" || handle_error "Sample query failed"

echo "${GREEN_TEXT}${BOLD_TEXT}Successfully queried sample data from the citibike_stations table.${RESET_FORMAT}"
echo

echo "${CYAN_TEXT}${BOLD_TEXT}Finding stations with more than 30 bikes available...${RESET_FORMAT}"

# Execute the second query to find stations with > 30 bikes
QUERY2="SELECT ST_GeogPoint(longitude, latitude) AS WKT, num_bikes_available FROM \`bigquery-public-data.new_york.citibike_stations\` WHERE num_bikes_available > 30"
echo "${MAGENTA_TEXT}Executing:${RESET_FORMAT} bq query --use_legacy_sql=false \"$QUERY2\""
bq query --use_legacy_sql=false "$QUERY2" || handle_error "Query for stations with >30 bikes failed"

task_complete "TASK 1"

# Geo Viz visualization requires manual steps
display_header "VISUALIZING RESULTS IN GEO VIZ (MANUAL STEPS)"

echo "${YELLOW_TEXT}${BOLD_TEXT}Please follow these manual steps to visualize the query results in Geo Viz:${RESET_FORMAT}"
echo
echo "${CYAN_TEXT}${BOLD_TEXT}1. Open the Geo Viz web tool in a new tab: https://bigquerygeoviz.appspot.com/${RESET_FORMAT}"
echo "${CYAN_TEXT}${BOLD_TEXT}2. Click 'Authorize' under Query${RESET_FORMAT}"
echo "${CYAN_TEXT}${BOLD_TEXT}3. Authenticate with your QwikLabs username and allow necessary permissions${RESET_FORMAT}"
echo "${CYAN_TEXT}${BOLD_TEXT}4. Enter your Project ID: ${YELLOW_TEXT}$PROJECT_ID${RESET_FORMAT}"
echo "${CYAN_TEXT}${BOLD_TEXT}5. Enter the following query in the query window:${RESET_FORMAT}"
echo
echo "${MAGENTA_TEXT}-- Finds Citi Bike stations with > 30 bikes
SELECT
  ST_GeogPoint(longitude, latitude) AS WKT,
  num_bikes_available
FROM
  \`bigquery-public-data.new_york.citibike_stations\`
WHERE num_bikes_available > 30${RESET_FORMAT}"
echo
echo "${CYAN_TEXT}${BOLD_TEXT}6. Select 'United States (US)' as the Processing Location${RESET_FORMAT}"
echo "${CYAN_TEXT}${BOLD_TEXT}7. Click the 'Run' button${RESET_FORMAT}"
echo "${CYAN_TEXT}${BOLD_TEXT}8. Click 'Show results' to view the output${RESET_FORMAT}"
echo "${CYAN_TEXT}${BOLD_TEXT}9. For Geometry column, choose 'WKT'${RESET_FORMAT}"
echo
echo "${GREEN_TEXT}${BOLD_TEXT}The visualization should now display points on the map representing bike stations with more than 30 bikes available.${RESET_FORMAT}"

echo
echo "${GREEN_TEXT}${BOLD_TEXT}╔════════════════════════════════════════════════════════╗${RESET_FORMAT}"
echo "${GREEN_TEXT}${BOLD_TEXT}              Lab Completed Successfully!               ${RESET_FORMAT}"
echo "${GREEN_TEXT}${BOLD_TEXT}╚════════════════════════════════════════════════════════╝${RESET_FORMAT}"
echo
echo -e "${RED_TEXT}${BOLD_TEXT}Subscribe our Channel:${RESET_FORMAT} ${BLUE_TEXT}${BOLD_TEXT}https://www.youtube.com/@Arcade61432${RESET_FORMAT}"
echo
