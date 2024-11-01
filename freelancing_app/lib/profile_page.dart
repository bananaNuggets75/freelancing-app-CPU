import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Header
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/profile_pic.png'), // Replace with your profile image asset
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Kenan Ben',
                      style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'bananaNuggets75',
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Komsaiyan student from Central Philippine University.\nLoves Red Bull and coding.',
                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 24),

            // Achievements Section
            Text(
              'Achievements',
              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.star, color: Colors.yellow, size: 36),
                SizedBox(width: 8),
                Icon(Icons.emoji_events, color: Colors.orange, size: 36),
              ],
            ),
            SizedBox(height: 24),

            // Languages, Tools, and Frameworks Section
            Text(
              'Languages, Tools and Frameworks',
              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                Icon(Icons.code, color: Colors.blue, size: 36),
                Icon(Icons.android, color: Colors.green, size: 36),
                Icon(Icons.web, color: Colors.blueGrey, size: 36),
                Icon(Icons.computer, color: Colors.purple, size: 36),
              ],
            ),
            SizedBox(height: 24),

            // Now Playing Section
            Text(
              'Now Playing 🎧',
              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Icon(Icons.music_note, color: Colors.greenAccent),
                  SizedBox(width: 8),
                  Text('Simple Plan - I\'d Do Anything', style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
            SizedBox(height: 24),

            // Pinned Projects Section
            Text(
              'Pinned Projects',
              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: 4, // Number of pinned projects
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[850],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Project ${index + 1}',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Project description goes here...',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ],
                  ),
                );
              },
            ),
            SizedBox(height: 24),

            // Contribution Graph Placeholder
            Text(
              'Contribution Graph',
              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Container(
              height: 100,
              color: Colors.grey[900],
              child: Center(
                child: Text(
                  'Contribution graph placeholder',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
