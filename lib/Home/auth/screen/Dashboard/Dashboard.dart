import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:school_magmenet_app/Home/auth/screen/totalDueFees.dart';
import 'package:school_magmenet_app/Home/auth/screen/totalcollrctedFees.dart';
import 'package:school_magmenet_app/Home/auth/screen/totalstudents.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final int paidStudents = 75;
  final int unpaidStudents = 25;

  String getGreetingMessage() {
    final hour = DateTime.now().hour;
    if (hour < 12) return 'Good Morning';
    if (hour < 17) return 'Good Afternoon';
    return 'Good Evening';
  }

  String getFormattedDateTime() {
    final now = DateTime.now();
    return '${now.day}/${now.month}/${now.year} - '
        '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final greeting = getGreetingMessage();
    final dateTime = getFormattedDateTime();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        backgroundColor: const Color(0xFF2AC9A0),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 20),

              // Greeting & Date
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      greeting,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Today: $dateTime',
                      style: const TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ],
                ),
              ),

              // Total Students
              Card(
                margin: const EdgeInsets.all(16.0),
                child: ListTile(
                  leading: const Icon(
                    Icons.person,
                    size: 40,
                    color: Color(0xFF2AC9A0),
                  ),
                  title: const Text(
                    'Total Students',
                    style: TextStyle(fontSize: 20),
                  ),
                  trailing: Text(
                    '${paidStudents + unpaidStudents}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StudentListScreen(),
                      ),
                    );
                  },
                ),
              ),

              // Total Collected Fees
              Card(
                margin: const EdgeInsets.all(16.0),
                child: ListTile(
                  leading: const Icon(
                    Icons.money,
                    size: 40,
                    color: Color(0xFF2AC9A0),
                  ),
                  title: const Text(
                    'Total Collected Fees',
                    style: TextStyle(fontSize: 20),
                  ),
                  trailing: const Text(
                    '75,000',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TotalCollectedFees(),
                      ),
                    );
                  },
                ),
              ),

              // Total Due Fees
              Card(
                margin: const EdgeInsets.all(16.0),
                child: ListTile(
                  leading: const Icon(
                    Icons.attach_money,
                    size: 40,
                    color: Color(0xFF2AC9A0),
                  ),
                  title: const Text(
                    'Total Due Fees',
                    style: TextStyle(fontSize: 20),
                  ),
                  trailing: const Text(
                    '25,000',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TotalDueFees(),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 20),

              // Pie Chart
              const Text(
                'Fee Status (Paid vs Unpaid)',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 220,
                child: PieChart(
                  PieChartData(
                    sectionsSpace: 3,
                    centerSpaceRadius: 40,
                    sections: [
                      PieChartSectionData(
                        value: paidStudents.toDouble(),
                        color: Colors.green,
                        title: '$paidStudents Paid',
                        radius: 60,
                        titleStyle: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      PieChartSectionData(
                        value: unpaidStudents.toDouble(),
                        color: Colors.red,
                        title: '$unpaidStudents Unpaid',
                        radius: 60,
                        titleStyle: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
