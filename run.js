var sql = require('mssql'),
    fs = require('fs')

var config = {
    user: 'gary',
    password: 'QWEasdzxc123',
    server: 'garysql.database.windows.net',
    database: 'garytestsql',
    requestTimeout:300000,
    options: {
        encrypt: true
    }
};

// let connection = new sql.Connection(config);

// connection.connect().then(() => {
//     let sentence = fs.readFileSync('user-tags-vol.sql');
//     // console.log(sentence.toString());
//     let request = new sql.Request(connection);

//     //use stmt 
//     request.query(sentence.toString()).then((data)=>{
//         console.dir(data)
//         Connection.close();
//     }).catch((err)=>{
//         console.error(err);
//     })

// })

var SqlUtility = require('./sql_models/SqlUtility.js');
// console.log(SqlUtility)
// console.log(SqlUtility.parseUTCtodatetime('Question.creation_date'));

var sqlDriver = require('./sql_models/SqlDriver.js');
var question = new sqlDriver('Question');
console.log(question.table)
