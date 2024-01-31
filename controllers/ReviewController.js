import { PrismaClient } from '@prisma/client';


const prisma=new PrismaClient()

 async function getReviews(req,res){
  const reviews=await prisma.review.findMany()
  res.send(reviews)
}

 module.exports = getReviews;