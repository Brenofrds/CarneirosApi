/*
  Warnings:

  - You are about to drop the column `id_jestor` on the `TaxaDaReserva` table. All the data in the column will be lost.
  - You are about to drop the column `reserva_localizador` on the `TaxaDaReserva` table. All the data in the column will be lost.
  - Added the required column `reservaId` to the `TaxaDaReserva` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "TaxaDaReserva" DROP COLUMN "id_jestor",
DROP COLUMN "reserva_localizador",
ADD COLUMN     "reservaId" INTEGER NOT NULL;

-- AddForeignKey
ALTER TABLE "TaxaDaReserva" ADD CONSTRAINT "TaxaDaReserva_reservaId_fkey" FOREIGN KEY ("reservaId") REFERENCES "Reserva"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
