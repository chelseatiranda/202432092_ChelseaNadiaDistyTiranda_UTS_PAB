import '../models/item.dart';

List<Item> lostItems = [
  Item(
    name: 'Dompet Hitam',
    description: 'Dompet kulit hitam berisi KTM dan kartu ATM.',
    location: 'Gedung A',
    time: '8 Nov 2026, 12.30',
    imagePath: 'assets/images/dompet.jpg',
    isLost: true,
  ),
  Item(
    name: 'Kunci Motor',
    description: 'Kunci motor dengan gantungan boneka kecil.',
    location: 'Parkiran Motor',
    time: '9 Nov 2026, 09.15',
    imagePath: 'assets/images/kunci.jpg',
    isLost: true,
  ),
];

List<Item> foundItems = [
  Item(
    name: 'Botol Minum Hijau',
    description: 'Botol minum hijau ditemukan di dekat tangga.',
    location: 'Lobi Gedung B',
    time: '9 Nov 2026, 14.00',
    imagePath: 'assets/images/botol.jpg',
    isLost: false,
  ),
  Item(
    name: 'Flashdisk Hijau',
    description: 'Flashdisk 16 GB ditemukan di meja lab.',
    location: 'Laboratorium Komputer',
    time: '10 Nov 2026, 10.20',
    imagePath: 'assets/images/flashdisk.jpg',
    isLost: false,
  ),
    Item(
    name: 'Payung Hitam',
    description: 'Payung hitam ditemukan di taman kolaborasi.',
    location: 'Taman kolaborasi',
    time: '9 Nov 2026, 13.10',
    imagePath: 'https://images.unsplash.com/photo-1713542893896-751aa1ebceb5?q=80&w=1173&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=NHwxMjA3fDA%3D',
    isNetworkImage: true,
    isLost: false,
  ),
];