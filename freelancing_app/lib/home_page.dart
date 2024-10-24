import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> workTypes = ['Web Developer', 'Math Tutoring', 'Graphic Design', 'Writing'];

  List<String> selectedWorkTypes = [];

  void _showWorkTypeFilterDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Work Types'),
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return SingleChildScrollView(
                child: ListBody(
                  children: workTypes.map((workType) {
                    return CheckboxListTile(
                      title: Text(workType),
                      value: selectedWorkTypes.contains(workType),
                      onChanged: (bool? value) {
                        setState(() {
                          if (value == true) {
                            selectedWorkTypes.add(workType);
                          } else {
                            selectedWorkTypes.remove(workType);
                          }
                        });
                      },
                    );
                  }).toList(),
                ),
              );
            },
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: const Text('Apply Filters'),
              onPressed: () {
                Navigator.of(context).pop();
                print('Selected Work Types: $selectedWorkTypes');
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HireMe'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text('Welcome to Home Page'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _showWorkTypeFilterDialog,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
                backgroundColor: Colors.blueAccent,
              ),
              child: const Text(
                'Filter Work Types',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
