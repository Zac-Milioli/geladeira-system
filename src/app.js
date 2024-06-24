const express = require('express');
const cors = require('cors');
const productRoutes = require('./routes/productRoutes');
const fridgeRoutes = require('./routes/fridgeRoutes');
const freezerRoutes = require('./routes/freezerRoutes');

const app = express();
const PORT = 3000;

app.use(cors())
app.use(express.json());
app.use(express.static('views/index.html'));

app.use('/api', productRoutes);
app.use('/api/fridge', fridgeRoutes);
app.use('/api/freezer', freezerRoutes);

app.listen(PORT, () => {
    console.log(`Server running on http://localhost:${PORT}`);
});