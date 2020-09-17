const express = require('express');
const router = express.Router();
const {database} = require('../config/helper');


/* GET TODOS LOS PEDIDOS*/
router.get('/', (req, res) => {
    database.table('pedido_detalle as d')
        .join([
            {
                table: 'pedidos as o',
                on: 'o.id = d.pedido_id'
            },
            {
                table: 'producto as p',
                on: 'p.id = d.producto_id'

            },
            {
                table: 'users as u',
                on: 'u.id = o.user_id'

            }

        ])
        .withFields(['o.id', 'p.nombre as nombre', "p.descripcion", 'p.precio', 'u.fullname'])
        .sort({id: 1}) /* id 1 muestra del primero al ultimo, id -1 muestra del ultimo al primero */
        .getAll()
        .then(pedidos => {
            if (pedidos.length > 0) {
                res.status(200).json(pedidos);
            } else {
                res.json({message: 'No se encontraron Pedidos'});
            }
        }).catch(err => console.log(err));

});


/*Get UN PEDIDO */

router.get('/:id', (req, res) => {
    const pedidoId = req.params.id;


    database.table('pedido_detalle as d')
        .join([
            {
                table: 'pedidos as o',
                on: 'o.id = d.pedido_id'
            },
            {
                table: 'producto as p',
                on: 'p.id = d.producto_id'

            },
            {
                table: 'users as u',
                on: 'u.id = o.user_id'

            }

        ])
        .withFields(['o.id', 'p.nombre as nombre', "p.descripcion", 'p.precio', 'u.fullname'])
        .filter({'o.id': pedidoId})
        .getAll()
        .then(pedidos => {
            if (pedidos.length > 0) {
                res.status(200).json(pedidos);
            } else {
                res.json({message: `No se encontro el pedido con el siguiente ID ${pedidoId}`});
            }
        }).catch(err => console.log(err));


});


router.post('/nueva', (res, req) => {

    let {usuarioId, productos} = req.body;

    if (usuarioId != null && usuarioId > 0 && !isNaN(usuarioId)) {

        database.table('pedidos')
            .insert({
                user_id: usuarioId
            }).then(newPedidoId => {

            if (newPedidoId > 0) {

                productos.forEach(async (p) => {

                    let data = await database.table('productos').filter({id: p.id}).withFields(['cantidad']).get();

                    let inCart = p.incart;

                    //Deduce el numero de ordenes para cada columna


                    if (data.cantidad > 0) {
                        data.cantidad = data.cantidad - inCart;

                        if (data.cantidad < 0) {
                            data.cantidad = 0;
                        }

                    } else {
                        data.cantidad = 0;
                        // return;
                    }


                    //Insertar Detalles del pedido
                    database.table('pedido_detalle')
                        .insert({
                            pedido_id: newPedidoId,
                            producto_id: p.id,
                            cantidad: inCart


                        }).then(newId => {

                        database.table('productos')
                            .filter({id: p.id})
                            .update({
                                cantidad: data.cantidad
                            }).then(siguienteNum => {
                        }).catch(err => console.log(err));

                    }).catch(err => console.log(err))


                });
            } else {
                res.json({message: 'Error creando una nueva Orden', success: false})
            }
            res.json({
                message: `Nueva orden creada con el numero Id ${newPedidoId}`,
                success: true,
                pedido_id: newPedidoId,
                productos: productos
            });

        }).catch(err => console.log(err));

    } else {
        res.json({message: 'Nuevo pedido fallo', success: false});
    }


});


/*Fake MetodoDePago  */

router.post('/pago', (req, res) => {
    setTimeout(() => {
        res.status(200).json({success: true});
    }, 3000);
});


module.exports = router;
