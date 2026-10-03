import 'package:flutter/material.dart';

class HalamanPengaturan extends StatefulWidget {
  const HalamanPengaturan({super.key});

  @override
  State<HalamanPengaturan> createState() => _HalamanPengaturanState();
}

class _HalamanPengaturanState extends State<HalamanPengaturan> {
  bool notifikasiAktif = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengaturan'),
      ),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text('Notifikasi'),
            subtitle: const Text(
              'Terima informasi terbaru mengenai laporan',
            ),
            value: notifikasiAktif,
            onChanged: (value) {
              setState(() {
                notifikasiAktif = value;
              });
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.language),
            title: const Text('Bahasa'),
            subtitle: const Text('Bahasa Indonesia'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.security),
            title: const Text('Privasi'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}