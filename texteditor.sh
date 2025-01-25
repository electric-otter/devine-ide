#!/bin/bash

# Function to display the current line number
display_line_number() {
  local line_num=$(wc -l < "$1")
  echo -n "${line_num} "
}

# Function to print the current line
print_line() {
  local line_num="$1"
  local line_content=$(sed -n "${line_num}p" "$file")
  echo -n "${line_num}: ${line_content}"
}

# Function to edit a line
edit_line() {
  local line_num="$1"
  local new_line
  read -p "Edit line ${line_num}: " new_line
  sed -i "${line_num}s/.*/${new_line}/" "$file"
}

# Get the file to edit
read -p "Enter file to edit: " file
if [ ! -f "$file" ]; then
  echo "File does not exist. Creating new file..."
  touch "$file"
fi

# Main loop
while true; do
  # Display the current line numbers and content
  clear
  local line_count=1
  while read -r line; do
    display_line_number "$file"
    print_line "$line_count"
    echo
    let line_count++
  done < "$file"
  
  # Get user input
  read -p "Action (n - next, p - previous, e - edit, q - quit): " action

  case "$action" in
    n)
      # Move to next line
      let current_line++
      ;;
    p)
      # Move to previous line
      let current_line--
      ;;
    e)
      # Edit the current line
      edit_line "$current_line"
      ;;
    q)
      break
      ;;
    *)
      echo "Invalid action."
      ;;
  esac
done

echo "Exiting editor."
