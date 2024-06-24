const express = require('express');
const router = express.Router();
const db = require('../models/db_conn');

router.get('/', async (req, res) => {
    try {
        const result = await db.executeQuery('SELECT * FROM ViewProductsInFridge');
        res.status(200).json(result.recordset);
    } catch (error) {
        res.status(500).send(error.message);
    }
});

router.post('/', async (req, res) => {
    try {
        const { name, description, validity } = req.body;
        await db.executeProcedure('AddProductToFridge', { name, description, validity });
        res.status(200).send('Product added to fridge successfully.');
    } catch (error) {
        res.status(500).send(error.message);
    }
});

module.exports = router;