-- CreateTable
CREATE TABLE "HospedeDaReserva" (
    "id" SERIAL NOT NULL,
    "nome_completo" VARCHAR(45) NOT NULL,
    "criado_por" VARCHAR(45) NOT NULL,
    "criado_em" TIMESTAMP(3) NOT NULL,
    "atualizado_por" VARCHAR(45) NOT NULL,
    "atualizado_em" TIMESTAMP(3) NOT NULL,
    "reserva_localizador" VARCHAR(10) NOT NULL,

    CONSTRAINT "HospedeDaReserva_pkey" PRIMARY KEY ("id")
);
