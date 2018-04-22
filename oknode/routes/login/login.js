const router = require('express').Router();

router.get('/auth', (req, res, next) => {
    res.sendFile(global.WEBROOT + '/public/login/auth.html');
})

module.exports = router;
