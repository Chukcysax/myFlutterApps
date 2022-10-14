// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'Pages/favourites_page.dart';
import 'Pages/people_page.dart';
import 'Pages/user_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Homepage(),
    );
  }
}

class Homepage extends StatelessWidget {
  final padding = const EdgeInsets.symmetric(horizontal: 20);
  const Homepage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final name = "Chukcy Patricks";
    final email = "chukcyihub.inc@gmail.com";
    final urlImage = "https://avatars.githubusercontent.com/u/39886760?v=4";
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("ichukcy"),
        // actions: const [Icon(Icons.add)],
      ),
      body: const Center(
        child: Text("Wait for more Widgets!"),
      ),
      drawer: Drawer(
        child: Material(
          color: Colors.blue,
          child: ListView(
            children: <Widget>[
              buildHeader(
                urlImage: urlImage,
                name: name,
                email: email,
                onClicked: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => UserPage(
                    name: name,
                    urlImage: urlImage,
                  ),
                )),
              ),
              const SizedBox(height: 48),
              buildMenuItem(
                text: "People",
                icon: Icons.people,
                onClicked: () => selectedItem(context, 0),
              ),
              const SizedBox(height: 16),
              buildMenuItem(
                text: "Favourites",
                icon: Icons.favorite_border,
                onClicked: () => selectedItem(context, 1),
              ),
              const SizedBox(height: 16),
              buildMenuItem(
                text: "Workflow",
                icon: Icons.workspaces_outline,
                onClicked: () => selectedItem(context, 2),
              ),
              const SizedBox(height: 16),
              buildMenuItem(
                text: "Updates",
                icon: Icons.update,
                onClicked: () => selectedItem(context, 3),
              ),
              const SizedBox(height: 24),
              Divider(color: Colors.white70),
              const SizedBox(height: 24),
              const SizedBox(height: 16),
              buildMenuItem(
                text: "Plugins",
                icon: Icons.account_tree_outlined,
                onClicked: () => selectedItem(context, 4),
              ),
              const SizedBox(height: 16),
              buildMenuItem(
                text: "Notifications",
                icon: Icons.notifications_outlined,
                onClicked: () => selectedItem(context, 5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildHeader({
  required String urlImage,
  required String name,
  required String email,
  required VoidCallback onClicked,
}) =>
    InkWell(
      onTap: onClicked,
      child: Container(
        child: Row(
          children: [
            CircleAvatar(radius: 30, backgroundImage: NetworkImage(urlImage)),
            SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                const SizedBox(height: 4),
                Text(
                  email,
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
              ],
            ),
            Spacer(),
            CircleAvatar(
              radius: 24,
              backgroundColor: Color.fromRGBO(30, 60, 168, 1),
              child: Icon(Icons.add_comment_outlined, color: Colors.white),
            )
          ],
        ),
      ),
    );

Widget buildMenuItem({
  required String text,
  required IconData icon,
  VoidCallback? onClicked,
}) {
  final color = Colors.white;
  final hoverColor = Colors.white70;

  return ListTile(
    leading: Icon(
      icon,
      color: color,
    ),
    title: Text(text, style: TextStyle(color: color)),
    hoverColor: hoverColor,
    onTap: onClicked,
  );
}

void selectedItem(BuildContext context, int index) {
  Navigator.of(context).pop();
  switch (index) {
    case 0:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => PeoplePage(),
      ));
      break;
    case 1:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => FavouritesPage(),
      ));
      break;
  }
}
