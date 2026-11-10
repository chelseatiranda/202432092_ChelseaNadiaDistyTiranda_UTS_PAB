import 'package:flutter/material.dart';
import '../models/item.dart';

class DetailPage extends StatelessWidget {
  final Item item;

  const DetailPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Barang'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: SizedBox(
                width: double.infinity,
                height: 240,
                child: item.imagePath.isEmpty
                    ? Container(
                        color: Colors.grey.shade300,
                        child: const Icon(Icons.inventory_2, size: 64),
                      )
                    : item.isNetworkImage
                        ? Image.network(
                            item.imagePath,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                const Icon(Icons.broken_image, size: 64),
                          )
                        : Image.asset(
                            item.imagePath,
                            fit: BoxFit.cover,
                            cacheWidth: 800,
                          ),
              ),
            ),
            const SizedBox(height: 16),
            Chip(
              label: Text(item.isLost ? 'Barang Hilang' : 'Barang Ditemukan'),
            ),
            const SizedBox(height: 8),
            Text(
              item.name,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Card(
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.description),
                    title: const Text('Deskripsi'),
                    subtitle: Text(item.description),
                  ),
                  ListTile(
                    leading: const Icon(Icons.place),
                    title: const Text('Lokasi'),
                    subtitle: Text(item.location),
                  ),
                  ListTile(
                    leading: const Icon(Icons.access_time),
                    title: const Text('Waktu'),
                    subtitle: Text(item.time),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Kembali'),
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(foregroundColor: Colors.red),
                onPressed: () {
                  Navigator.pop(context, true);
                },
                child: const Text('Hapus Laporan'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}