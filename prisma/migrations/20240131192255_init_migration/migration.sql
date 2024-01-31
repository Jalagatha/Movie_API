-- CreateEnum
CREATE TYPE "Genre" AS ENUM ('Actions', 'Adventures', 'Animations', 'Comedy', 'Crimes', 'Documentary', 'Drama', 'Family', 'Fantasy', 'History', 'Horror', 'Mystery', 'Romance', 'ScienceFiction', 'Thrillers', 'Wars', 'Western');

-- CreateTable
CREATE TABLE "User" (
    "id" SERIAL NOT NULL,
    "userName" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "avatar" TEXT NOT NULL DEFAULT '',
    "role" TEXT NOT NULL DEFAULT 'user',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Movie" (
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "price" DOUBLE PRECISION NOT NULL,
    "ratings" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "director" TEXT NOT NULL,
    "genre" "Genre" NOT NULL,
    "orderOrderNumber" INTEGER,
    "image" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "tailer" TEXT NOT NULL,
    "imdbRatings" INTEGER,
    "rottenTomatoesRatings" INTEGER NOT NULL,
    "orderOrderId" INTEGER,

    CONSTRAINT "Movie_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Review" (
    "id" SERIAL NOT NULL,
    "userId" INTEGER,
    "rating" DOUBLE PRECISION NOT NULL,
    "comment" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "movieId" INTEGER NOT NULL,

    CONSTRAINT "Review_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Order" (
    "orderId" SERIAL NOT NULL,
    "userId" INTEGER,
    "movieId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Order_pkey" PRIMARY KEY ("orderId")
);

-- CreateTable
CREATE TABLE "PaymentInfo" (
    "id" SERIAL NOT NULL,
    "paymentId" INTEGER NOT NULL,
    "status" TEXT NOT NULL,
    "tax" DOUBLE PRECISION NOT NULL,
    "moviePrice" DOUBLE PRECISION NOT NULL,
    "orderNumber" INTEGER NOT NULL,
    "orderOrderId" INTEGER NOT NULL,

    CONSTRAINT "PaymentInfo_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Movie_title_key" ON "Movie"("title");

-- AddForeignKey
ALTER TABLE "Movie" ADD CONSTRAINT "Movie_orderOrderId_fkey" FOREIGN KEY ("orderOrderId") REFERENCES "Order"("orderId") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Review" ADD CONSTRAINT "Review_movieId_fkey" FOREIGN KEY ("movieId") REFERENCES "Movie"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Order" ADD CONSTRAINT "Order_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PaymentInfo" ADD CONSTRAINT "PaymentInfo_orderOrderId_fkey" FOREIGN KEY ("orderOrderId") REFERENCES "Order"("orderId") ON DELETE RESTRICT ON UPDATE CASCADE;
