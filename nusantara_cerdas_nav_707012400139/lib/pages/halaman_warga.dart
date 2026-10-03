import 'package:flutter/material.dart';

import '../navigation/app_routes.dart';

class HalamanWarga extends StatelessWidget {
  const HalamanWarga({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondaryContainer,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.people, size: 48),
              SizedBox(height: 12),
              Text(
                'Ruang Warga',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Akses informasi dan pantau aktivitas '
                'pelayanan masyarakat.',
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Card(
          child: ListTile(
            leading: const Icon(Icons.history),
            title: const Text('Riwayat Laporan'),
            subtitle: const Text('Lihat laporan dan aktivitas warga'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.riwayatLaporan);
            },
          ),
        ),
        Card(
          child: ListTile(
            leading: const Icon(Icons.settings_outlined),
            title: const Text('Pengaturan Kota'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.pengaturanKota);
            },
          ),
        ),
        Card(
          child: ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('Tentang Aplikasi'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.tentangAplikasi);
            },
          ),
        ),
      ],
    );
  }
}
