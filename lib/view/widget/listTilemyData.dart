import 'package:flutter/material.dart';

class ListTileMyData extends StatelessWidget {
  const ListTileMyData(
      {Key? key, required this.name, required this.icon, required this.title})
      : super(key: key);

  final String name;
  final String title;

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      color: Colors.white,
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(
              fontSize: 18, color: Colors.black),
        ),
        subtitle: Text(name),
        leading: Icon(icon),
      ),
    );
  }
}
