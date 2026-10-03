import 'package:flutter/material.dart';

class HalamanDetailLayanan extends StatelessWidget {
  final Map<String, String> dataLayanan;

  const HalamanDetailLayanan({super.key, required this.dataLayanan});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rincian Layanan')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Icon(
            Icons.assignment_outlined,
            size: 64,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(height: 20),
          Text(
            dataLayanan['nama'] ?? 'Nama layanan',
            style: Theme.of(context).textTheme.headlineSmall
                ?.copyWith(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          _informasi(
            Icons.account_balance_outlined,
            'Dinas Penanggung Jawab',
            dataLayanan['dinas'] ?? '-',
          ),
          _informasi(
            Icons.access_time,
            'Jam Operasional',
            dataLayanan['jam'] ?? '-',
          ),
          _informasi(
            Icons.info_outline,
            'Keterangan',
            dataLayanan['keterangan'] ?? '-',
          ),
          const SizedBox(height: 24),
          FilledButton.icon(
            onPressed: () {
              Navigator.pop(
                context,
                'Permohonan ${dataLayanan['nama']} '
                'berhasil diajukan.',
              );
            },
            icon: const Icon(Icons.send),
            label: const Text('Ajukan Permohonan'),
          ),
          const SizedBox(height: 8),
          OutlinedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Kembali'),
          ),
        ],
      ),
    );
  }

  Widget _informasi(IconData ikon, String judul, String isi) {
    return Card(
      child: ListTile(
        leading: Icon(ikon),
        title: Text(judul, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(isi),
      ),
    );
  }
}
