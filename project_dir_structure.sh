#!/bin/bash

# This script creates a React project structure for a react-d3-tree-app.
# Usage: ./create_project_structure.sh [main_project_directory]
# If no directory is provided, the script will default to the current working directory.

# Set default project directory as the current working directory (if not specified)
PROJECT_DIR=${1:-$(pwd)}

# Log file to store output of script operations
LOGFILE="${PROJECT_DIR}/project_creation.log"

# Function to log messages
log_message() {
    echo "$(date +"%Y-%m-%d %H:%M:%S") - $1" | tee -a "$LOGFILE"
}

# Function to create directory and check for errors
create_directory() {
    if [ ! -d "$1" ]; then
        mkdir -p "$1"
        if [ $? -eq 0 ]; then
            log_message "Directory created: $1"
        else
            log_message "Error: Failed to create directory: $1"
            exit 1
        fi
    else
        log_message "Directory already exists: $1"
    fi
}

# Function to create file and check for errors
create_file() {
    if [ ! -f "$1" ]; then
        touch "$1"
        if [ $? -eq 0 ]; then
            log_message "File created: $1"
        else
            log_message "Error: Failed to create file: $1"
            exit 1
        fi
    else
        log_message "File already exists: $1"
    fi
}

# Start logging
log_message "Starting project structure creation in directory: $PROJECT_DIR"

# Creating the directory structure
create_directory "${PROJECT_DIR}/src/components/Tree"
create_directory "${PROJECT_DIR}/src/components/Node"
create_directory "${PROJECT_DIR}/src/data"
create_directory "${PROJECT_DIR}/src/hooks"
create_directory "${PROJECT_DIR}/src/styles"
create_directory "${PROJECT_DIR}/src/utils"

# Creating the files
create_file "${PROJECT_DIR}/src/components/Tree/Tree.js"
create_file "${PROJECT_DIR}/src/components/Tree/Tree.css"
create_file "${PROJECT_DIR}/src/components/Node/Node.js"
create_file "${PROJECT_DIR}/src/components/Node/Node.css"
create_file "${PROJECT_DIR}/src/data/mockData.js"
create_file "${PROJECT_DIR}/src/hooks/useTreeData.js"
create_file "${PROJECT_DIR}/src/styles/globalStyles.js"
create_file "${PROJECT_DIR}/src/utils/dataTransform.js"
create_file "${PROJECT_DIR}/src/App.js"
create_file "${PROJECT_DIR}/src/index.js"

# End logging
log_message "Project structure creation completed successfully."

exit 0
