/*
  Warnings:

  - The primary key for the `public.reaction` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `id` on the `public.reaction` table. All the data in the column will be lost.
  - You are about to drop the column `messageMessageId` on the `public.reaction` table. All the data in the column will be lost.
  - The required column `reactionId` was added to the `public.reaction` table with a prisma-level default value. This is not possible if the table is not empty. Please add this column as optional, then populate it before making it required.

*/
-- DropForeignKey
ALTER TABLE "public, auth"."public.reaction" DROP CONSTRAINT "public.reaction_messageMessageId_fkey";

-- AlterTable
ALTER TABLE "public, auth"."public.reaction" DROP CONSTRAINT "public.reaction_pkey",
DROP COLUMN "id",
DROP COLUMN "messageMessageId",
ADD COLUMN     "messageId" TEXT,
ADD COLUMN     "reactionId" TEXT NOT NULL,
ADD CONSTRAINT "public.reaction_pkey" PRIMARY KEY ("reactionId");

-- AddForeignKey
ALTER TABLE "public, auth"."public.reaction" ADD CONSTRAINT "public.reaction_messageId_fkey" FOREIGN KEY ("messageId") REFERENCES "public, auth"."public.message"("messageId") ON DELETE SET NULL ON UPDATE CASCADE;
