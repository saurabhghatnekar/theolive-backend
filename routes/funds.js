const db = require('./db');
const auth = require("./auth");


module.exports.deposit = async function (req, res) {
    const user = await db.user.findUnique({
        where: {
            primaryEmail: req.decodedToken.email
        }
    })
    if (!user) {
        res.status(404).send("User not found");
    }

    const fund = await db.deposit.create({
        data: {
            transactionId: req.body.transactionId,
            userId: user.id,
            sourceAccountId: req.body.sourceAccountId,
            transferAmount: req.body.transferAmount,
            transferDate: req.body.transferDate,
            transferDescription: req.body.transferDescription,
            isPending: true
        }
    })
};