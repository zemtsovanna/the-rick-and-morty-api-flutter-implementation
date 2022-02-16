import 'package:flutter/material.dart';

class EpisodesScreen extends StatefulWidget {
  static const String routName = 'EpisodesScreen';
  const EpisodesScreen({Key? key}) : super(key: key);

  @override
  State<EpisodesScreen> createState() => _EpisodesScreenState();
}

class _EpisodesScreenState extends State<EpisodesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Episodes'),
        actions: [
          IconButton(
            icon: Icon(Icons.clear),
            onPressed: () {
              //  TODO: implement clear logic
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: implement loading logic
        },
        child: Icon(Icons.download_outlined),
      ),
      body: const Center(child: Text('Episodes list will be soon')),
    );
  }
}
