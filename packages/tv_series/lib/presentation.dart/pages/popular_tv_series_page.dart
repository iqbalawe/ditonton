import 'package:flutter/material.dart';

class PopularTVSeriesPage extends StatefulWidget {
  const PopularTVSeriesPage({super.key});

  @override
  State<PopularTVSeriesPage> createState() => _PopularTVSeriesPageState();
}

class _PopularTVSeriesPageState extends State<PopularTVSeriesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Popular TV Series')),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: SizedBox.shrink(),
      ),
    );
  }
}
