import 'package:flutter/material.dart';

import '../navigation/app_routes.dart';

class HalamanLayanan extends StatefulWidget {
  const HalamanLayanan({super.key});

  @override
  State<HalamanLayanan> createState() => _HalamanLayananState();
}

class _HalamanLayananState extends State<HalamanLayanan> {
  final Map<String, List<Map<String, String>>> _layanan = {
    'Perizinan': [
      {
        'nama': 'Perizinan Usaha',
        'dinas': 'Dinas Penanaman Modal dan PTSP',
        'jam': 'Senin-Jumat, 08.00-15.00',
        'keterangan': 'Layanan pengajuan izin usaha bagi masyarakat.',
      },
      {
        'nama': 'Izin Mendirikan Bangunan',
        'dinas': 'Dinas Pekerjaan Umum',
        'jam': 'Senin-Jumat, 08.00-15.00',
        'keterangan': 'Informasi dan pengajuan izin bangunan.',
      },
      {
        'nama': 'Administrasi Kependudukan',
        'dinas': 'Dinas Kependudukan dan Pencatatan Sipil',
        'jam': 'Senin-Jumat, 08.00-14.00',
        'keterangan': 'Informasi layanan dokumen kependudukan.',
      },
    ],
    'Kesehatan': [
      {
        'nama': 'Pendaftaran Puskesmas',
        'dinas': 'Dinas Kesehatan',
        'jam': 'Senin-Sabtu, 08.00-14.00',
        'keterangan': 'Informasi pendaftaran dan layanan puskesmas.',
      },
      {
        'nama': 'Informasi Rumah Sakit',
        'dinas': 'Dinas Kesehatan',
        'jam': 'Setiap hari, 24 jam',
        'keterangan': 'Informasi fasilitas dan layanan rumah sakit.',
      },
      {
        'nama': 'Layanan Imunisasi',
        'dinas': 'Dinas Kesehatan',
        'jam': 'Senin-Jumat, 08.00-12.00',
        'keterangan': 'Informasi jadwal imunisasi masyarakat.',
      },
    ],
    'Transportasi': [
      {
        'nama': 'Informasi Angkutan Umum',
        'dinas': 'Dinas Perhubungan',
        'jam': 'Senin-Jumat, 08.00-16.00',
        'keterangan': 'Informasi rute dan layanan angkutan umum.',
      },
      {
        'nama': 'Informasi Lalu Lintas',
        'dinas': 'Dinas Perhubungan',
        'jam': 'Setiap hari, 24 jam',
        'keterangan': 'Informasi kondisi dan pengaturan lalu lintas.',
      },
      {
        'nama': 'Pengaduan Fasilitas Jalan',
        'dinas': 'Dinas Perhubungan',
        'jam': 'Senin-Jumat, 08.00-16.00',
        'keterangan': 'Pelaporan masalah fasilitas transportasi.',
      },
    ],
  };

  Future<void> _bukaDetail(Map<String, String> data) async {
    // Tidak menggunakan <String> agar kompatibel dengan
    // MaterialPageRoute<dynamic> dari onGenerateRoute.
    final hasil = await Navigator.pushNamed(
      context,
      AppRoutes.detailLayanan,
      arguments: data,
    );

    if (!mounted) {
      return;
    }

    if (hasil != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(hasil.toString()),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  Widget _daftarLayanan(String kategori) {
    final daftar = _layanan[kategori]!;

    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: daftar.length,
      separatorBuilder: (context, index) {
        return const SizedBox(height: 8);
      },
      itemBuilder: (context, index) {
        final data = daftar[index];

        return Card(
          child: ListTile(
            leading: CircleAvatar(
              child: Icon(
                kategori == 'Perizinan'
                    ? Icons.description_outlined
                    : kategori == 'Kesehatan'
                    ? Icons.local_hospital_outlined
                    : Icons.directions_bus_outlined,
              ),
            ),
            title: Text(data['nama']!),
            subtitle: Text(data['dinas']!),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              _bukaDetail(data);
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          const Material(
            child: TabBar(
              isScrollable: true,
              tabs: [
                Tab(icon: Icon(Icons.description_outlined), text: 'Perizinan'),
                Tab(
                  icon: Icon(Icons.local_hospital_outlined),
                  text: 'Kesehatan',
                ),
                Tab(
                  icon: Icon(Icons.directions_bus_outlined),
                  text: 'Transportasi',
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              children: [
                _daftarLayanan('Perizinan'),
                _daftarLayanan('Kesehatan'),
                _daftarLayanan('Transportasi'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
