import 'package:flutter/material.dart';

class SortBottomSheet extends StatelessWidget {
  const SortBottomSheet({
    super.key,
    required this.currentSort,
    required this.onSortChanged,
  });

  final String currentSort;
  final void Function(String?) onSortChanged;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        textTheme: Theme.of(context).textTheme.copyWith(
          titleMedium: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Text(
              'Sort',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
          ),

          RadioListTile<String>(
            title: const Text('All'),
            value: 'All',
            groupValue: currentSort,
            activeColor: Colors.blue,
            onChanged: (value) {
              onSortChanged(value);
              Navigator.pop(context);
            },
          ),

          RadioListTile<String>(
            title: const Text('Age: Elder'),
            value: 'Age: Elder',
            groupValue: currentSort,
            activeColor: Colors.blue,
            onChanged: (value) {
              onSortChanged(value);
              Navigator.pop(context);
            },
          ),

          RadioListTile<String>(
            title: const Text('Age: Older'),
            value: 'Age: Older',
            groupValue: currentSort,
            activeColor: Colors.blue,
            onChanged: (value) {
              onSortChanged(value);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
