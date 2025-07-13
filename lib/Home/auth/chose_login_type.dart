import 'package:flutter/material.dart';
import 'package:school_magmenet_app/Home/auth/login.dart';

class RoleSelectionScreen extends StatefulWidget {
  const RoleSelectionScreen({super.key});

  @override
  State<RoleSelectionScreen> createState() => _RoleSelectionScreenState();
}

class _RoleSelectionScreenState extends State<RoleSelectionScreen> {
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
              height: 200,
              color: const Color(0xFF2AC9A0),
              alignment: Alignment.center,
              child: const CircleAvatar(
                radius: 55,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage(
                  'assets/adobe_express_file.png',
                ), //  Correct path
              ),
            ),
          ),

          const SizedBox(height: 50),

          const Text(
            'Choose your option',
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFF0C40D4),
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 30),

          // Student and Teacher buttons
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                RoleButton(
                  icon: Icons.school,
                  label: 'Student',
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  },
                ),
                RoleButton(
                  icon: Icons.person_outline,
                  label: 'Teacher',
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),

          const SizedBox(height: 30),

          RoleButton(
            icon: Icons.person,
            label: 'Parents',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            },
          ),

          const SizedBox(height: 30),

          // Guest button
        ],
      ),
    );
  }
}

// Role button widget
class RoleButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const RoleButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: const Color(0xFF0C40D4),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, size: 40, color: Colors.white),
          ),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(color: Colors.black)),
      ],
    );
  }
}

// Top curve clipper
class TopCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 60);
    path.quadraticBezierTo(
      size.width / 2,
      size.height + 40,
      size.width,
      size.height - 60,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
