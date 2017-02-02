const azure = require('azure-storage');
const tableSvc = azure.createTableService(process.env.STORAGE_ACCOUNT,process.env.STORAGE_KEY);

class tableStorageHelper{
    constructor (tableSvc=tableSvc){
        this.tableSvc=tableSvc;
    }
}