const azure = require('azure-storage');
const properties = ['support_alias',
    'takeOwnerShip',
    'totalUT',
    'MPI',
    'IRT',
    'SDIRT',
    'reply',
    'replyRT',
    'answer',
    'helpfulAnswer',
    'helpfulRT',
    'replySuccessRT',
    'OffTopic',
    'Pending',
    'NewThread',
    'Answered',
    'Escalated',
    'Solution',
    'Deleted',
    'Waiting',
    'SelfAnswered',
    'ReOpen',
];
const tablePropertiesDefine = {
    Int32: [
        'takeOwnerShip',
        'totalUT',
        'MPI',
        'IRT',
        'SDIRT',
        'reply',
        'answer',
        'helpfulAnswer',
        'OffTopic',
        'Pending',
        'NewThread',
        'Answered',
        'Escalated',
        'Solution'
    ]
}
class engineerMetrics {
    constructor(entity) {
        this.baisc = {};
        for (let key in entity) {
            if (properties.includes(key)) {
                this.baisc[key] = entity[key];
            }
        }
    }

    generateTableEntity() {
        let entGen = azure.TableUtilities.entityGenerator;
        let p = properties.slice()
        let t = Object.assign({}, tablePropertiesDefine);
        this.tableEntity = {}
        for (let type of Object.keys(t)) {
            for (let property of t[type]) {
                this.tableEntity[property] = entGen[type](this.baisc[property]);
                p.splice(p.indexOf(property), 1);
            }
        }
        for (let property of p) {
            this.tableEntity[property] = entGen.String(this.baisc[property]);
        }
        return this;
    }

    AddTableEnt(key, value, type) {
        let entGen = azure.TableUtilities.entityGenerator;
        this.tableEntity[key] = type ? entGen[type](value) : {
            '_': value
        };
    }

    /**
     * @param array [entities]
     * @example entities = [{
     * key:key,
     * value:value,
     * type:type
     * }]
     */
    AddTableEnts(entities) {
        for (let entity of entities) {
            if (entity.key && entity.hasOwnProperty('value')) {
                this.AddTableEnt(entity.key, entity.value, entity.type)
            }
        }
    }

    azureTableEntity() {
        return this.tableEntity;
    }
}

module.exports = engineerMetrics;