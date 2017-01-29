var SqlUtility = {
    parseUTCtodatetime: (column, datepart = 's') => {
        return `DATEADD(${datepart}, CONVERT(int, ${column}), '1/1/1970')`;
    }
}

var generateUTCDatetime = (date) => {
    return `CONVERT(datetime,'${date}')`;
}

module.exports = SqlUtility; 