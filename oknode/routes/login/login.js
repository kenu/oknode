const router = require('express').Router();
const userUtil = require('../common/userUtil');

router.get('/auth', (req, res, next) => {
    res.sendFile(global.WEBROOT + '/public/login/auth.html');
})
router.post('/auth', async (req, res, next) => {
    let id = req.body.id;
    let passwd = req.body.passwd;
    let result = await userUtil.auth(id, passwd);
    res.json(result);
})

module.exports = router;
