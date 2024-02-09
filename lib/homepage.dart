import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:into_page/community/responsive/responsive_layout_screen.dart';
import 'package:into_page/preganent/Nextpage.dart';
import 'package:into_page/preganent/third_page.dart';

class homepage extends StatelessWidget {
  const homepage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xFF0B7897),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 25),
            Center(
              child: Text(
                "Kilkaari",
                style: GoogleFonts.dmSerifDisplay(
                  fontSize: screenWidth > 600
                      ? 48
                      : 28, // Adjust font size for larger screens
                  color: Color.fromARGB(255, 255, 254, 254),
                ),
              ),
            ),
            const SizedBox(height: 25),
            Center(
              child: Text(
                "Care for Mothers and Children",
                style: TextStyle(
                  fontSize: screenWidth > 600
                      ? 20
                      : 17, // Adjust font size for larger screens
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 50),
            // First Container
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                width: screenWidth > 600
                    ? 600
                    : null, // Limit width on larger screens
                height: 150,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 35, 167, 205),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Image.asset(
                          'lib/images/pregnant.png',
                          width: 350,
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 30),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'I am Pregnant',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 25),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => NextPage(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(255, 26, 140, 172),
                            ),
                            child: Text(
                              'Next',
                              style: TextStyle(
                                  color: Colors.white), // Text color white
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Second Container
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                width: screenWidth > 600
                    ? 600
                    : null, // Limit width on larger screens
                height: 150,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 35, 167, 205),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Image.asset(
                          'lib/images/mother.png',
                          width: 350,
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 30),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'I am a mother',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 25),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SecondPage(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(255, 26, 140, 172),
                            ),
                            child: Text(
                              'Next',
                              style: TextStyle(
                                  color: Colors.white), // Text color white
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Third Container
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                width: screenWidth > 600
                    ? 600
                    : null, // Limit width on larger screens
                height: 150,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 35, 167, 205),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Image.asset(
                          'lib/images/wemoms.png',
                          width: 350,
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 30),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'We Moms',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 25),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Wemoms(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(255, 26, 140, 172),
                            ),
                            child: Text(
                              'Next',
                              style: TextStyle(
                                  color: Colors.white), // Text color white
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Center(
        child: Text('This is the second page.'),
      ),
    );
  }
}

class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Third Page'),
      ),
      body: Center(
        child: Text('This is the third page.'),
      ),
    );
  }
}
