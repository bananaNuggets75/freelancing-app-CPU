import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/profile_image.png'),
                ),
                SizedBox(height: 10),
                Text(
                  'Kenan Ben',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Freelance Developer',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30),
          Text(
            'GitHub Profile',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.code),
            title: Text('Username: bananaNuggets75'),
            trailing: Icon(Icons.link),
            onTap: () {
              // pass
            },
          ),
          SizedBox(height: 20),
          Text(
            'Repositories',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.folder),
            title: Text('Project Alpha'),
            trailing: Icon(Icons.link),
            onTap: () {
              // pass
            },
          ),
          ListTile(
            leading: Icon(Icons.folder),
            title: Text('Flutter App'),
            trailing: Icon(Icons.link),
            onTap: () {
              // pass
            },
          ),
          ListTile(
            leading: Icon(Icons.folder),
            title: Text('Portfolio Website'),
            trailing: Icon(Icons.link),
            onTap: () {
              // pass
            },
          ),
        ],
      ),
    );
  }
}
