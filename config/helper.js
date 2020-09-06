const MySqli = require('mysqli');

let conn = new MySqli({
    host: 'localhost',
    post: 3306,
    user: 'atotaro',
    passwd: 'homero1998',
    db: 'viadulce'

});


let db = conn.emit( false, '');

module.exports = {
    database: db
};
