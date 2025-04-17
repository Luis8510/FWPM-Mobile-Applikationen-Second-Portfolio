import 'package:flutter/material.dart';

void main() {
  runApp(const CarouselApp());
}

class CarouselApp extends StatefulWidget {
  const CarouselApp({super.key});

  @override
  State<CarouselApp> createState() => _CarouselAppState();
}

class _CarouselAppState extends State<CarouselApp> {
  List<String> imagePaths = [
    'assets/images/avatar1.png',
    'assets/images/avatar2.png',
    'assets/images/avatar3.png',
    'assets/images/avatar4.png',
    'assets/images/avatar5.png'
  ];

  int _currentIndex = 0;

  updateIndex(int updateValue) {
    setState(() {
      _currentIndex = (_currentIndex + updateValue) % imagePaths.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.55,
                child: Image.asset(
                  imagePaths[_currentIndex],
                  fit: BoxFit.cover,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      updateIndex(-1);
                    },
                    child: Container(
                      width: 140,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(255, 154, 211, 255),
                      ),
                      child: const Icon(
                        color: Colors.black,
                        Icons.chevron_left,
                        size: 100,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      updateIndex(1);
                    },
                    child: Container(
                      width: 140,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(255, 154, 211, 255),
                      ),
                      child: const Icon(
                        color: Colors.black,
                        Icons.chevron_right,
                        size: 100,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
