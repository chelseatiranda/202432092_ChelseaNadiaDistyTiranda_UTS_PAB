import 'package:flutter/material.dart';
import '../data/dummy_data.dart';
import '../models/item.dart';
import 'detail_page.dart';
import 'form_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> _openForm() async {
    final Item? newItem = await Navigator.push<Item>(
      context,
      MaterialPageRoute(builder: (context) => const FormPage()),
    );

    if (newItem != null) {
      setState(() {
        if (newItem.isLost) {
          lostItems.add(newItem);
        } else {
          foundItems.add(newItem);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Lost & Found Kampus'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Barang Hilang'),
              Tab(text: 'Barang Ditemukan'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildList(lostItems),
            _buildList(foundItems),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: _openForm,
          icon: const Icon(Icons.add),
          label: const Text('Tambah Laporan'),
        ),
      ),
    );
  }

  Widget _buildList(List<Item> items) {
    if (items.isEmpty) {
      return const Center(child: Text('Belum ada data'));
    }
    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 88),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          child: ListTile(
            contentPadding: const EdgeInsets.all(10),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: SizedBox(
                width: 64,
                height: 64,
                child: _buildImage(item),
              ),
            ),
            title: Text(
              item.name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text('${item.location}\n${item.time}'),
            isThreeLine: true,
            trailing: const Icon(Icons.chevron_right),
            onTap: () async {
              final deleted = await Navigator.push<bool>(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(item: item),
                ),
              );
              if (deleted == true) {
                setState(() {
                  lostItems.remove(item);
                  foundItems.remove(item);
                });
              }
            },
          ),
        );
      },
    );
  }

  Widget _buildImage(Item item) {
    if (item.imagePath.isEmpty) {
      return Container(
        color: Colors.grey.shade300,
        child: const Icon(Icons.inventory_2),
      );
    }
    if (item.isNetworkImage) {
      return Image.network(
        item.imagePath,
        fit: BoxFit.cover,
        cacheWidth: 200,
        errorBuilder: (context, error, stackTrace) =>
            const Icon(Icons.broken_image),
      );
    }
    return Image.asset(
      item.imagePath,
      fit: BoxFit.cover,
      cacheWidth: 200,
    );
  }
}