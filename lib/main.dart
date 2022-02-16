import 'package:flutter/material.dart';
import 'package:my_rick_and_mortey/episodes_screen.dart';
import 'package:my_rick_and_mortey/persons_screen.dart';

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
        appBarTheme: const AppBarTheme(color: Colors.black),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.black,
        ),
        primarySwatch: Colors.blue,
      ),
      initialRoute: HomeScreen.routName,
      routes: {
        HomeScreen.routName: (context) => const HomeScreen(),
        PersonsScreen.routName: (context) => const PersonsScreen(),
        EpisodesScreen.routName: (context) => const EpisodesScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  static const String routName = 'HomeScreen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rick and Morty'),
      ),
      body: ListView(
        children: [
          ListTile(
            onTap: () =>
                Navigator.of(context).pushNamed(PersonsScreen.routName),
            leading: const Icon(Icons.face),
            title: const Text('Persons'),
            subtitle: const Text('Tap to go on screen with list of persons'),
          ),
          ListTile(
            onTap: () =>
                Navigator.of(context).pushNamed(EpisodesScreen.routName),
            leading: const Icon(Icons.movie),
            title: const Text('Episodes'),
            subtitle: const Text('Tap to go on screen with list of episodes'),
          ),
        ],
      ),
    );
  }
}
