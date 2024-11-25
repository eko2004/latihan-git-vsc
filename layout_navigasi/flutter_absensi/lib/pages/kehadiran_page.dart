import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/kehadiran_provider.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<KehadiranProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Riwayat Kehadiran'),
        backgroundColor: Colors.yellowAccent,
      ),
      body: provider.history.isEmpty
          // Jika history kosong, tampilkan pesan
          ? Center(
              child: Text(
                'Tidak ada data hadir tersedia,Silakan isi Absen terlebih dahulu!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          // Jika ada data, tampilkan ListView
          : ListView.builder(
              itemCount: provider.history.length,
              itemBuilder: (context, index) {
                final record = provider.history[index];
                return ListTile(
                  title: Text(record.date),
                  subtitle: Text(
                      'Hadir: ${record.presentCount}, Tidak Hadir: ${record.absentCount}'),
                );
              },
            ),
    );
  }
}