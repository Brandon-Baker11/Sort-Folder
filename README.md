# Sort-Folder
This tool is intended to keep your downloads folder from getting cluttered with random files over time. As a helpdesk technician, I download many files that are included in incidents that I help my customers with on a daily basis.

## Technologies Used
- PowerShell


## Operating Systems Used
- Windows 11 Enterprise (23H2)

## How it works
The script first defines and assigns folder paths to variables **$downloadfolder, $emlfolder, $picfolder, certfiles**, and **$docfiles**, grouping destination folders into an array for later use. It checks whether each destination folder exists and creates any missing ones. A switch statement then processes files in the **Downloads** folder, moving them to the appropriate destination based on their file extension. Finally, the script checks the last access time of files in each destination folder and deletes any that have not been accessed in over a week.
