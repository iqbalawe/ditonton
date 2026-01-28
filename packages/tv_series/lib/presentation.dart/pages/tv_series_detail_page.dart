import 'package:flutter/material.dart';

class TVSeriesDetailPage extends StatefulWidget {
  final int id;
  const TVSeriesDetailPage({super.key, required this.id});

  @override
  State<TVSeriesDetailPage> createState() => _TVSeriesDetailPageState();
}

class _TVSeriesDetailPageState extends State<TVSeriesDetailPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SizedBox.shrink());
  }
}
