import 'package:flutter/material.dart';
import 'package:school_magmenet_app/Home/auth/screen/Dashboard/Dashboard.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Top curved header with logo
          ClipPath(
            clipper: TopCurveClipper(),
            child: Container(
              height: 220,
              color: const Color(0xFF2AC9A0),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 55,

                    backgroundImage: AssetImage(
                      'asset/Adobe Express - file.png',
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ),

          const SizedBox(height: 30),

          // Username field
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Username',
                hintText: 'User Name',
                prefixIcon: const Icon(Icons.person, color: Colors.blue),
                border: const UnderlineInputBorder(),
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Password field
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: const Icon(Icons.lock_outline),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.visibility_off, color: Colors.blue),
                  onPressed: () {},
                ),
                border: const UnderlineInputBorder(),
              ),
            ),
          ),

          const SizedBox(height: 40),

          // Login button
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0C40D4), // Button blue
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Dashboard()),
                  );
                },
                child: const Text(
                  'Login',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Forgot password
        ],
      ),
    );
  }
}

// Clipper for the top rounded shape
class TopCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height - 80,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
