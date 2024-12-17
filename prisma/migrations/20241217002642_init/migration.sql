-- CreateTable
CREATE TABLE "Proprietario" (
    "id" SERIAL NOT NULL,
    "cpf_cnpj" VARCHAR(45) NOT NULL,
    "proprietario_principal" TEXT NOT NULL,
    "email" TEXT NOT NULL,

    CONSTRAINT "Proprietario_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Condominio" (
    "id" SERIAL NOT NULL,
    "sku" VARCHAR(45) NOT NULL,
    "id_stays" TEXT NOT NULL,
    "atualizado_por" TEXT NOT NULL,
    "atualizado_em" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Condominio_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Imovel" (
    "id" SERIAL NOT NULL,
    "sku" VARCHAR(45) NOT NULL,
    "status" TEXT NOT NULL,
    "atualizado_por" TEXT NOT NULL,
    "atualizado_em" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "proprietarioId" INTEGER NOT NULL,
    "condominioId" INTEGER NOT NULL,

    CONSTRAINT "Imovel_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Bloqueio" (
    "id" SERIAL NOT NULL,
    "localizador" CHAR(5) NOT NULL,
    "id_externo" VARCHAR(45) NOT NULL,
    "criado_em" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "atualizado_por" VARCHAR(45) NOT NULL,
    "check_in" DATE NOT NULL,
    "check_out" DATE NOT NULL,
    "hora_check_in" TIME NOT NULL,
    "hora_check_out" TIME NOT NULL,
    "nota_interno" VARCHAR(255) NOT NULL,
    "status" VARCHAR(45) NOT NULL,
    "imovelId" INTEGER NOT NULL,

    CONSTRAINT "Bloqueio_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Canal" (
    "id" SERIAL NOT NULL,
    "titulo" VARCHAR(45) NOT NULL,
    "codigo" VARCHAR(50) NOT NULL,

    CONSTRAINT "Canal_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Proprietario_cpf_cnpj_key" ON "Proprietario"("cpf_cnpj");

-- CreateIndex
CREATE UNIQUE INDEX "Condominio_sku_key" ON "Condominio"("sku");

-- CreateIndex
CREATE UNIQUE INDEX "Imovel_sku_key" ON "Imovel"("sku");

-- CreateIndex
CREATE UNIQUE INDEX "Bloqueio_localizador_key" ON "Bloqueio"("localizador");

-- AddForeignKey
ALTER TABLE "Imovel" ADD CONSTRAINT "Imovel_proprietarioId_fkey" FOREIGN KEY ("proprietarioId") REFERENCES "Proprietario"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Imovel" ADD CONSTRAINT "Imovel_condominioId_fkey" FOREIGN KEY ("condominioId") REFERENCES "Condominio"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Bloqueio" ADD CONSTRAINT "Bloqueio_imovelId_fkey" FOREIGN KEY ("imovelId") REFERENCES "Imovel"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
