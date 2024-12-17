/*
  Warnings:

  - You are about to drop the column `atualizado_em` on the `HospedeDaReserva` table. All the data in the column will be lost.
  - You are about to drop the column `atualizado_por` on the `HospedeDaReserva` table. All the data in the column will be lost.
  - You are about to drop the column `criado_em` on the `HospedeDaReserva` table. All the data in the column will be lost.
  - You are about to drop the column `criado_por` on the `HospedeDaReserva` table. All the data in the column will be lost.
  - You are about to drop the column `nome_completo` on the `HospedeDaReserva` table. All the data in the column will be lost.
  - You are about to drop the column `reserva_localizador` on the `HospedeDaReserva` table. All the data in the column will be lost.
  - You are about to drop the column `atualizado_em` on the `Imovel` table. All the data in the column will be lost.
  - You are about to drop the column `atualizado_por` on the `Imovel` table. All the data in the column will be lost.
  - Added the required column `atualizadoEm` to the `HospedeDaReserva` table without a default value. This is not possible if the table is not empty.
  - Added the required column `atualizadoPor` to the `HospedeDaReserva` table without a default value. This is not possible if the table is not empty.
  - Added the required column `criadoEm` to the `HospedeDaReserva` table without a default value. This is not possible if the table is not empty.
  - Added the required column `criadoPor` to the `HospedeDaReserva` table without a default value. This is not possible if the table is not empty.
  - Added the required column `nomeCompleto` to the `HospedeDaReserva` table without a default value. This is not possible if the table is not empty.
  - Added the required column `reservaLocalizador` to the `HospedeDaReserva` table without a default value. This is not possible if the table is not empty.
  - Added the required column `atualizadoPor` to the `Imovel` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "HospedeDaReserva" DROP COLUMN "atualizado_em",
DROP COLUMN "atualizado_por",
DROP COLUMN "criado_em",
DROP COLUMN "criado_por",
DROP COLUMN "nome_completo",
DROP COLUMN "reserva_localizador",
ADD COLUMN     "atualizadoEm" TIMESTAMP(3) NOT NULL,
ADD COLUMN     "atualizadoPor" VARCHAR(45) NOT NULL,
ADD COLUMN     "criadoEm" TIMESTAMP(3) NOT NULL,
ADD COLUMN     "criadoPor" VARCHAR(45) NOT NULL,
ADD COLUMN     "nomeCompleto" VARCHAR(45) NOT NULL,
ADD COLUMN     "reservaLocalizador" VARCHAR(10) NOT NULL;

-- AlterTable
ALTER TABLE "Imovel" DROP COLUMN "atualizado_em",
DROP COLUMN "atualizado_por",
ADD COLUMN     "atualizadoEm" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "atualizadoPor" TEXT NOT NULL;

-- CreateTable
CREATE TABLE "Reserva" (
    "id" SERIAL NOT NULL,
    "localizador" VARCHAR(10) NOT NULL,
    "idAutomacao" INTEGER NOT NULL,
    "criadoPor" VARCHAR(45) NOT NULL,
    "atualizadoPor" VARCHAR(45) NOT NULL,
    "criadoEm" TIMESTAMP(3) NOT NULL,
    "atualizadoEm" TIMESTAMP(3) NOT NULL,
    "idExterno" VARCHAR(36) NOT NULL,
    "dataDaCriacao" TIMESTAMP(3) NOT NULL,
    "checkIn" TIMESTAMP(3) NOT NULL,
    "checkOut" TIMESTAMP(3) NOT NULL,
    "periodoDaReservaInicio" TIMESTAMP(3) NOT NULL,
    "periodoDaReservaFim" TIMESTAMP(3) NOT NULL,
    "horaCheckIn" TIMESTAMP(3) NOT NULL,
    "horaCheckOut" TIMESTAMP(3) NOT NULL,
    "quantidadeHospedes" INTEGER NOT NULL,
    "quantidadeAdultos" INTEGER NOT NULL,
    "quantidadeCriancas" INTEGER NOT NULL,
    "quantidadeInfantil" INTEGER NOT NULL,
    "observacoes" VARCHAR(255) NOT NULL,
    "quantidadeDiarias" INTEGER NOT NULL,
    "partnerCode" VARCHAR(45) NOT NULL,
    "moeda" CHAR(3) NOT NULL,
    "valorTotal" DECIMAL(10,2) NOT NULL,
    "totalTaxasExtras" DECIMAL(10,2) NOT NULL,
    "totalPago" DECIMAL(10,2) NOT NULL,
    "pendenteQuitacao" DECIMAL(10,2) NOT NULL,
    "status" TEXT NOT NULL,
    "chatReserva" VARCHAR(255) NOT NULL,
    "processamentoPg" TEXT NOT NULL,
    "responsavel" VARCHAR(90) NOT NULL,
    "linkStays" VARCHAR(2083) NOT NULL,
    "origem" VARCHAR(45) NOT NULL,
    "nomeDoImovelPersonalizado" VARCHAR(45) NOT NULL,
    "condominio" VARCHAR(45) NOT NULL,
    "regiao" VARCHAR(45) NOT NULL,
    "idImovelStays" VARCHAR(45) NOT NULL,
    "imovelOficialSku" VARCHAR(45) NOT NULL,
    "canaisTitulo" VARCHAR(45) NOT NULL,
    "imovelId" INTEGER NOT NULL,
    "canalId" INTEGER NOT NULL,
    "hospedeDaReservaId" INTEGER NOT NULL,
    "agenteId" INTEGER NOT NULL,

    CONSTRAINT "Reserva_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Reserva" ADD CONSTRAINT "Reserva_imovelId_fkey" FOREIGN KEY ("imovelId") REFERENCES "Imovel"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Reserva" ADD CONSTRAINT "Reserva_canalId_fkey" FOREIGN KEY ("canalId") REFERENCES "Canal"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Reserva" ADD CONSTRAINT "Reserva_hospedeDaReservaId_fkey" FOREIGN KEY ("hospedeDaReservaId") REFERENCES "HospedeDaReserva"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Reserva" ADD CONSTRAINT "Reserva_agenteId_fkey" FOREIGN KEY ("agenteId") REFERENCES "Agente"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
