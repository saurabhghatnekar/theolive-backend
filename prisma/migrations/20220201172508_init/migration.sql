-- CreateTable
CREATE TABLE "User" (
    "id" SERIAL NOT NULL,
    "primaryEmail" TEXT NOT NULL,
    "name" TEXT,
    "secondaryEmail" TEXT,
    "phoneNumber" TEXT,
    "taxId" TEXT,
    "isActive" BOOLEAN,
    "createdAt" TIMESTAMP(3),
    "updatedAt" TIMESTAMP(3),
    "otherInfo" TEXT,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Account" (
    "id" SERIAL NOT NULL,
    "accountId" INTEGER NOT NULL,
    "userId" INTEGER NOT NULL,
    "bankCode" TEXT NOT NULL,
    "pinCode" TEXT NOT NULL,
    "AccountType" TEXT NOT NULL,
    "AccountDirection" TEXT NOT NULL DEFAULT E'',
    "otherInfo" TEXT NOT NULL DEFAULT E'',
    "isVerified" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "Account_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Transaction" (
    "id" SERIAL NOT NULL,
    "transactionId" INTEGER NOT NULL,
    "accountId" INTEGER NOT NULL,
    "transactionType" TEXT NOT NULL,
    "transactionAmount" DOUBLE PRECISION NOT NULL,
    "transactionDate" TIMESTAMP(3) NOT NULL,
    "transactionDescription" TEXT NOT NULL,

    CONSTRAINT "Transaction_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Deposit" (
    "id" SERIAL NOT NULL,
    "transactionId" INTEGER NOT NULL,
    "userId" INTEGER NOT NULL,
    "sourceAccountId" INTEGER NOT NULL,
    "destinationAccountId" INTEGER NOT NULL,
    "transferAmount" DOUBLE PRECISION NOT NULL,
    "transferDate" TIMESTAMP(3) NOT NULL,
    "transferDescription" TEXT NOT NULL,
    "isPending" BOOLEAN NOT NULL,

    CONSTRAINT "Deposit_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Withdrawal" (
    "id" SERIAL NOT NULL,
    "transactionId" INTEGER NOT NULL,
    "userId" INTEGER NOT NULL,
    "receivingAccountId" INTEGER NOT NULL,
    "transferAmount" DOUBLE PRECISION NOT NULL,
    "transferDate" TIMESTAMP(3) NOT NULL,
    "transferDescription" TEXT NOT NULL,
    "isPending" BOOLEAN NOT NULL,

    CONSTRAINT "Withdrawal_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Balance" (
    "id" SERIAL NOT NULL,
    "userId" INTEGER NOT NULL,
    "accountId" INTEGER NOT NULL,
    "balanceAmount" DOUBLE PRECISION NOT NULL,
    "currency" TEXT NOT NULL,

    CONSTRAINT "Balance_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_primaryEmail_key" ON "User"("primaryEmail");

-- CreateIndex
CREATE UNIQUE INDEX "Account_accountId_key" ON "Account"("accountId");

-- CreateIndex
CREATE UNIQUE INDEX "Transaction_transactionId_key" ON "Transaction"("transactionId");

-- CreateIndex
CREATE UNIQUE INDEX "Deposit_transactionId_key" ON "Deposit"("transactionId");

-- CreateIndex
CREATE UNIQUE INDEX "Withdrawal_transactionId_key" ON "Withdrawal"("transactionId");
