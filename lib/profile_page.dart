import 'package:flutter/material.dart';

import 'user_data.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController namaController = TextEditingController();
  TextEditingController hobbyController = TextEditingController();

  void onTabTapped(int index) {
    if (index == 0) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Peringatan'),
            content:
                Text('Harap simpan perubahan sebelum pindah ke halaman lain.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Tutup dialog
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    } else if (index == 2) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Peringatan'),
            content:
                Text('Harap simpan perubahan sebelum pindah ke halaman lain.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Tutup dialog
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  void initState() {
    super.initState();
    namaController.text = UserData.namaPengguna;
    hobbyController.text = UserData.hobby;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              UserData.namaPengguna,
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: namaController,
              onChanged: (value) {
                setState(() {
                  UserData.namaPengguna = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Nama',
              ),
            ),
            TextField(
              controller: hobbyController,
              onChanged: (value) {
                setState(() {
                  UserData.hobby = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Hobby',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                String namaPengguna = namaController.text;
                Navigator.pop(context, namaPengguna);
              },
              child: Text('Simpan'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 4.0,
        child: Container(
          height: 50.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(Icons.home),
                onPressed: () {
                  onTabTapped(0);
                },
              ),
              IconButton(
                icon: Icon(Icons.map),
                onPressed: () {
                  onTabTapped(2);
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.person),
      ),
    );
  }
}
