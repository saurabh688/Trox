const router = require('express').Router();

const { viewAllProduct, viewProductPagination, addProduct, updateProduct } = require('../controllers/productController');

router.get('/product/viewProduct', viewProductPagination);
router.get('/product/viewAll', viewAllProduct);
router.post('/product/:id/updateProduct', updateProduct);
router.post('/product/addProduct', addProduct);

module.exports = router;