#!/bin/bash

# Prompt the user for their name
read -p "Enter your name: " userName

# Define the main directory name using the user's input
mainDir="submission_reminder_${userName}"

# Create the required directories
mkdir -p "$mainDir/scripts" "$mainDir/config" "$mainDir/data"

# Create the required files
touch "$mainDir/scripts/reminder.sh"
touch "$mainDir/scripts/functions.sh"
touch "$mainDir/scripts/startup.sh"
touch "$mainDir/config/config.env"
touch "$mainDir/data/submissions.txt"

# Populate config.env
cat <<EOL > "$mainDir/config/config.env"
# Configuration file for Submission Reminder App
APP_NAME="Submission Reminder App"
NOTIFICATION_INTERVAL="10m"
EOL

# Populate reminder.sh
cat <<EOL > "$mainDir/scripts/reminder.sh"
#!/bin/bash
source "\$(dirname "\$0")/functions.sh"
echo "Running reminder script..."
notify_users
EOL
chmod +x "$mainDir/scripts/reminder.sh"

# Populate functions.sh
cat <<EOL > "$mainDir/scripts/functions.sh"
#!/bin/bash
function notify_users() {
  echo "Sending reminder notifications..."
}
EOL
chmod +x "$mainDir/scripts/functions.sh"

# Populate submissions.txt with sample records (using "Submitted" or "Not Submitted")
cat <<EOL > "$mainDir/data/submissions.txt"
# Student Submission Records
John Legend, Submitted
Will Smith, Not Submitted
Dwayne Johnson, Submitted
Chris Brown, Not Submitted
Charlie Puth, Submitted
EOL

# Populate startup.sh
cat <<EOL > "$mainDir/scripts/startup.sh"
#!/bin/bash
echo "Starting Submission Reminder App..."
bash "\$(dirname "\$0")/reminder.sh"
EOL
chmod +x "$mainDir/scripts/startup.sh"

# Display a success message
echo "Environment setup complete! Your application is ready in: $mainDir"

