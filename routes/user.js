const db = require('./db');
const {supertokens, EmailPassword} = require("./auth");

//get all users
module.exports.getUsers = async function (req, res) {
    res.send(await db.user.findMany());
};


//create user
module.exports.createUser = async function (req, res) {
    console.log(req.body);
    let response = await EmailPassword.signUp(req.body.email, req.body.password)
    if (response.status === "OK") {
        let user = await db.user.create({
            data: {
                name: req.body.name || "",
                primaryEmail: req.body.email,
            },
        })
        if(user){
            res.status(200).send(user);
        }
    }
    res.status(500).send("Email already exists");
}


//login user
module.exports.loginUser = async function (req, res) {
    let response = await EmailPassword.signIn(req.body.email, req.body.password)
    if (response.status === "OK") {
        console.log("res",response);
        console.log(db.user)
        let user = await db.user.find({
            where: {
                primaryEmail: req.body.email
            }
        })
        if(user){
            res.status(200).send(user);
        }
    }
    res.status(500).send("Email or password is incorrect");
}

//