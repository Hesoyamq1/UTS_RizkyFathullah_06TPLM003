import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: ShoesListApp(),
        ),
      ),
    );
  }
}

class ShoesListApp extends StatelessWidget {
  final List<Map<String, dynamic>> shoesList = [
    {
      'name': 'Converse Chuck Taylor All Star Partially Recycled Cotton',
      'deskripsi': 'Rp 899,000',
      'imagePath': 'assets/nik1.png',
      'backgroundColor': Color.fromARGB(255, 142, 71, 255),
    },
    {
      'name': 'Converse Chuck Taylor All Star 70 Hi',
      'deskripsi': 'Rp 899,000',
      'imagePath': 'assets/nik2.png',
      'backgroundColor': Color.fromARGB(255, 255, 220, 106),
    },
    {
      'name': 'Converse Chuck Taylor All Star Flux Ultra',
      'deskripsi': 'Rp 999,000',
      'imagePath': 'assets/nik3.png',
      'backgroundColor': Color.fromARGB(255, 255, 186, 220),
    },
    {
      'name': 'Converse Chuck Taylor All Star Flux Ultra',
      'deskripsi': 'Rp 899,000',
      'imagePath': 'assets/nik4.png',
      'backgroundColor': Color.fromARGB(255, 38, 255, 226),
    },
    {
      'name': 'Converse Tobin',
      'deskripsi': 'Rp 799,000',
      'imagePath': 'assets/nik5.png',
      'backgroundColor': Color.fromARGB(255, 125, 125, 250),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Shoes',
          style: TextStyle(
            color: const Color.fromARGB(255, 75, 75, 75),
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding:
                const EdgeInsets.only(left: 30, top: 8, right: 30, bottom: 8),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/avatar.jpeg'),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: shoesList.length,
        itemBuilder: (context, index) {
          final shoes = shoesList[index];
          return ShoesCard(
            name: shoes['name'],
            deskripsi: shoes['deskripsi'],
            imagePath: shoes['imagePath'],
            backgroundColor: shoes['backgroundColor'],
          );
        },
      ),
    );
  }
}

class ShoesCard extends StatelessWidget {
  final String? name;
  final String? deskripsi;
  final String? imagePath;
  final Color? backgroundColor;

  const ShoesCard({
    this.deskripsi,
    this.name,
    this.imagePath,
    this.backgroundColor = Colors.lightBlue, // Default background color
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
      padding: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 4,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name ?? '',
                style: TextStyle(
                  color: const Color.fromARGB(255, 75, 75, 75),
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                deskripsi ?? '',
                style: TextStyle(
                  color: const Color.fromARGB(255, 75, 75, 75),
                  fontSize: 14.0,
                ),
              ),
            ],
          ),
          Image(
            image: AssetImage(imagePath ?? ''),
            height: 150.0,
            width: 150.0,
          ),
        ],
      ),
    );
  }
}