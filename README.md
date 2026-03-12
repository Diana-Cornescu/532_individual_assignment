# 532_individual_assignment

Chartify Simplified is a data analytics dashboard that leverages Spotify's song features dataset to uncover patterns and characteristics of successful songs.Built for music producers and A&R professionals, it provides insights on streams and likes metrics on a per-artist as well as cross-platform popularity.

The main and stable deployment of this dashboard can be found here: LINK

## Quick-Start Setup Instructions
To install the required packages and run the app locally follow the instructions below:
```
# After opening a terminal:
git clone https://github.com/UBC-MDS/DSCI-532_2026_Group_31_Chartify.git
cd DSCI-532_2026_Group_31_Chartify/

# Optional (but suggested): make a fresh environment
conda env create -f environment.yml
# Activate environment
conda activate chartify

# Optional for Assistant Chat (LLM) tab:
# Copy `.env.example` and remove ".example" to be just `.env`.
# Add the  API key for one of the providers, save and continue the rest of the steps

# Run draft application locally  
shiny run --reload --launch-browser src/app.py # → http://127.0.0.1:8050

# Optional (but suggested): deactivate environment when done
conda deactivate
```
