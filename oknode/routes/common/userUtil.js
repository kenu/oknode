const userUtil = {
    auth: (id, passwd) => {
        return new Promise((resolve, reject) => {
            var status;
            if (id === 'kenu' && passwd === 'okpass!') {
                status = 200;
            } else {
                status = 403;
            }
            resolve({status: status});
        });
    }
}

module.exports = userUtil;