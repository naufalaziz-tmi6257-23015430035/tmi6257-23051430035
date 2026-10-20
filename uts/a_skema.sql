
SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'public'
  AND table_name IN (
      'jenis_produk',
      'lini_produksi',
      'pelanggan',
      'produk',
      'produksi',
      'pengiriman'
  )
ORDER BY table_name;
