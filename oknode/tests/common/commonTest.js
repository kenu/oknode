const assert = require('assert');
const dao = require('../../routes/common/dao');
var common = require('../../routes/common/common');

it('async dao', async () => {
    var data = await dao.query('select 1 + 1 as result');
    assert.equal(2, data[0].result);
});

it('datetime', () => {
    var str = "2018-04-25 23:40:02";
    assert.equal(str, common.getDate(str));

    var date = new Date(str);

    assert.equal(common.getDatetime(date), str);
    assert.equal(common.getDatetime('2018-04-25 23:40:02'), str);
    assert.equal(common.getDatetime('2018-04-25T14:40:02Z'), '2018-04-25 23:40:02');    
});
