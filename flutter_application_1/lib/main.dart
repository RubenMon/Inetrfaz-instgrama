import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/Ejercicio1.dart';
import 'package:flutter_application_1/Screens/Ejercicio2.dart';
import 'package:flutter_application_1/Screens/Ejercicio3.dart';
import 'package:flutter_application_1/Screens/Ejercicio4.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Material App',
      home: InstagramProfile(), // InstagramProfile es la pantalla principal
    );
  }
}

class InstagramProfile extends StatelessWidget {
  const InstagramProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('cristiano'),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openEndDrawer(); // Abrir el Drawer desde el botón
            },
          ),
        ],
      ),
      endDrawer: const MenuLateral(), // Drawer en la parte derecha
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                // Profile section
                const Row(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('assets/images/cristiano1.jpg'),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            '3767 ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text('Publicacio...'),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            '641 M',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text('Seguidores'),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            '584',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text('Seguidos'),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                // Bio section
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Cristiano Rinaldo\n¡SIUUUbscribe to my Youtube Channel!',
                    style: TextStyle(fontWeight: FontWeight.w400),
                  ),
                ),
                const SizedBox(height: 10),
                // Story Highlights
                // Usando un Row con MainAxisAlignment.center para centrar las historias
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    StoryHighlight(image: 'assets/images/cristiano0.jpg', label: 'Pilotando'),
                    SizedBox(width: 50),
                    StoryHighlight(image: 'assets/images/cristiano1.jpg', label: 'Praga'),
                    SizedBox(width: 50),
                    StoryHighlight(image: 'assets/images/cristiano2.jpg', label: 'Arquitectura'),
                    SizedBox(width: 50),
                    StoryHighlight(image: 'assets/images/cristiano3.jpg', label: 'Lisboa'),
                    SizedBox(width: 50),
                    StoryHighlight(image: 'assets/images/cristiano4.jpg', label: 'Málaga'),
                    SizedBox(width: 50),
                    StoryHighlight(image: 'assets/images/cristiano5.jpg', label: 'Marbella'),
                  ],
                ),
                const SizedBox(height: 10),
                // Icon section
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.grid_on), // Ícono de cuadrícula
                    Icon(Icons.person_outline), // Ícono de perfil/persona
                  ],
                ),
                const SizedBox(height: 10),
                // Grid of posts
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 4,
                    mainAxisSpacing: 4,
                  ),
                  itemCount: 9,
                  itemBuilder: (context, index) {
                    return Image.asset('assets/images/cristiano$index.jpg', fit: BoxFit.cover);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Widget para los destacados de historias
class StoryHighlight extends StatelessWidget {
  final String image;
  final String label;

  const StoryHighlight({super.key, required this.image, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(image),
        ),
        Text(label),
      ],
    );
  }
}

class MenuLateral extends StatelessWidget {
  const MenuLateral({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          const UserAccountsDrawerHeader(
            accountName: Text("Rubén Montero Martín"),
            accountEmail: Text("rmonmar0810@g.educaand.es"),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/malaga2.jpg"),
                    fit: BoxFit.cover)),
          ),
          Ink(
            color: const Color.fromARGB(255, 234, 128, 22),
            child: ListTile(
              title: const Text(
                "Ejercicio 1",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => const Ejercicio1()));
              },
            ),
          ),
          ListTile(
            title: const Text("Ejercicio 2"),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => const Ejercicio2()));
            },
          ),
          ListTile(
            title: const Text("Ejercicio 3"),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => const Ejercicio3()));
            },
          ),
          ListTile(
            title: const Text("Ejercicio 4"),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => const Ejercicio4()));
            },
          ),
          ListTile(
            title: const Text("Interfaz de Instagram"),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => const InstagramProfile())); // Cambié el destino a InstagramProfile
            },
          ),
        ],
      ),
    );
  }
}