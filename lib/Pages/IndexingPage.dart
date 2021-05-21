import 'package:flutter/material.dart';

class IndexingPage extends StatelessWidget {
  static const String route = "indexing";
  final Function() whileIndexing;
  const IndexingPage({Key? key, required this.whileIndexing}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    this.whileIndexing();
    return Container();
  }
}
