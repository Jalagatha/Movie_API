import { PrismaClient } from '@prisma/client';


const prisma=new PrismaClient()

 async function getPayments(req,res){
  const Payments=await prisma.Payments.findMany()
  res.send(Payments)
}

 module.exports = getPayments;