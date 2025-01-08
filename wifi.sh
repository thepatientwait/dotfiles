#!/usr/bin/env bash

# Command to generate the table (replace this with your actual command)
generate_table_command="nmcli -f SSID,BSSID dev wifi list | grep -vE 'SSID|--' | sed 's/ \+ /\t/g'"

# Run the command and store the output in a variable
table_output=$(eval "$generate_table_command")

# Extract the specified column from the table using awk
# SSID_list=$(nmcli -f SSID dev wifi list | grep -vE 'SSID|--')
SSID_list=$(printf "$table_output" | cut -f1)
BSSID_list=$(printf "$table_output" | cut -f2 | sed 's/ //g')

# Prompt the user to select an item from the column
echo "Please select an item from the column:"
echo "$SSID_list" | awk '{print NR, $0}'

# Read user input
read selected_row_number

# Validate user input
if ! [[ "$selected_row_number" =~ ^[0-9]+$ ]]; then
        echo "Invalid input. Please enter a number."
            exit 1
fi

# Check if the selected number is within the range of rows
num_rows=$(echo "$SSID_list" | wc -l)
if (( selected_row_number < 1 || selected_row_number > num_rows )); then
        echo "Invalid row number. Please enter a number between 1 and $num_rows."
            exit 1
fi

# Extract the selected row from the table
selected_item=$(echo "$BSSID_list" | awk -v row="$selected_row_number" 'NR==row')

# Assuming your table is space-separated and you want to select the second column
#column_number=2

# Extract the specified column from the selected row using awk
#selected_item=$(echo "$selected_row" | awk '{print $'$column_number'}')

# Now you have the selected item in the variable $selected_item
echo "Connecting to: $selected_item"

nmcli --ask dev wifi connect "$selected_item"

