var sql = require('mssql'),
    fs = require('fs');
require('msnodesqlv8');

let config = {
    server: process.env.DB_SERVER,
    database: process.env.DB_DATABASE,
    driver: 'msnodesqlv8',
    requestTimeout: 300000,
    options: {
        encrypt: true,
        trustedConnection: true
    }
};

class MsSQLHelper {
    constructor() {
        this.connection = new sql.Connection(config);
    }

    instance(){
        return this.connection;
    }

    connect() {
        return new Promise((resolve, reject) => {
            try {
                resolve(this.connection.connect());
            } catch (error) {
                reject(error)
            }
        })
    }

    request(stmt) {
        let request = new sql.Request(this.connection);
        return new Promise((resolve, reject) => {
            request.query(stmt).then((data)=>{
                resolve(data)
            }).catch((err)=>{
                reject(err)
            })
        })
    }

    close(){
        return new Promise((resolve,reject)=>{
            try {
                resolve(this.connection.close());
            } catch (error) {
                reject(error);
            }
        })
    }
}

module.exports = MsSQLHelper;