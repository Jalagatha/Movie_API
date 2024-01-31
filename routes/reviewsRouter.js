const express=require('express');
const router=express.Router();
const getReviews=require('../controllers/reviewsController')

router.get('/', getReviews);

module.exports = router;