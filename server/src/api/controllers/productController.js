const { viewAllProductService, addProductService, updateProductService } = require('../services/productService');

const viewAllProduct = async (req, res) => {
    const productsList = await viewAllProductService();
    console.log("Date:", new Date(), 'Data returned to view list of product:', productsList)

    if (productsList.success) {
        res
        .status(200)
        .json(productsList);
    }
    else if (!productsList.success && productsList.message == 'No product found!') {
        res
        .status(404)
        .json(productsList);
    }
    else if (!productsList.success) {
        res
        .status(400)
        .json(productsList);
    }
};

const addProduct = async (req, res) => {
    console.log("Date:", new Date(),"Product details from controller:", req.body)
    const productsList = await addProductService(req.body);
    console.log("Date:", new Date(), 'Data returned after adding products:', productsList);

    if (productsList.success) {
        res
        .status(201)
        .json(productsList);
    }
    else if (productsList.success && productsList.message == 'Added some of the products!') {
        res
        .status(206)
        .json(productsList);
    }
    else if (!productsList.success && productsList.message == 'No product details provided!' || productsList.message == 'Required data missing for the list of product details, Required data: productName, productCategory, price, description, batchNumber, skuID' || productsList.message == 'Could not add any product!') {
        res
        .status(404)
        .json(productsList);
    }
    else if (!productsList.success){
        res
        .status(400)
        .json(productsList);
    }
}

const updateProduct = async (req, res) => {
    console.log("Date:", new Date(), "Product ID from controller:", req.params.id)
    console.log("Date:", new Date(), "Product details from controller:", req.body);
    const productsList = await updateProductService(req.body, req.params.id);
    console.log("Date:", new Date(), "Data returned after updating product details:", productsList);

    if (productsList.success) {
        res
        .status(200)
        .json(productsList);
    }
    else if (!productsList.success && productsList.message == 'Cannot without product ID!' || productsList.message == 'Required data missing from product details, Required data: productName, productCategory, price, description, batchNumber, skuID' || productsList.message == 'Products does not exist!' || productsList.message == 'Sorry could not update product details!') {
        res
        .status(404)
        .json(productsList);
    }
    else if (!productsList.success) {
        res
        .status(400)
        .json(productsList);
    }
}

module.exports = {
    viewAllProduct,
    addProduct,
    updateProduct
};