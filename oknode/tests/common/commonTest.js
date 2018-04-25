const assert = require('assert');
const dao = require('../../routes/common/dao');
var common = require('../../routes/common/common');

it('async dao', async () => {
    var data = await dao.query('select 1 + 1 as result');
    assert.equal(2, data[0].result);
});

it('datetime', () => {
    console.log(common);
    var str = "2018-04-25 23:40:02";
    assert.equal(str.substr(0,10), common.getDate(str));
});