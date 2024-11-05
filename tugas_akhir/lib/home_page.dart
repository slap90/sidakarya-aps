import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  // Daftar ikon dan label untuk tiap kategori
  final List<Map<String, dynamic>> categories = [
    {"icon": Icons.home, "label": "Beranda"},
    {"icon": Icons.document_scanner, "label": "Dokumen"},
    {"icon": Icons.apartment, "label": "Alamat Rumah"},
    {"icon": Icons.health_and_safety, "label": "Kesehatan"},
  ];

  // Data untuk item terbaru
final List<Map<String, dynamic>> latestItems = [
    {
      "title": "Info terkini terkait Desa Sidakarya",
      "description": "15 items",
      "image": 'assets/image/yuhu.jpg', // Jalur gambar lokal
    },
    {
      "title": "Pembaruan Kesehatan Masyarakat",
      "description": "10 items",
      "image": 'assets/image/yuhu.jpg', // Gambar lain yang sama atau berbeda
    },
    {
      "title": "Kegiatan Pendidikan Anak",
      "description": "5 items",
      "image": 'assets/image/yuhu.jpg', // Gambar lain yang sama atau berbeda
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Search Bar
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            color: Colors.orange,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Icon(Icons.search, color: Colors.grey),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Icon(Icons.filter_list, color: Colors.grey),
                ],
              ),
            ),
          ),
          SizedBox(height: 16),

          // Category Section
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Category",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  "View All",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 1,
              ),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        print("${category['label']} clicked");
                      },
                      child: CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 13, 116, 11),
                        radius: 25,
                        child: Icon(
                          category["icon"],
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      category["label"],
                      style: TextStyle(fontSize: 12),
                      textAlign: TextAlign.center,
                    ),
                  ],
                );
              },
            ),
          ),
          SizedBox(height: 16),

          // Latest Section
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Latest",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 10),
          ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 16),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: latestItems.length,
            itemBuilder: (context, index) {
              final item = latestItems[index];
              return Padding(
                padding: EdgeInsets.only(bottom: 16),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        item["image"],
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            width: 60,
                            height: 60,
                            color: Colors.grey,
                            child: Icon(Icons.error, color: Colors.white),
                          );
                        },
                      ),
                    ),
                    SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            print("${item['title']} clicked");
                          },
                          child: Text(
                            item["title"],
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          item["description"],
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
