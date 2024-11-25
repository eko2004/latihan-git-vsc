import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/kehadiran_provider.dart';

class KehadiranPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<KehadiranProvider>(context);

    return Scaffold(
      appBar: AppBar(
          title: Text('Presensi Siswa'), backgroundColor: Colors.yellowAccent),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: provider.Siswas.length,
              itemBuilder: (context, index) {
                final Siswa = provider.Siswas[index];
                return ListTile(
                  title: Text(Siswa.name),
                  trailing: Checkbox(
                    value: Siswa.isPresent,
                    onChanged: (value) {
                      Siswa.isPresent = value ?? false;
                      provider.notifyListeners();
                    },
                  ),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: provider.Siswas.isNotEmpty
                ? () => provider.saveKehadiran()
                : null,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: 16.0,
                  horizontal: 32.0), // Ubah padding sesuai keinginan
              child: Text('Simpan Kehadiran'),
            ),
          )
        ],
      ),
    );
  }
}