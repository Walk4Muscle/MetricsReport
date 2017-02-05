require('dotenv').config();
const fs = require('fs');
const MsSQL = require('./helper/mssql.helper.js');
const TableSrv = require('./helper/tableStorage.helper.js');

// let db_connection = new MsSQL();
// db_connection.connect().then(()=>{
//     let sentence = fs.readFileSync('./sql/sql/getEngineerMetrics.sql');
//     db_connection.request(sentence.toString()).then((data)=>{
//         console.log(data)
//         var EM = require('./entity/engineerMetrics.entity.js');
//         let em = new EM(data[0]);
//         em.generateTableEntity().AddTableEnts([{
//             key:'PartitionKey',
//             value:'123'
//         },{
//             key:'RowKey',
//             value:'1'
//         }]);
//         let task = em.azureTableEntity();
//         console.log(task)
//         let tableSrv = (new TableSrv()).instance();
//         tableSrv.insertOrReplaceEntity('EngineerMetricsDaily',task,(err,result)=>{
//             if(err){
//                 console.error(err)
//             }else{
//                 console.log(result)
//             }
//         })
//         db_connection.close();
//     }).catch((err)=>{
//         console.error(err)
//     })
// }).catch((err)=>{
//     console.error(err)
// })
        var EMM = require('./model/engineerMetrics.model.js');
        let emm = new EMM('v-guiliu','2016-01-01');
        console.log(emm.getDailySQL())