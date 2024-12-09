#!/bin/bash

# Loop through each directory
for dir in $(ls -d */); do
  # Enter the directory
  cd "$dir"
  
  # Extract the folder name without the trailing slash
  folder_name=$(basename "$dir")
  
  # Use sed to replace the image line in manifest.yaml
  sed -i "s|image: joindevops/$folder_name:1.0.0|image: srinualajangi/$folder_name:v1|g" manifest.yaml
  
  # Apply the manifest using kubectl
  kubectl apply -f manifest.yaml
  
  # Go back to the parent directory
  cd ..
done

