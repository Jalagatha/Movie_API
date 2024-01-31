
 import { PrismaClient } from '@prisma/client';


const prisma=new PrismaClient()

 async function getMovie(req,res){
  const Movies=await prisma.movie.findMany()
  res.send(Movies)
}

 module.exports = getMovie;


