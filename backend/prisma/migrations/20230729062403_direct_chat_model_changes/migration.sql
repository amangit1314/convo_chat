/*
  Warnings:

  - You are about to drop the column `receiverId` on the `public.directChat` table. All the data in the column will be lost.
  - You are about to drop the column `senderId` on the `public.directChat` table. All the data in the column will be lost.
  - Added the required column `firstPersonId` to the `public.directChat` table without a default value. This is not possible if the table is not empty.
  - Added the required column `secondPersonId` to the `public.directChat` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "public, auth"."public.directChat" DROP COLUMN "receiverId",
DROP COLUMN "senderId",
ADD COLUMN     "firstPersonId" TEXT NOT NULL,
ADD COLUMN     "secondPersonId" TEXT NOT NULL;
