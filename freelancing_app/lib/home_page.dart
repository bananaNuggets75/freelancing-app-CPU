import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> workTypes = ['Web Developer', 'Math Tutoring', 'Graphic Design', 'Writing'];
  List<String> selectedWorkTypes = [];

  void _openFilterDrawer() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return _buildFilterDrawer(setState);
          },
        );
      },
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
    );
  }

  Widget _buildFilterDrawer(StateSetter setModalState) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Filter',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          const Text(
            'Select Work Types',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          Expanded(
            child: ListView(
              children: workTypes.map((workType) {
                return CheckboxListTile(
                  title: Text(workType),
                  value: selectedWorkTypes.contains(workType),
                  onChanged: (bool? value) {
                    setModalState(() {
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
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  setModalState(() {
                    selectedWorkTypes.clear();
                  });
                  Navigator.of(context).pop();
                },
                child: const Text('Clear Filters', style: TextStyle(color: Colors.orange)),
              ),
              ElevatedButton(
                onPressed: () {
                  print('Selected Work Types: $selectedWorkTypes');
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                child: const Text('Apply'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HireMe'),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_alt),
            onPressed: _openFilterDrawer,
          ),
        ],
      ),
      body: Center(
        child: const Text('Welcome to Home Page'),
      ),
    );
  }
}
