let azure = require('azure-storage');
let TABLESRV = azure.createTableService(process.env.STORAGE_ACCOUNT,process.env.STORAGE_KEY);

class tableStorageHelper{
    /**
     * @config {object}
     *          [config.account]
     *          [config.key]
     *          [config.tablename]
     */
    constructor (config ={}, tableSvc){
        this.tableSvc=(()=>{
            if(config.account && config.key){
                return azure.createTableService(config.account,config.key)
            }
        })() || tableSvc || TABLESRV;
    }

    instance(){
        return this.tableSvc;
    }


}

module.exports=tableStorageHelper;