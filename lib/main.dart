import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List persons = [];

  void _getPersons() async {
    print('Получаем список персонажей');
    final responce =
        await Dio().get('https://rickandmortyapi.com/api/character');
    setState(() {
      persons = responce.data['results'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(widget.title),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  persons.clear();
                });
              },
              icon: const Icon(Icons.clear))
        ],
      ),
      body: ListView.builder(
        itemCount: persons.length,
        itemBuilder: _buildPersonCard,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getPersons,
        tooltip: 'Increment',
        backgroundColor: Colors.black,
        child: const Icon(Icons.add),
      ),
    );
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
          Expanded(child: Image.network(imageUrl)),
          SizedBox(
            width: 8,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text(
                status,
                style: TextStyle(fontSize: 17),
              ),
              Text(
                species,
                style: TextStyle(fontSize: 17),
              ),
              Text(
                gender,
                style: TextStyle(fontSize: 17),
              ),
            ],
          )),
        ],
      ),
    );
  }
}
