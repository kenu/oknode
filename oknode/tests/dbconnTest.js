const assert = require('assert');
const dbconn = require('../config/dbconn');

it('simple test', () => {
    assert.equal(1, 1);
});

it('get db info', () => {
    assert.equal(dbconn.dbinfo.host, 'localhost');
    assert.equal(dbconn.dbinfo.user, 'okuser');
    assert.equal(dbconn.dbinfo.database, 'oknode');
    assert.equal(typeof dbconn.getConnection, 'function');

    var connection = dbconn.getConnection();
    var result = connection.query('select 1 + 1 as result', (err, result) => {
        assert.equal(2, result[0].result);
        connection.close();
    });
});



