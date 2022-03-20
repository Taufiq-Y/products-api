import express from 'express';
import { getAllProducts, getProduct,addCompleteProduct,addProduct, updateProduct, addImages,addVariants,addOptions, addPresentmentPrices, updateVariant, updateOption,updateImage, updatePresentmentPrice, deleteVariant, deletePresentmentPrice, deleteImage, deleteOption, deleteProduct} from "../services/product.service";


const router = express.Router();


router.post("/add/completeproduct",addCompleteProduct);
router.post("/add/product",addProduct);
router.post("/add/images",addImages);
router.post("/add/variants",addVariants);
router.post("/add/options",addOptions);
router.post("/add/presentmentprices",addPresentmentPrices);

router.get("/all",getAllProducts);
router.get("/product/:id",getProduct);

router.put("/updateproduct/:id",updateProduct);
router.put("/updatevariant/:id",updateVariant);
router.put("/updateoption/:id",updateOption);
router.put("/updateimage/:id",updateImage);
router.put("/updatepresentmentprice/:id",updatePresentmentPrice);

router.delete("/deleteproduct/:id",deleteProduct);
router.delete("/deletevariant/:id",deleteVariant);
router.delete("/deletepresentmentprice/:id",deletePresentmentPrice);
router.delete("/deleteimage/:id",deleteImage);
router.delete("/deleteoption/:id",deleteOption);

// module.exports = router;

export default router;
