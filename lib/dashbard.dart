import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeContent(),
    Center(child: Text("Map Page")),
    Center(child: Text("Booking Page")),
    Center(child: Text("Profile Page")), // Ensure Profile Page is implemented
  ];

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onTabTapped,
        selectedItemColor: Colors.blue[700],
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Map'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Booking'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  final List<Map<String, dynamic>> categories = [
    {'icon': Icons.account_balance, 'label': 'Historical'},
    {'icon': Icons.terrain, 'label': 'Nature'},

    {'icon': Icons.pool, 'label': 'Swimming'},
    {'icon': Icons.scuba_diving, 'label': 'Diving'},
    // Add Account here
  ];

  final List<Map<String, dynamic>> cities = [
    {'name': 'Hargeisa', 'image': 'asset/image/hargeisa.jpeg'},
    {
      'name': 'Gabiley',
      'image': 'https://via.placeholder.com/100x100?text=Gabiley'
    },
    {'name': 'Borama', 'image': 'asset/image/borama.jpeg'},
    {'name': 'Burco', 'image': 'asset/image/burco.jpeg'},
    {'name': 'Cerigabo', 'image': 'asset/image/cerigabo.jpeg'},
  ];

  final List<Map<String, dynamic>> activityFilters = [
    {'icon': Icons.pool, 'label': 'Swimming'},
    {'icon': Icons.directions_bike, 'label': 'Cycling'},
    {'icon': Icons.hiking, 'label': 'Hiking'},
    {'icon': Icons.kayaking, 'label': 'Kayaking'},
  ];

  final Map<String, dynamic> mainActivity = {
    'name': 'Sahil Beach',
    'location': 'Berbera, Somaliland',
    'image': 'https://via.placeholder.com/600x400?text=Sahil+Beach',
  };

  final List<String> smallActivityImages = [
    'https://via.placeholder.com/100x100?text=A1',
    'https://via.placeholder.com/100x100?text=A2',
    'https://via.placeholder.com/100x100?text=A3',
    'https://via.placeholder.com/100x100?text=A4',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 28,
                backgroundColor: Colors.blue,
                child: Icon(Icons.person, color: Colors.white, size: 32),
              ),
              SizedBox(width: 16),
              Text(
                'Hello, Traveler!',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[900],
                ),
              ),
            ],
          ),
          SizedBox(height: 24),

          // Search bar
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                    color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
              ],
            ),
            child: TextField(
              decoration: InputDecoration(
                icon: Icon(Icons.search),
                hintText: 'Where do you want to go?',
                border: InputBorder.none,
              ),
            ),
          ),
          SizedBox(height: 24),

          // Categories
          Text('CATEGORIES',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 12),
          GridView.builder(
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
                    backgroundColor: Colors.blue.shade100, // Light background
                    child: Icon(item['icon'],
                        color: Colors.blue, size: 24), // Dark icon color
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
          SizedBox(height: 24),

          // Popular Cities
          Text('POPULAR CITIES',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 12),
          SizedBox(
            height: 100,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: cities.length,
              separatorBuilder: (_, __) => SizedBox(width: 16),
              itemBuilder: (context, index) {
                final city = cities[index];
                final imageProvider = city['image'].startsWith('asset/')
                    ? AssetImage(city['image'])
                    : NetworkImage(city['image']) as ImageProvider;

                return Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [Colors.blueAccent, Colors.lightBlueAccent],
                        ),
                      ),
                      child: CircleAvatar(
                        radius: 32,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 28,
                          backgroundImage: imageProvider,
                          onBackgroundImageError: (_, __) {
                            print("Couldn't load image: ${city['image']}");
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(city['name'], style: TextStyle(fontSize: 13)),
                  ],
                );
              },
            ),
          ),
          SizedBox(height: 24),

          // Activity Filters
          Text('BEST ACTIVITIES',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 12),
          SizedBox(
            height: 40,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: activityFilters.length,
              separatorBuilder: (context, index) => SizedBox(width: 10),
              itemBuilder: (context, index) {
                final filter = activityFilters[index];
                final isSelected = index == 0;
                return ChoiceChip(
                  label: Text(filter['label']),
                  avatar: Icon(filter['icon']),
                  selected: isSelected,
                  selectedColor: Colors.blue.shade600,
                  onSelected: (_) {},
                  labelStyle: TextStyle(
                    color: isSelected ? Colors.white : Colors.blue.shade800,
                    fontWeight: FontWeight.w600,
                  ),
                  backgroundColor: Colors.blue.shade100,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(
                        color: isSelected ? Colors.blue : Colors.blue.shade200),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 16),

          // Main + Small Activities
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: NetworkImage(mainActivity['image']),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, Colors.black54],
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(mainActivity['name'],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold)),
                            Text(mainActivity['location'],
                                style: TextStyle(
                                    color: Colors.white70, fontSize: 14)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                flex: 1,
                child: Column(
                  children: smallActivityImages.map((imgUrl) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 8),
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: NetworkImage(imgUrl), fit: BoxFit.cover),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
          SizedBox(height: 24),
        ],
      ),
    );
  }
}
