const assert = require('assert');
const userUtil = require('../../routes/common/userUtil');

it('Start Unit Test',() => {
    assert.equal(2, 1 + 1);
});

it('user auth', async () => {
    var id = 'kenu';
    var passwd = 'okpass!';
    let result = await userUtil.auth(id, passwd);
    assert.equal(200, result.status);
    let resultFail = await userUtil.auth('kenu', null);
    assert.equal(403, resultFail.status);
});
