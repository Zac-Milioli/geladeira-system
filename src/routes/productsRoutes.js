const express = require('express');
const router = express.Router();
const db = require('../models/db_conn');

router.put('/products/:id', async (req, res) => {
    try {
        const id = parseInt(req.params.id);
        const { name, description, validity } = req.body;
        await db.executeProcedure('UpdateProductById', { id, name, description, validity });
        res.status(200).send('Product updated successfully.');
    } catch (error) {
        res.status(500).send(error.message);
    }
});

router.delete('/products/:id', async (req, res) => {
    try {
        const id = parseInt(req.params.id);
        await db.executeProcedure('DeleteProductById', { id });
        res.status(200).send('Product deleted successfully.');
    } catch (error) {
        res.status(500).send(error.message);
    }
});

router.get('/products/:id', async (req, res) => {
    try {
        const id = parseInt(req.params.id);
        const result = await db.executeQuery(`SELECT * FROM products WHERE id = ${ id }`);
        res.status(200).json(result.recordset);
    } catch (error) {
        res.status(500).send(error.message);
    }
})

module.exports = router;