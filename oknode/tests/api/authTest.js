const assert = require('assert');

it('Start Unit Test',() => {
    assert.equal(2, 1 + 1);
});

it('user auth', async () => {
    var id = 'kenu';
    var passwd = 'okpass!';
    let result = await auth(id, passwd);
    assert.equal(200, result.status);
});

function auth(id, passwd) {
    return new Promise((resolve) => resolve({status: 200}));
}