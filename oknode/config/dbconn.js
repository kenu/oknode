const mysql = require('mysql');

/* grant all privileges on oknode.* to okuser@localhost identified by 'okpass'; */
const DB = {
    dbinfo: {
        host: 'localhost',
        user: 'okuser',
        password: 'okpass',
        database: 'oknode'
    },
    getConnection: () => {
        return mysql.createConnection(DB.dbinfo);
    }
}

module.exports = DB;

