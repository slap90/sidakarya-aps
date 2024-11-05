import 'package:flutter/material.dart';

class AktivitasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dokumen'),
      ),
      body: Center(
        child: Text(
          'Halaman Dokumen',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
