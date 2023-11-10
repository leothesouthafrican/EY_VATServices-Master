#!/bin/bash

# env_setup.sh
# Script to set up Python virtual environments for each service submodule.

# Define the list of service directories
services=("services/PDF2Image-Service" "services/Image2Text-Service" "services/Text2Structure-Service" "services/VATInference-Service")

# Function to set up a Python virtual environment and install requirements
setup_service_env() {
  service_dir=$1

  # Navigate to the service directory
  cd $service_dir

  # Check if the requirements.txt file exists
  if [ ! -f "requirements.txt" ]; then
    echo "No requirements.txt found in $service_dir, skipping..."
  else
    # Create a virtual environment named 'env' if it doesn't exist
    if [ ! -d "env" ]; then
      python3 -m venv env
    fi

    # Activate the virtual environment
    source env/bin/activate

    # Install dependencies from requirements.txt
    pip install -r requirements.txt

    # Deactivate the virtual environment
    deactivate

    echo "Environment setup complete for $service_dir"
  fi

  # Navigate back to the root directory
  cd - > /dev/null
}

# Loop over each service directory and set up the environment
for service in "${services[@]}"; do
  setup_service_env $service
done

echo "All service environments have been set up."
