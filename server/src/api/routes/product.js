const router = require('express').Router();

const { viewAllProduct, addProduct, updateProduct } = require('../controllers/productController');

router.get('/product/viewAll', viewAllProduct);
router.post('/product/:id/updateProduct', updateProduct);
router.post('/product/addProduct', addProduct);

module.exports = router;