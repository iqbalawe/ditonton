import 'package:flutter/material.dart';

class ItemList extends StatelessWidget {
  const ItemList({
    required this.itemBuilder,
    required this.itemCount,
    super.key,
  });

  final Widget? Function(BuildContext, int) itemBuilder;
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: itemBuilder,
        itemCount: itemCount,
      ),
    );
  }
}
