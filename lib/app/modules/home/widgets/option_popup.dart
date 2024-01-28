import 'package:flutter/material.dart';

class EditDeleteBottomSheet extends StatelessWidget {
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const EditDeleteBottomSheet({
    Key? key,
    required this.onEdit,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedButton(
            onPressed: onEdit,
            child: Text('Edit'),
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: onDelete,
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: Text('Delete'),
          ),
        ],
      ),
    );
  }
}
