const db = require('./db');


module.exports.createAccount = (req, res) => {

    if (!req.body.accountId || !req.body.user || !req.body.bankCode || !req.body.pinCode) {
        res.status(400).send("Please provide all the required fields");
        return;
    }
    db.account.create({
        data: {
            accountId: req.body.accountId,
            userId: req.body.userId,
            bankCode: req.body.bankCode,
            pinCode: req.body.pinCode,
            AccountType: req.body.AccountType,
            isVerified: false,
            AccountDirection: "",
            otherInfo: ""
        }
    }).then(account => {
        res.status(201).send(account);
    }).catch(err => {
        console.log(err)
        res.status(500).send(err);
    });

};
