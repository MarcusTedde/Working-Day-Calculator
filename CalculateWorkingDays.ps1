function Get-WorkingDays {
    param (
        [Parameter(Mandatory = $true)]
        [string]$StartDate,

        [Parameter(Mandatory = $true)]
        [string]$EndDate
    )

    # Define UK Bank Holidays - Update this list as needed
    $bankHolidays = @(
        '01/01/2024', # New Year's Day
        '29/03/2024', # Good Friday
        '01/04/2024', # Easter Monday
        '06/05/2024', # Early May bank holiday
        '09/05/2024', # Liberation Day
        '27/05/2024', # Spring bank holiday
        '26/08/2024', # Summer bank holiday
        '25/12/2024', # Christmas Day
        '26/12/2024'  # Boxing Day
    ) | ForEach-Object { [datetime]::ParseExact($_, 'dd/MM/yyyy', $null) }

    # Parse StartDate and EndDate in UK format
    $startDateTime = [datetime]::ParseExact($StartDate, 'dd/MM/yyyy', $null)
    $endDateTime = [datetime]::ParseExact($EndDate, 'dd/MM/yyyy', $null)

    $workingDays = 0

    while ($startDateTime -le $endDateTime) {
        $dayOfWeek = $startDateTime.DayOfWeek

        # Check if the day is a weekday and not a bank holiday
        if ($dayOfWeek -ne 'Saturday' -and $dayOfWeek -ne 'Sunday' -and $startDateTime -notin $bankHolidays) {
            $workingDays++
        }

        $startDateTime = $startDateTime.AddDays(1)
    }

    return $workingDays
}

# Example usage with UK date format:
$startDate = '23/03/2024'
$endDate = '01/04/2024'
$workingDays = Get-WorkingDays -StartDate $startDate -EndDate $endDate
Write-Output "There are $workingDays working days between $startDate and $endDate."
