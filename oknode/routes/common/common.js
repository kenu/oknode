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
	}
}

module.exports = common;