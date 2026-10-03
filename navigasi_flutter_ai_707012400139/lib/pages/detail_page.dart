import 'package:flutter/material.dart';

class HalamanDetail extends StatelessWidget {
  final String judul;
  final String keterangan;

  const HalamanDetail({
    super.key,
    required this.judul,
    required this.keterangan,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(judul)),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(judul, style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 16),
            Text(keterangan, style: Theme.of(context).textTheme.bodyLarge),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Kembali'),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, 'Data dari halaman detail');
                },
                child: const Text('Kembali dengan Nilai'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
