import 'package:flutter/material.dart';

class FiltersWidget extends StatefulWidget {
  final Function(Map<String, dynamic>) onApplyFilters;

  const FiltersWidget({Key? key, required this.onApplyFilters}) : super(key: key);

  @override
  _FiltersWidgetState createState() => _FiltersWidgetState();
}

class _FiltersWidgetState extends State<FiltersWidget> {
  String? searchQuery;
  String? selectedJobType;
  String? selectedLocation;
  bool isRemote = false;

  final List<String> jobTypes = ['Full-time', 'Part-time', 'Freelance'];
  final List<String> locations = ['New York', 'San Francisco', 'Remote'];

  // Reset the filters to their default values
  void _clearFilters() {
    setState(() {
      searchQuery = null;
      selectedJobType = null;
      selectedLocation = null;
      isRemote = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Filter Options',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),

          // Search TextField
          TextField(
            decoration: const InputDecoration(
              labelText: 'Search',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.search),
            ),
            onChanged: (value) {
              setState(() {
                searchQuery = value;
              });
            },
          ),
          const SizedBox(height: 20),

          // Job Type Dropdown
          DropdownButtonFormField<String>(
            value: selectedJobType,
            decoration: const InputDecoration(labelText: 'Job Type'),
            items: jobTypes.map((type) {
              return DropdownMenuItem<String>(
                value: type,
                child: Text(type),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                selectedJobType = value;
              });
            },
          ),
          const SizedBox(height: 20),

          // Location Dropdown
          DropdownButtonFormField<String>(
            value: selectedLocation,
            decoration: const InputDecoration(labelText: 'Location'),
            items: locations.map((location) {
              return DropdownMenuItem<String>(
                value: location,
                child: Text(location),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                selectedLocation = value;
              });
            },
          ),
          const SizedBox(height: 20),

          // Remote Checkbox
          CheckboxListTile(
            title: const Text('Remote'),
            value: isRemote,
            onChanged: (value) {
              setState(() {
                isRemote = value!;
              });
            },
          ),
          const SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Clear Filters Button
              TextButton(
                onPressed: _clearFilters,
                child: const Text('Clear Filters'),
              ),
              // Apply Filters Button
              ElevatedButton(
                onPressed: () {
                  widget.onApplyFilters({
                    'searchQuery': searchQuery,
                    'jobType': selectedJobType,
                    'location': selectedLocation,
                    'isRemote': isRemote,
                  });
                  Navigator.pop(context);
                },
                child: const Text('Apply Filters'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
