// DB model import.
const Product = require('../models/t_product.model');

const validateProductDetails = require('../validations/validateProductDetails');

// Todo: Create list of product ==> completed and need to be reviewed
// Todo: Update list of product ==> completed and need to be reviewed
// Todo: Delete list of product ==> completed and need to be reviewed


// * Function to get list of all products from product table.
const getProductList = async () => {
    // * Search all products from product table and return in ascending order
    let listOfProducts = await Product.findAll({
        where: {
            isDeleted: false
        },
        order: [
            ["productName", "ASC"]
        ]
    });

    let productList = [];

    if (listOfProducts.length > 0) {
        productList = listOfProducts.map(product => product.dataValues);
        console.log("Date:", new Date() ,"List of all Products:", productList);
    }
    return productList;
}

// * Function to verify required details are provided to add product in the table.
const functionToVerifyProductDetails = (listOfProductDetails) => {
    let verifiedProductDetailsList = [];
    let unverifiedProductList = [];

    console.log("Date:", new Date(), 'list of product details:', listOfProductDetails);

    // * if list is empty or if empty object is provided return error message.
    if (listOfProductDetails.length == 0 || JSON.stringify(listOfProductDetails) === JSON.stringify({})) {
        return {
            success: false,
            message: 'No product details provided!'
        };
    }

    // * loop through list to verify required details of each object.
    for (index = 0; index < listOfProductDetails.length; index++) {
        
        // * Validation function to verify the essential details of products
        let verifyDetails = validateProductDetails(listOfProductDetails[index]);
        console.log("Date:", new Date(), 'Data returned from function validateProductDetails:', verifyDetails)

        if (JSON.stringify(verifyDetails.verifiedProductDetails) === JSON.stringify({})) {
            unverifiedProductList = [...unverifiedProductList, verifyDetails.unverifiedProductDetails];
        }
        else {
            verifiedProductDetailsList = [...verifiedProductDetailsList, verifyDetails.verifiedProductDetails];
        }
        
    }

    console.log("Date:", new Date(), 'verified product list:', verifiedProductDetailsList);
    console.log("Date:", new Date(), 'unverified product list:', unverifiedProductList);


    // * return verified and unverified list of products.
    return {
        success: true,
        message: 'Products details have been verified',
        data: {
            verifiedProductDetailsList,
            unverifiedProductList
        }
    }
}

// * Function to add in bulk list of products in db
const functionToAddProductInBulk = async (verifiedProductDetailsList) => {
    try {
        let createProductsList = await Product.bulkCreate(verifiedProductDetailsList);

        console.log(new Date(), "New products added response:", createProductsList);

        // * if no item was added return error message.
        if (createProductsList.length < 0) {
            return {
                success: false,
                message: 'Could not add any product!'
            }
        }

        let productList = createProductsList.map(product => product.dataValues);

        // * if products where added return productList.
        return {
            success: true,
            message: 'added products!',
            data: productList
        }
    }
    // * if error encountered while adding products throw error
    catch (error) {
        return {
            success: false,
            message: error
        }
    }
}

// * Function to verify if product exist in the table. 
const verifyIfProductExist = async (productID) => {
    try {
        // * search product in the table if exist or has not been deleted.
        let productExist = await Product.findOne({
            where: {
                id: productID,
                isDeleted: false
            }
        })

        console.log("Date:", new Date(), "Product details from DB:", productExist);

        // * i product does not exist return failure message.
        if (productExist == null) 
        return {
            success: false,
            message: 'Products does not exist!'
        }

        return {
            success: true,
            message: 'Product exist!'
        }
    }
    // * if error encountered throw error.
    catch (error) {
        return {
            success: false,
            message: error
        }
    }
}

// * Function to update existing product data in DB
const updateExistingProduct = async (updateData, productId) => {
    try {
        // * Update the product row in table using product ID
        let updateExistingProduct = await Product.update(updateData, {
            returning: true,
            where: { id: productId }
        });

        console.log("Date:", new Date(), "Updation result:", updateExistingProduct);

        // * Verify if product has been updated in the table.
        if (updateExistingProduct[1] > 0) {
            let productDetails = await Product.findByPk(productId);
            let updatedProductDetails = productDetails.dataValues;

            return {
                success: true,
                message: 'Product details have been updated!',
                data: updatedProductDetails
            };
        }
        // * if product not updated then return failure message.
        return {
            success: false,
            message: 'Sorry could not update product details!'
        }
    }
    // * if error encountered throw error.
    catch (error) {
        return {
            success: false,
            message: error
        }
    }
};

// ! Function to view all products present.
const viewAllProductService = async () => {
    try {
        // * function to fetch list of products present in db.
        let productList = await getProductList();

        console.log("Date:", new Date(), 'List of all products:', productList);

        // * if product list is empty return error message.
        if (productList.length == 0) {
            return {
                success: false,
                message: 'No product found!'
            };
        }

        // * if list has product return success message.
        return {
            success: true,
            message: 'List of all products found!',
            data: productList
        };
    }
    // * if error encountered throw error.
    catch (error) {
        return {
            success: false,
            message: error
        }
    }
};

// ! Function to add list of products
const addProductService = async (listOfProductDetails) => {
    
    // * Function to verify if all essential data has been provided before adding products.
    let verifiedData = functionToVerifyProductDetails(listOfProductDetails);

    console.log("Date:", new Date(), '----------------->verified data received in add product service<-----------------', verifiedData);

    if (!verifiedData.success) return verifiedData;

    let verifiedProductDetailsList = verifiedData.data.verifiedProductDetailsList;
    let unverifiedProductList = verifiedData.data.unverifiedProductList;
    
    try {

        // * Return error message if all products in list is missing essential details.
        if (verifiedProductDetailsList.length == 0) {
            return {
                success: false,
                message: 'Required data missing for the list of product details, Required data: productName, productCategory, price, description, batchNumber, skuID',
                data: unverifiedProductList
            };
        }

        // * Function to add list of product details in database.
        let createProductsList = await functionToAddProductInBulk(verifiedProductDetailsList);

        // * Return error if product list was not added in the db.
        if (!createProductsList.success) return createProductsList;

        // * Product list if it was successfully added in the db.
        let productList = createProductsList.data;

        // * If product list was partially added in db return added data and unverified data.
        if (productList.length != listOfProductDetails.length) {
            return {
                success: true,
                message: 'Added some of the products!',
                data: {
                    productsAdded: productList,
                    productsRejected: unverifiedProductList
                }
            };
        }

        // * if all products added to the db return success message.
        return {
            success: true,
            message: 'Added all items',
            data: productList
        };
    }
    // * if error encountered throw error
    catch (error) {
        return {
            success: false,
            message: error
        };
    }
};

// ! Function to update product details
const updateProductService = async (productDetailsObject, productId) => {
    try {

        // * Validate if product ID is provided
        if (!productId) return {
            success: false,
            message: 'Cannot without product ID!'
        }

        // * Validate product details provided using function validateProductDetails
        const verifyDetails = validateProductDetails(productDetailsObject);

        if (JSON.stringify(verifyDetails.verifiedProductDetails) === JSON.stringify({}))
            return {
                success: false,
                message: 'Required data missing from product details, Required data: productName, productCategory, price, description, batchNumber, skuID',
                data: {
                    verifiedData: verifyDetails.verifiedProductDetails,
                    missingData: verifyDetails.unverifiedProductDetails
                }
            }

        // * Validate if product exist in the table. 
        let ifProductExist = await verifyIfProductExist(productId);

        console.log("Date:", new Date, 'Data returned after verifying product exist:', ifProductExist);

        if (!ifProductExist.success) return ifProductExist;

        // * Data to be updated after validation
        let updateData = {
            ...productDetailsObject,
            ...verifyDetails.verifiedProductDetails
        }

        console.log("Date:", new Date(), "Data to be updated:", updateData);

        // * Function to update existing by passing product details object
        let updatedProduct = await updateExistingProduct(updateData, productId);

        console.log("Date:", new Date(), "Data returned after updation:", updatedProduct);

        return updatedProduct;
    }
    // * If error encountered throw error.
    catch (error) {
        return {
            success: false,
            message: error
        }
    }
}

module.exports = {
    viewAllProductService,
    addProductService,
    updateProductService
};