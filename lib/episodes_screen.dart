import 'package:flutter/material.dart';

class EpisodesScreen extends StatefulWidget {
  static const String routName = 'EpisodesScreen';
  const EpisodesScreen({Key? key}) : super(key: key);

  @override
  State<EpisodesScreen> createState() => _EpisodesScreenState();
}

class _EpisodesScreenState extends State<EpisodesScreen> {
  void _getEpisodes() {
    // TODO(Zemtsova): *implement loading logic
    // Hint: use a debug mode and breakpoints to testing your function
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Episodes'),
        actions: [
          IconButton(
            icon: const Icon(Icons.clear),
            onPressed: _getEpisodes,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getEpisodes,
        child: const Icon(Icons.download_outlined),
      ),
      // TODO: add ListView.builder to show list of episodes
      body: const Center(child: Text('Episodes list will be soon')),
    );
  }
}
