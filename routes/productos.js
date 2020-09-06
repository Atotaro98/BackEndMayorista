const express = require('express');
const router = express.Router();
const {database} = require ('../config/helper');

/* GET home page. */






/* GET TODOS LOS PRODUCTOS */
router.get('/', function (req, res, next) {

    let page = (req.query.page != undefined && req.query.page != 0 ) ? req.query.page : 1; //Seteo el numero de pagina
    const limit = (req.query.limit != undefined && req.query.limit != 0 ) ? req.query.limit : 20; //Seteo el limite de productos por pagina

let startValue;
let endValue;


if (page > 0){
    startValue = (page * limit) - limit; //0,10,20,30
    endValue = page * limit;
} else {
    startValue = 0;
    endValue = 20;
}

database.table('producto as p')

    .join([{
        table: 'categoria as c',
        on: 'c.idcat = p.cat_id'

    }])
    .withFields(['c.nombre as categoria',
        'p.nombre as nombre',
        'p.precio',
        'p.descripcion',
        'p.imagen',
        'p.cantidad',
        'p.id'
    ])

    .slice(startValue, endValue)
    .sort( {id: .1})
    .getAll()
    .then(prods => {
        if (prods.length > 0){
            res.status(200).json({
                count: prods.length,
                producto: prods
            });
        } else{
            res.json({message :'No se encontraron productos'})
        }
    }). catch(err => console.log(err));

});











/* GET UN PRODUCTO */

router.get('/:prodId', (req  ,res)=>{
    let productoId = req.params.prodId;
    console.log(productoId);



    database.table('producto as p')

        .join([{
            table: 'categoria as c',
            on: 'c.idcat = p.cat_id'

        }])
        .withFields(['c.nombre as categoria',
            'p.nombre as nombre',
            'p.precio',
            'p.descripcion',
            'p.imagen',
            'p.imagenes',
            'p.cantidad',
            'p.id'
        ])
        .filter({'p.id' : productoId})
        .get()
        .then(prod => {
            if (prod){
                res.status(200).json(prod);
            } else{
                res.json({message :`No se encontro el producto con este id  ${productoID} ` });
            }
        }). catch(err => console.log(err));
});












/*GET TODOS LOS PRODUCTOS DE UNA CATEGORIA */

router.get('/categoria/:catnombre', ( req,res,) =>{


    let page = (req.query.page != undefined && req.query.page != 0 ) ? req.query.page : 1; //Seteo el numero de pagina
    const limit = (req.query.limit != undefined && req.query.limit != 0 ) ? req.query.limit : 10; //Seteo el limite de productos por pagina

    let startValue;
    let endValue;


    if (page > 0){
        startValue = (page * limit) - limit; //0,10,20,30
        endValue = page * limit;
    } else {
        startValue = 0;
        endValue = 10;
    }

 //BUSCAR EL NOMBRE DE LA CATEGORIA
    const cat_nombre = req.params.catnombre;

    database.table('producto as p')

        .join([{
            table: 'categoria as c',
            on: `c.idcat = p.cat_id WHERE c.nombre LIKE '%${cat_nombre}%'`

        }])
        .withFields(['c.nombre as categoria',
            'p.nombre as nombre',
            'p.precio',
            'p.descripcion',
            'p.imagen',
            'p.cantidad',
            'p.id'
        ])

        .slice(startValue, endValue)
        .sort( {id: .1})
        .getAll()
        .then(prods => {
            if (prods.length > 0){
                res.status(200).json({
                    count: prods.length,
                    producto: prods
                });
            } else{
                res.json({message :`No se encontraron productos de ${cat_nombre}`})
            }
        }). catch(err => console.log(err));

});






module.exports = router;
