
-- B3. Rekap Saldo Stok dan Status Persediaan

WITH total_produksi AS (
    SELECT
        id_produk,
        SUM(jumlah_baik) AS total_baik
    FROM produksi
    GROUP BY id_produk
),
total_pengiriman AS (
    SELECT
        id_produk,
        SUM(jumlah) AS total_kirim
    FROM pengiriman
    GROUP BY id_produk
)
SELECT
    pr.kode,
    pr.nama,
    COALESCE(tp.total_baik, 0) AS total_baik,
    COALESCE(tk.total_kirim, 0) AS total_kirim,
    COALESCE(tp.total_baik, 0)
        - COALESCE(tk.total_kirim, 0) AS saldo,
    pr.stok_minimum,
    CASE
        WHEN COALESCE(tp.total_baik, 0)
             - COALESCE(tk.total_kirim, 0) >= pr.stok_minimum
        THEN 'SEHAT'
        ELSE 'DI BAWAH MINIMUM'
    END AS status_stok
FROM produk pr
LEFT JOIN total_produksi tp
    ON tp.id_produk = pr.id
LEFT JOIN total_pengiriman tk
    ON tk.id_produk = pr.id
ORDER BY pr.kode;
