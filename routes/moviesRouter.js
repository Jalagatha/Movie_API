const express=require('express');
const router=express.Router();
const getMovie=require('../controllers/moviesController')

router.get('/', getMovies);

module.exports = router;