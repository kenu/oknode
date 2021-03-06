var db_conn = require('../../config/dbconn');

var dao = {
  query: function(sql, params) {
    var connection = db_conn.getConnection();
    return new Promise(function(resolve, reject) {
      connection.query(sql, params, function(err, rows) {
        if (err) {
          return reject(err);
        }
        resolve(rows);
        connection.end();
      });
    });
  }
};

module.exports = dao;
