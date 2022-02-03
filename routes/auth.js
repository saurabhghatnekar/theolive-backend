let supertokens = require("supertokens-node");
let Session = require("supertokens-node/recipe/session");
let {verifySession} = require("supertokens-node/recipe/session/framework/express");
let {middleware, errorHandler} = require("supertokens-node/framework/express");
let EmailPassword = require("supertokens-node/recipe/emailpassword");

supertokens.init({
    framework: "express",
    supertokens: {
        // TODO: This is a core hosted for demo purposes. You can use this, but make sure to change it to your core instance URI eventually.
        connectionURI: "http://localhost:3567",

    },
    appInfo: {
        appName: "TheOlive",
        apiDomain: "http://localhost:8000",
        websiteDomain: "http://localhost:3000",
        apiBasePath: "/api",
        websiteBasePath: "/"
    },
    recipeList: [EmailPassword.init(), Session.init(), ],
});

module.exports = {
    supertokens,
    EmailPassword,
    verifySession,
    middleware,
    errorHandler
};