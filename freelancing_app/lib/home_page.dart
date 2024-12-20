import 'package:flutter/material.dart';
import 'package:freelancing_app/freelancer_page.dart';
import 'package:freelancing_app/search/filters_widget.dart';
import 'profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  String _discoverySearchQuery = ''; 
  String _searchPageQuery = '';

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _getSelectedPage() {
    switch (_selectedIndex) {
      case 0:
        return _buildDiscoveryPage();
      case 1:
        return FreelancerPage();
      case 2:
        return Center(child: Text('Nearby Page'));
      case 3:
        return _buildSearchPage();
      case 4:
        return ProfilePage();
      default:
        return Center(child: Text('Discovery Page'));
    }
  }

  Widget _buildDiscoveryPage() {
    return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      itemCount: 10, // Number of posts to display
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.teal,
                      child: Icon(Icons.person, color: Colors.white),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "Freelancer ${index + 1}",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  "This is a sample post description for discovery feed item ${index + 1}.",
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.thumb_up_alt_outlined),
                    Icon(Icons.comment_outlined),
                    Icon(Icons.share_outlined),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }


  Widget _buildSearchPage() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search anything...',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.search),
            ),
            onChanged: (value) {
              setState(() {
                _searchPageQuery = value;
              });
            },
          ),
        ),
        Expanded(
          child: Center(
            child: Text(
              'Search Page Results for: "$_searchPageQuery"',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HireMe'),
        backgroundColor: Colors.teal,
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_alt),
            onPressed: () {
              _openFilterDialog();
            },
          ),
        ],
      ),
      body: _getSelectedPage(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Discovery',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.work),
            label: 'Freelancers',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            label: 'Nearby',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Me',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }

  // Method to open filter dialog
  void _openFilterDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: FiltersWidget(
            onApplyFilters: (filters) {
              print("Applied Filters: $filters");
            },
          ),
        );
      },
    );
  }
}
