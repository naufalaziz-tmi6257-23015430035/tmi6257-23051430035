UPDATE public.stok_produk
SET jumlah = jumlah - 200
WHERE id_produk = 4;

COMMIT;