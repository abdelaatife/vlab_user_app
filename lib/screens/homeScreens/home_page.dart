import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:vlab/screens/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        color: Colors.teal[300],
        padding: const EdgeInsets.only(
          top: 10,
        ),
        child: Scaffold(
          appBar: AppBar(
            primary: false,
            iconTheme: const IconThemeData(
              color: Colors.black,
              size: 30,
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const profilePage()));
                  },
                  icon: const Icon(
                    LineIcons.userCircle,
                  ))
            ],
            flexibleSpace: Container(
              decoration: BoxDecoration(
                  color: Colors.teal[300],
                  borderRadius: const BorderRadius.only(
                      bottomLeft:  Radius.circular(12),
                      bottomRight:  Radius.circular(12))),
            ),
          ),
          drawerScrimColor: Colors.teal[300],
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                    child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const profilePage()));
                      },
                      child: const CircleAvatar(
                        maxRadius: 40,
                        child: Icon(
                          Icons.person,
                          size: 40,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "User name",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
                    )
                  ],
                )),
                ListTile(
                  onTap: () {},
                  leading: const Icon(LineIcons.star),
                  title: const Text('Favorite'),
                ),
                ListTile(
                  onTap: () {},
                  leading: const Icon(LineIcons.syncIcon),
                  title: const Text('Settings'),
                ),
                ListTile(
                  onTap: () {},
                  leading: const Icon(Icons.support_agent_sharp),
                  title: const Text('Support'),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Divider(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ListTile(
                      onTap: () {},
                      leading: const Icon(Icons.logout_rounded),
                      title: const Text('Logout'),
                    ),
                  ],
                )
              ],
            ),
          ),
          body: Container(
              // color: Colors.amberAccent,
              ),
        ),
      ),
    );
  }
}
