Date.prototype.yyyymmdd = function () {
    var mm = this.getMonth() + 1; // getMonth() is zero-based
    var dd = this.getDate();

    return [this.getFullYear(), (mm > 9 ? '' : '0') + mm, (dd > 9 ? '' : '0') + dd].join('-');
};
const common = {
    getDate: function (string) {
        var ptn = /([12]\d{3}-(0[1-9]|1[0-2])-(0[1-9]|[12]\d|3[01]))/;
        var date = string;
        if (!ptn.test(date)) {
            date = new Date().yyyymmdd();
        }
        return date;
    },
    formatDate: function (timestamp) {
		return new Date(timestamp).yyyymmdd();
	},
    getDatetime: (date) => {
        var d = (typeof date == 'string') ? new Date(date) : date;
        var h = d.getHours();
        var m = d.getMinutes();
        var s = d.getSeconds();
        return common.formatDate(d.getTime()) + ' '
            + [(h > 9 ? '' : '0') + h, (m > 9 ? '' : '0') + m, (s > 9 ? '' : '0') + s].join(':');
    }

}

module.exports = common;