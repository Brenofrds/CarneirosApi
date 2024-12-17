-- CreateTable
CREATE TABLE "TaxaDaReserva" (
    "id" SERIAL NOT NULL,
    "taxa" VARCHAR(45) NOT NULL,
    "criado_por" VARCHAR(45) NOT NULL,
    "criado_em" TIMESTAMP(3) NOT NULL,
    "atualizado_por" VARCHAR(45) NOT NULL,
    "atualizado_em" TIMESTAMP(3) NOT NULL,
    "valor" DECIMAL(10,2) NOT NULL,
    "id_jestor" INTEGER NOT NULL,
    "reserva_localizador" VARCHAR(10) NOT NULL,

    CONSTRAINT "TaxaDaReserva_pkey" PRIMARY KEY ("id")
);
