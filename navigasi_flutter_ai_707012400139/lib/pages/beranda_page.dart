import 'package:flutter/material.dart';

import '../navigation/app_routes.dart';

class HalamanBeranda extends StatefulWidget {
  const HalamanBeranda({super.key});

  @override
  State<HalamanBeranda> createState() => _HalamanBerandaState();
}

class _HalamanBerandaState extends State<HalamanBeranda> {
  String _pesan = 'Belum ada data yang dikirim balik.';

  Future<void> _bukaDetail() async {
    final hasil = await Navigator.pushNamed<String>(
      context,
      AppRoutes.detail,
      arguments: {
        'judul': 'Detail Mata Kuliah',
        'keterangan': 'Halaman ini berisi informasi tentang mata kuliah Pemrograman Perangkat Bergerak Lanjut.',
      },
    );

    if (!mounted) {
      return;
    }

    setState(() {
      _pesan = hasil ?? 'Tidak ada data yang dikirim balik.';
    });
  }

  void _ujiRouteSalah() {
    Navigator.pushNamed(context, '/salah');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Beranda'),
        leading: const Icon(Icons.home),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(_pesan, textAlign: TextAlign.center),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _bukaDetail,
                child: const Text('Buka Halaman Detail'),
              ),
              const SizedBox(height: 12),
              OutlinedButton(
                onPressed: _ujiRouteSalah,
                child: const Text('Uji Route /salah'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
