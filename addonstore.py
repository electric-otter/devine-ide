import os

class Addon:
    def __init__(self, id, name, description, download_url):
        self.id = id
        self.name = name
        self.description = description
        self.download_url = download_url

addons = []

def display_addons():
    if not addons:
        print("No addons available.")
    else:
        print("Addon Store")
        for addon in addons:
            print(f"ID: {addon.id}, Name: {addon.name}, Description: {addon.description}, Download URL: {addon.download_url}")

def main():
    while True:
        print("\nMenu:")
        print("1. View Addons")
        print("2. Add Addon")
        print("3. Exit")
        choice = input("Enter your choice: ")

        if choice == "1":
            display_addons()
        elif choice == "2":
            install()
        elif choice == "3":
            print("Exiting...")
            break
        else:
            print("Invalid choice, please try again.")
          
def install():
  url = input("Please use this URL: ")
  print("Cloning:", url)
  # Get the absolute path of the script
  script_dir = os.path.dirname(os.path.abspath(__file__))

  # Change the current working directory to the script directory
  os.chdir(script_dir)
  
  os.system(f"git clone {url}")


if __name__ == "__main__":
    main()
