# Working Days Calculator PowerShell Script

## Description
This PowerShell script calculates the number of working days between two given dates, excluding weekends and UK bank holidays. It is designed to help professionals estimate the number of actual working days for project planning, delivery timelines, or any scenario where understanding the number of business days is crucial. I primarily wrote this script to help me calculate working days for planning my annual leave.

## Requirements
- PowerShell 5.1 or higher.
- The script is intended for use on systems with the correct date format settings for the UK (DD/MM/YYYY). However, it explicitly parses dates in the UK format to ensure consistency.

## How to Use
1. **Prepare the Bank Holidays List:** Update the `$bankHolidays` array within the script to include all relevant UK bank holidays for your desired year.

2. **Run the Script:** You can execute the script from the PowerShell command line, passing the start and end dates as parameters in the UK date format (DD/MM/YYYY).

```powershell
# Example command to run the script
$startDate = '29/03/2024'
$endDate = '05/04/2024'
$workingDays = Get-WorkingDays -StartDate $startDate -EndDate $endDate
Write-Output "There are $workingDays working days between $startDate and $endDate."
```

## Example
This example calculates the working days between 29th March 2024 and 5th April 2024, taking into account predefined UK bank holidays within the script.

```powershell
$startDate = '29/03/2024'
$endDate = '05/04/2024'
$workingDays = Get-WorkingDays -StartDate $startDate -EndDate $endDate
Write-Output "There are $workingDays working days between $startDate and $endDate."
```

Output:
```
There are 4 working days between 29/03/2024 and 05/04/2024.
```

## Customization
- **Bank Holidays:** Ensure the list of bank holidays within the script is up-to-date and accurate for your specific needs.
