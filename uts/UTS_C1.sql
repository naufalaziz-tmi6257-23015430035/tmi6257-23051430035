SELECT id, tanggal, id_produk, id_pelanggan, jumlah
FROM pengiriman
WHERE id_produk = 4
ORDER BY tanggal DESC;