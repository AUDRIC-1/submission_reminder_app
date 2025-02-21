#!/bin/bash

# Ask the user for their name
read -p "Enter your name: " userName

# Define main directory
:mainDir="submission_reminder_${userName}"

# Create main directory
mkdir -p "$mainDir/scripts" "$mainDir/config" "$mainDir/data"

# Create required files
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

# Populate submissions.txt with sample data
cat <<EOL > "$mainDir/data/submissions.txt"
# Student Submission Records
Rubibi Julia, 2025-02-20
Ndahiro Honore, 2025-02-21
Ganza Reis, 2025-02-22
Mwiza Gadiela, 2025-02-23
Hirwa Darcy, 2025-02-24
Mugisha Yvan, 2025-02-25
Muhire Ken, 2025-02-26
Noah Mello, 2025-02-27
Olivia Rodrigo, 2025-02-28
EOL

# Implement startup.sh
cat <<EOL > "$mainDir/scripts/startup.sh"
#!/bin/bash
echo "Starting Submission Reminder App..."
bash "\$(dirname "\$0")/reminder.sh"
EOL
chmod +x "$mainDir/scripts/startup.sh"

echo "Environment setup complete!"

