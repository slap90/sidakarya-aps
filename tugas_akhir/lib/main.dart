import 'package:flutter/material.dart';
import 'package:tugas_akhir/home_page.dart';
import 'package:tugas_akhir/aktivitas_page.dart';
import 'package:tugas_akhir/profile_page.dart';

void main() {
  runApp(TugasAkhirApp());
}

class TugasAkhirApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas Akhir',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      initialRoute: '/', // Set halaman login sebagai halaman awal
      routes: {
        '/': (context) => MainPage(),
      },
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  // Daftar halaman untuk tiap item di BottomNavigationBar
  static List<Widget> _pages = <Widget>[
    HomePage(),
    AktivitasPage(),
    ProfilePage(),
  ];

  // Fungsi untuk mengganti halaman berdasarkan item yang dipilih
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 0,
        centerTitle: true, // Untuk membuat judul di AppBar berada di tengah
        title: Text(
          _selectedIndex == 0
              ? "Desa Sidakarya"
              : _selectedIndex == 1
                  ? "Aktivitas"
                  : "Profile",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notes),
            label: 'Aktivitas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.orange,
        onTap: _onItemTapped,
      ),
    );
  }
}
