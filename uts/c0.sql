BEGIN;

-- 1. Periksa saldo sebelum transaksi
SELECT jumlah AS saldo_sebelum
FROM stok_produk
WHERE id_produk = 4;

-- 2. Catat pengiriman
INSERT INTO pengiriman (tanggal, id_produk, id_pelanggan, jumlah)
VALUES (
    CURRENT_TIMESTAMP,
    4,
    1,
    FLOOR(1500 * 0.80)::INTEGER
);

-- 3. Kurangi stok
UPDATE stok_produk
SET jumlah = jumlah - FLOOR(1500 * 0.80)::INTEGER
WHERE id_produk = 4;

-- 4. Periksa saldo setelah UPDATE
SELECT jumlah AS saldo_sesudah
FROM stok_produk
WHERE id_produk = 4;

-- 5. Simpan kedua perubahan
COMMIT;