import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:explorease/dashbard.dart';

void main() {
  testWidgets('DashboardPage displays Quick Access buttons',
      (WidgetTester tester) async {
    // Build the widget
    await tester.pumpWidget(MaterialApp(home: DashboardPage()));

    // Verify the presence of Quick Access buttons
    expect(find.text('Map'), findsOneWidget);
    expect(find.text('Booking'), findsOneWidget);
    expect(find.text('Itinerary'), findsOneWidget);
    expect(find.text('Community'), findsOneWidget);
    expect(find.text('Account'), findsOneWidget);

    // Tap on a button and verify navigation or action
    await tester.tap(find.text('Map'));
    await tester.pump(); // Rebuild the widget after the tap
    // TODO: Add assertions for navigation or action
  });
}

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: GridView.builder(
        shrinkWrap: true,
        itemCount: categories.length,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, // Ensure 4 items per row
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 0.8,
        ),
        itemBuilder: (context, index) {
          final item = categories[index];
          return Column(
            children: [
              CircleAvatar(
                radius: 28, // Adjust size for better visibility
                backgroundColor: Colors.blue.shade100,
                child: Icon(item['icon'], color: Colors.blue, size: 24), // Ensure icon size
              ),
              SizedBox(height: 8),
              Text(
                item['label'],
                style: TextStyle(fontSize: 12),
                textAlign: TextAlign.center,
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildQuickAccessItem(
      String title, IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: Colors.blue.shade100, // Light background
            child: Icon(icon, color: Colors.blue, size: 24), // Dark icon color
          ),
          SizedBox(height: 8),
          Text(title),
        ],
      ),
    );
  }
}

final List<Map<String, dynamic>> categories = [
  {'label': 'Map', 'icon': Icons.map},
  {'label': 'Booking', 'icon': Icons.book},
  {'label': 'Itinerary', 'icon': Icons.schedule},
  {'label': 'Community', 'icon': Icons.group},
  {'label': 'Account', 'icon': Icons.person},
];
