-- CreateSchema
CREATE SCHEMA IF NOT EXISTS "public, auth";

-- CreateTable
CREATE TABLE "public, auth"."public.user" (
    "uid" TEXT NOT NULL,
    "token" TEXT,
    "firebaseToken" TEXT,
    "username" TEXT,
    "email" TEXT NOT NULL,
    "number" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "profileImage" TEXT,
    "createdOrUpdatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "isOnline" BOOLEAN DEFAULT false,

    CONSTRAINT "public.user_pkey" PRIMARY KEY ("uid")
);

-- CreateTable
CREATE TABLE "public, auth"."public.directChat" (
    "roomId" TEXT NOT NULL,
    "senderId" TEXT NOT NULL,
    "receiverId" TEXT NOT NULL,
    "lastMessageAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "public.directChat_pkey" PRIMARY KEY ("roomId")
);

-- CreateTable
CREATE TABLE "public, auth"."public.group" (
    "groupId" TEXT NOT NULL,
    "userUid" TEXT,
    "groupName" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "message" TEXT NOT NULL,

    CONSTRAINT "public.group_pkey" PRIMARY KEY ("groupId")
);

-- CreateTable
CREATE TABLE "public, auth"."public.message" (
    "messageId" TEXT NOT NULL,
    "chatRoomId" TEXT NOT NULL,
    "sender" TEXT NOT NULL,
    "receiver" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "content" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "isDeleted" BOOLEAN NOT NULL DEFAULT false,
    "directChatRoomId" TEXT,
    "groupId" TEXT,

    CONSTRAINT "public.message_pkey" PRIMARY KEY ("messageId")
);

-- CreateTable
CREATE TABLE "public, auth"."public.reaction" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "reaction" TEXT NOT NULL,
    "reactedAt" TIMESTAMP(3) NOT NULL,
    "messageMessageId" TEXT,

    CONSTRAINT "public.reaction_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public, auth"."_UserChats" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "public, auth"."_UserJoinedGroups" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "public.user_uid_key" ON "public, auth"."public.user"("uid");

-- CreateIndex
CREATE UNIQUE INDEX "public.user_email_key" ON "public, auth"."public.user"("email");

-- CreateIndex
CREATE UNIQUE INDEX "public.user_number_key" ON "public, auth"."public.user"("number");

-- CreateIndex
CREATE UNIQUE INDEX "public.directChat_roomId_key" ON "public, auth"."public.directChat"("roomId");

-- CreateIndex
CREATE UNIQUE INDEX "public.group_groupId_key" ON "public, auth"."public.group"("groupId");

-- CreateIndex
CREATE UNIQUE INDEX "public.message_chatRoomId_key" ON "public, auth"."public.message"("chatRoomId");

-- CreateIndex
CREATE UNIQUE INDEX "_UserChats_AB_unique" ON "public, auth"."_UserChats"("A", "B");

-- CreateIndex
CREATE INDEX "_UserChats_B_index" ON "public, auth"."_UserChats"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_UserJoinedGroups_AB_unique" ON "public, auth"."_UserJoinedGroups"("A", "B");

-- CreateIndex
CREATE INDEX "_UserJoinedGroups_B_index" ON "public, auth"."_UserJoinedGroups"("B");

-- AddForeignKey
ALTER TABLE "public, auth"."public.message" ADD CONSTRAINT "public.message_directChatRoomId_fkey" FOREIGN KEY ("directChatRoomId") REFERENCES "public, auth"."public.directChat"("roomId") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public, auth"."public.message" ADD CONSTRAINT "public.message_groupId_fkey" FOREIGN KEY ("groupId") REFERENCES "public, auth"."public.group"("groupId") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public, auth"."public.reaction" ADD CONSTRAINT "public.reaction_messageMessageId_fkey" FOREIGN KEY ("messageMessageId") REFERENCES "public, auth"."public.message"("messageId") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public, auth"."_UserChats" ADD CONSTRAINT "_UserChats_A_fkey" FOREIGN KEY ("A") REFERENCES "public, auth"."public.directChat"("roomId") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public, auth"."_UserChats" ADD CONSTRAINT "_UserChats_B_fkey" FOREIGN KEY ("B") REFERENCES "public, auth"."public.user"("uid") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public, auth"."_UserJoinedGroups" ADD CONSTRAINT "_UserJoinedGroups_A_fkey" FOREIGN KEY ("A") REFERENCES "public, auth"."public.group"("groupId") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public, auth"."_UserJoinedGroups" ADD CONSTRAINT "_UserJoinedGroups_B_fkey" FOREIGN KEY ("B") REFERENCES "public, auth"."public.user"("uid") ON DELETE CASCADE ON UPDATE CASCADE;
