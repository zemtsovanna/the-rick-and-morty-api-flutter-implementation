import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class PersonsScreen extends StatefulWidget {
  static const String routName = 'MyHomeScreen';
  const PersonsScreen({Key? key}) : super(key: key);

  @override
  State<PersonsScreen> createState() => _PersonsScreenState();
}

class _PersonsScreenState extends State<PersonsScreen> {
  List persons = [];

  void _getPersons() async {
    debugPrint('Получаем список персонажей');
    final response =
        await Dio().get('https://rickandmortyapi.com/api/character');
    setState(() {
      persons = response.data['results'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Persons'),
        actions: [
          IconButton(onPressed: _onClearList, icon: const Icon(Icons.clear))
        ],
      ),
      // TODO: add empty list state. Something like 'press button to load persons'
      body: ListView.builder(
        itemCount: persons.length,
        itemBuilder: _buildPersonCard,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getPersons,
        backgroundColor: Colors.black,
        child: const Icon(Icons.download_outlined),
      ),
    );
  }

  void _onClearList() {
    setState(() {
      persons.clear();
    });
  }

  Widget _buildPersonCard(_, index) {
    final name = persons[index]['name'];
    final imageUrl = persons[index]['image'];
    final status = persons[index]['status'];
    final species = persons[index]['species'];
    final gender = persons[index]['gender'];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: Row(
        children: [
          Expanded(
            child: AspectRatio(
              aspectRatio: 1,
              child: Image.network(
                imageUrl,
                loadingBuilder: _imageLoadingBuilder,
                //  TODO: Add error builder
              ),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              Text(
                status,
                style: const TextStyle(fontSize: 17),
              ),
              Text(
                species,
                style: const TextStyle(fontSize: 17),
              ),
              Text(
                gender,
                style: const TextStyle(fontSize: 17),
              ),
            ],
          )),
        ],
      ),
    );
  }

  Widget _imageLoadingBuilder(_, child, loadingProgress) =>
      loadingProgress == null
          ? child
          : const Center(
              child: CircularProgressIndicator(),
            );
}
