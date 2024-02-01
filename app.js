document.getElementById('dateForm').addEventListener('submit', function(e) {
    e.preventDefault();

    const startDate = document.getElementById('startDate').value;
    const endDate = document.getElementById('endDate').value;

    const result = calculateWorkingDays(startDate, endDate);
    document.getElementById('result').innerText = `There are ${result} working days between ${startDate} and ${endDate}.`;
});

function parseDate(input) {
    const parts = input.match(/(\d+)/g);
    // new Date(year, month [, day [, hours[, minutes[, seconds[, ms]]]]])
    return new Date(parts[2], parts[1]-1, parts[0]); // months are 0-based
}

function calculateWorkingDays(startDate, endDate) {
    const start = parseDate(startDate);
    const end = parseDate(endDate);
    let days = 0;

    const bankHolidays = [
        '01/01/2024', '29/03/2024', '01/04/2024', '06/05/2024',
        '27/05/2024', '26/08/2024', '25/12/2024', '26/12/2024'
    ].map(date => parseDate(date).getTime());

    for (let day = new Date(start); day <= end; day.setDate(day.getDate() + 1)) {
        const dayOfWeek = day.getDay();
        const isWeekend = dayOfWeek === 6 || dayOfWeek === 0;
        const isBankHoliday = bankHolidays.includes(day.getTime());

        if (!isWeekend && !isBankHoliday) {
            days++;
        }
    }

    return days;
}
