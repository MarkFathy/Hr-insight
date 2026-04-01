import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  final Function(String?) onChanged;
  final String hint;
  const SearchField({super.key, required this.onChanged, required this.hint});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
          onChanged: onChanged,
          decoration: InputDecoration(
            suffixIcon: const Icon(Icons.search),
            // contentPadding: EdgeInsets.zero,
            hintText: hint,
            // contentPadding: const EdgeInsets.symmetric(horizontal: 18),
            border: InputBorder.none,
          )),
    );
  }
}
