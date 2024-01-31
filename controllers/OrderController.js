import { PrismaClient } from '@prisma/client';


const prisma=new PrismaClient()

 async function getOrders(req,res){
  const orders=await prisma.order.findMany()
  res.send(orders)
}

 module.exports = getOrders;