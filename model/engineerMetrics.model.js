const SQL_TEMPLATE = ((strings, ...keys) => {
    return ((...values) => {
        let dict = values[values.length - 1] || {};
        let result = [strings[0]];
        keys.forEach((key, i) => {
            let value = Number.isInteger(key) ? values[key] : dict[key];
            result.push(value, strings[i + 1]);
        });
        return result.join('');
    });
})`EXEC	[dbo].[getEngineerMetrics]
		@alias = N\'${0}\',
		@start = N\'${1}\',
        @end = N\'${2}\'`;

class engineerMetricsModel {
    constructor(alias, start = new Date, end) {
        this.alias = alias;
        this.start = start;
        this.end = end || start;
    }

    getDailySQL(){
        return SQL_TEMPLATE(this.alias,this.start,this.start);
    }

    getRangeSQLArray(){
        let tmp = [];

    }

}

module.exports = engineerMetricsModel;