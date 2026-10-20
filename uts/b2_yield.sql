
-- B2. Rekap Yield per Produk

SELECT
    pr.kode AS kode_produk,
    pr.nama AS nama_produk,
    SUM(p.jumlah_baik) AS total_baik,
    SUM(p.jumlah_cacat) AS total_cacat,
    ROUND(
        100.0 * SUM(p.jumlah_baik)
        / NULLIF(
            SUM(p.jumlah_baik) + SUM(p.jumlah_cacat),
            0
        ),
        2
    ) AS yield_persen
FROM produksi p
JOIN produk pr
    ON p.id_produk = pr.id
GROUP BY
    pr.id,
    pr.kode,
    pr.nama
ORDER BY
    pr.kode;
