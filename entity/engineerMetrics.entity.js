class engineerMetrics {
    constructor (entity) {
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
        'Solution'];
        for(let key in entity){
            if(properties.includes(key)){
                this[key] = entity[key];
            }
        }
    }
}

module.exports = engineerMetrics;