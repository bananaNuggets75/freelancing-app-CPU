import 'package:flutter/material.dart';
import 'package:freelancing_app/search/filters_widget.dart';

class FreelancerPage extends StatefulWidget {
  @override
  _FreelancerPageState createState() => _FreelancerPageState();
}

class _FreelancerPageState extends State<FreelancerPage> {
  // List of freelancers
  final List<Freelancer> freelancers = [
    Freelancer("Alice", "Part-time Web Developer", "\$20/hr", "100% Job Success", ["Flutter", "Dart"], true, "Part-time", "San Francisco", true),
    Freelancer("Bob", "Graphic Designer", "\$25/hr", "95% Job Success", ["Photoshop", "Illustrator"], false, "Freelance", "Remote", true),
    Freelancer("Charlie", "Full-time Data Scientist", "\$30/hr", "90% Job Success", ["Python", "Machine Learning"], false, "Full-time", "New York", false),
    // Add more freelancers as needed
  ];

  List<Freelancer> filteredFreelancers = [];
  String? searchQuery;
  String? selectedJobType;
  String? selectedLocation;
  bool isRemote = false;

  @override
  void initState() {
    super.initState();
    filteredFreelancers = freelancers; // Initially show all freelancers
  }

  void _applyFilters(Map<String, dynamic> filters) {
    setState(() {
      searchQuery = filters['searchQuery'];
      selectedJobType = filters['jobType'];
      selectedLocation = filters['location'];
      isRemote = filters['isRemote'];

      // Filtering logic
      filteredFreelancers = freelancers.where((freelancer) {
        bool matchesQuery = searchQuery == null || freelancer.name.toLowerCase().contains(searchQuery!.toLowerCase());
        bool matchesJobType = selectedJobType == null || freelancer.jobType.toLowerCase().contains(selectedJobType!.toLowerCase());
        bool matchesLocation = selectedLocation == null || freelancer.location == selectedLocation;
        bool matchesRemote = !isRemote || freelancer.isRemote;

        return matchesQuery && matchesJobType && matchesLocation && matchesRemote;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Freelancers"),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return FiltersWidget(onApplyFilters: _applyFilters);
                },
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: filteredFreelancers.length,
                itemBuilder: (context, index) {
                  final freelancer = filteredFreelancers[index];
                  return FreelancerCard(
                    name: freelancer.name,
                    role: freelancer.role,
                    rate: freelancer.rate,
                    jobSuccess: freelancer.jobSuccess,
                    skills: freelancer.skills,
                    availableNow: freelancer.availableNow,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Freelancer {
  final String name;
  final String role;
  final String rate;
  final String jobSuccess;
  final List<String> skills;
  final bool availableNow;
  final String jobType; // New property for job type
  final String location; // New property for location
  final bool isRemote; // New property for remote status

  Freelancer(this.name, this.role, this.rate, this.jobSuccess, this.skills, this.availableNow, this.jobType, this.location, this.isRemote);
}

class FreelancerCard extends StatelessWidget {
  final String name;
  final String role;
  final String rate;
  final String jobSuccess;
  final List<String> skills;
  final bool availableNow;

  FreelancerCard({
    required this.name,
    required this.role,
    required this.rate,
    required this.jobSuccess,
    required this.skills,
    this.availableNow = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Text(role),
            SizedBox(height: 8),
            Row(
              children: [
                Text(rate, style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(width: 8),
                Text(jobSuccess),
                if (availableNow)
                  Row(
                    children: [
                      SizedBox(width: 8),
                      Icon(Icons.flash_on, color: Colors.blue, size: 16),
                      Text("Available now"),
                    ],
                  ),
              ],
            ),
            SizedBox(height: 8),
            Wrap(
              spacing: 6.0,
              runSpacing: -8.0,
              children: skills.map((skill) => Chip(
                label: Text(skill),
                backgroundColor: Colors.grey[200],
              )).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
