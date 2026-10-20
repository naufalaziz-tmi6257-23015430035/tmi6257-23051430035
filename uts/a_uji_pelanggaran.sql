
-- A2.2: Pelanggaran CHECK
INSERT INTO produksi
    (id_produk, id_lini, jumlah_baik, jumlah_cacat)
VALUES
    (1, 1, -100, 5);

-- Pesan error asli:
-- SQL Error [23514]: ERROR: new row for relation
-- "produksi" violates check constraint
-- "produksi_jumlah_baik_check"
-- Detail: Failing row contains (27, 2026-10-20 09:20:55.222131+07, 1, 1, -100, 5).
