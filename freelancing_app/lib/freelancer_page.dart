import 'package:flutter/material.dart';

class FreelancerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Freelancers"),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Add search functionality
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Category Filter Chips
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  FilterChipWidget("Popular"),
                  FilterChipWidget("Graphic Design"),
                  FilterChipWidget("Web Dev"),
                  FilterChipWidget("AI & ML"),
                  // Add more categories as needed
                ],
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: 10, // replace with actual freelancer count
                itemBuilder: (context, index) {
                  return FreelancerCard(
                    name: "Freelancer Name",
                    role: "Specialization or title",
                    rate: "\$20/hr",
                    jobSuccess: "100% Job Success",
                    skills: ["Skill1", "Skill2", "Skill3"],
                    availableNow: index % 2 == 0, // Toggle for demonstration
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

class FilterChipWidget extends StatelessWidget {
  final String label;
  FilterChipWidget(this.label);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Chip(
        label: Text(label),
        backgroundColor: Colors.grey[200],
      ),
    );
  }
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
              children: skills
                  .map((skill) => Chip(
                label: Text(skill),
                backgroundColor: Colors.grey[200],
              ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
