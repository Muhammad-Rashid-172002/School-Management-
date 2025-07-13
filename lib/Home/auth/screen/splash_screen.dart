import 'package:flutter/material.dart';
import 'package:school_magmenet_app/Home/auth/chose_login_type.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateToNextScreen(); //  Call the navigation when splash starts
  }

  Future<void> navigateToNextScreen() async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const RoleSelectionScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Top curved background
          Align(
            alignment: Alignment.topLeft,
            child: ClipPath(
              clipper: TopCurveClipper(),
              child: Container(
                height: 160,
                width: 200,
                color: const Color(0xFF2AC9A0),
              ),
            ),
          ),

          // Bottom curved background
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipPath(
              clipper: BottomCurveClipper(),
              child: Container(
                height: 120,
                color: const Color(0xFF0C40D4),
                alignment: Alignment.center,
                child: const Text(
                  'Powered by:XYZ COM',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
            ),
          ),

          // Center logo and text
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 70,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage('asset/Adobe Express - file.png'),
                ),
                const SizedBox(height: 20),
                const Text(
                  'SCHOOL MANAGEMENT',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0C40D4),
                    letterSpacing: 1,
                  ),
                ),
                const Text(
                  'MANAGEMENT SYSTEM',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF2AC9A0),
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Custom top curve clipper
class TopCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width, 0);
    path.quadraticBezierTo(size.width * 0.8, size.height * 0.8, 0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

// Custom bottom curve clipper
class BottomCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, 0);
    path.quadraticBezierTo(size.width / 2, size.height * 2, size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
