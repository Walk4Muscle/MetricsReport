require('dotenv').config();
// var config = {
//     user: 'gary',
//     password: 'QWEasdzxc123',
//     server: 'garysql.database.windows.net',
//     database: 'garytestsql',
//     requestTimeout:300000,
//     options: {
//         encrypt: true
//     }
// };

var config = {
    server: '10.168.177.44',
    database: 'StackOverFlowDevDB',
    driver: 'msnodesqlv8',
    requestTimeout: 300000,
    options: {
        trustedConnection: true
    }
};

let connection = new sql.Connection(config);

connection.connect().then(() => {
    let sentence = fs.readFileSync('./sql/sql/getEngineerMetrics.sql');
    // console.log(sentence.toString());
    let request = new sql.Request(connection);

    //use stmt 
    request.query(sentence.toString()).then((data)=>{
        // console.dir((data[0]))
        // console.dir(Object.keys(data[0]))
        var EM = require('./entity/engineerMetrics.entity.js');
        let em = new EM(data[0]);
        console.log(JSON.stringify(em));
        connection.close();
    }).catch((err)=>{
        console.error(err);
    })

})

//Stored Procedure
// connection.connect().then(() => {
//     let request = new sql.Request(connection);

//     request.input('alias', sql.NVarChar, 'v-guiliu')
//         .input('start', sql.NVarChar, '2017-01-02')
//         .input('end', sql.NVarChar, '2017-01-02')
//         // .output('return_value', sql.Int)
//         .execute('getEngineerMetrics').then((data) => {
//             console.dir(data)
//             connection.close();
//         }).catch((err) => {
//             console.error(err);
//         })

// }).catch((err) => {
//     console.error(err);
// })

// var SqlUtility = require('./sql_models/SqlUtility.js');
// // console.log(SqlUtility)
// // console.log(SqlUtility.parseUTCtodatetime('Question.creation_date'));

// var sqlDriver = require('./sql_models/SqlDriver.js');
// var question = new sqlDriver('Question');
// console.log(question.table)
