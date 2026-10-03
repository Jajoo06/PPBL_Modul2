import 'package:flutter/material.dart';

import '../navigation/app_routes.dart';

class HalamanLaporan extends StatelessWidget {
  const HalamanLaporan({super.key});

  final List<Map<String, String>> daftarLaporan = const [
    {
      'judul': 'Pencurian Kendaraan',
      'lokasi': 'Jl. Merdeka, Palembang',
      'status': 'Diproses',
      'deskripsi':
          'Warga melaporkan adanya pencurian kendaraan bermotor pada malam hari.',
    },
    {
      'judul': 'Gangguan Keamanan',
      'lokasi': 'Kecamatan Ilir Timur',
      'status': 'Menunggu Verifikasi',
      'deskripsi':
          'Terdapat laporan mengenai gangguan keamanan di lingkungan warga.',
    },
    {
      'judul': 'Kerusakan Fasilitas Umum',
      'lokasi': 'Kecamatan Sukarami',
      'status': 'Selesai',
      'deskripsi':
          'Fasilitas umum mengalami kerusakan dan membutuhkan perbaikan.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Laporan'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: daftarLaporan.length,
        itemBuilder: (context, index) {
          final laporan = daftarLaporan[index];

          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: const CircleAvatar(
                child: Icon(Icons.report),
              ),
              title: Text(
                laporan['judul']!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                '${laporan['lokasi']}\nStatus: ${laporan['status']}',
              ),
              isThreeLine: true,
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  AppRoutes.detailLaporan,
                  arguments: laporan,
                );
              },
            ),
          );
        },
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: 1,
        onDestinationSelected: (index) {
          if (index == 0) {
            Navigator.pushReplacementNamed(
              context,
              AppRoutes.beranda,
            );
          } else if (index == 2) {
            Navigator.pushReplacementNamed(
              context,
              AppRoutes.profil,
            );
          }
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Beranda',
          ),
          NavigationDestination(
            icon: Icon(Icons.report_outlined),
            selectedIcon: Icon(Icons.report),
            label: 'Laporan',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}