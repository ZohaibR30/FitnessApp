import 'package:flutter/material.dart';
// import 'package:flutter_icons/flutter_icons.dart';
import './getstarted.dart';

void main() {
  runApp(const Setting());
}
class Setting extends StatelessWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Setting',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: Builder(
      builder: (ctx)=>Scaffold(
        appBar: AppBar(title: const Center(child: Text("Settings"))),
        body: const BodyLayout(),
      ),
    ),
    );
  }
}
class BodyLayout extends StatelessWidget {
  const BodyLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _myListView(context);
  }
}

Widget _myListView(BuildContext context) {
  return ListView(
    children: <Widget>[
       ListTile(
        title: const Text('Settings'),
         trailing: const Icon(Icons.keyboard_arrow_right),
leading: const Icon(Icons.settings_applications),
onTap: () {
        },

      ),

      ListTile(
        title: const Text('Username'),
        trailing: const Icon(Icons.keyboard_arrow_right),

        onTap: () {
          },
      ),
        ListTile(
          title: const Text('Phone Number'),
          trailing: const Icon(Icons.keyboard_arrow_right),

          onTap: () {
          },

      ),
       ListTile(
        title: const Text('Change Password'),
        trailing: const Icon(Icons.keyboard_arrow_right),
        onTap: () {
        },

      ),
  ListTile(
  title: const Text('Sign Out'),
    trailing: const Icon(Icons.keyboard_arrow_right),

    onTap: ()
  {

  },),

      ListTile(
        title: const Text('About'),
        trailing: const Icon(Icons.keyboard_arrow_right),
  onTap: () {
  },

  ),
       ListTile(
        title: const Text('Privacy'),
        trailing: const Icon(Icons.keyboard_arrow_right),
          onTap: (){
          },
      ),
    ],
  );
}