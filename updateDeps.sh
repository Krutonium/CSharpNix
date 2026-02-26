#!/usr/bin/env nix-shell
#! nix-shell -i bash
#! nix-shell -p dotnet-sdk_10 nuget-to-json

set -euo pipefail

# Clean previous outputs
rm -rd packages deps.json

# Restore into local directory
dotnet restore --packages ./packages

# Generate Nix deps file
nuget-to-json ./packages > deps.json

rm -rd ./packages

echo "deps.json regenerated successfully."
