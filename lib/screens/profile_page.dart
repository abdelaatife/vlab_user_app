
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class profilePage extends StatefulWidget {
  const profilePage({Key? key}) : super(key: key);

  @override
  _profilePageState createState() => _profilePageState();
}

class _profilePageState extends State<profilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(LineIcons.angleLeft))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  maxRadius: 50,
                )
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
              child: Row(
                children: [
                  const Icon(
                    LineIcons.passport,
                    size: 24,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text(
                    "fulle name :",
                    style:  TextStyle(fontWeight: FontWeight.w300, fontSize: 20),
                  ),
                  const Text(
                    "  user name ",
                    style:  TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
                  )
                ],
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
              child: Row(
                children: [
                  const Icon(
                    Icons.date_range_outlined,
                    size: 24,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text(
                    "Date birthe :",
                    style:  TextStyle(fontWeight: FontWeight.w300, fontSize: 20),
                  ),
                  const Text(
                    "  12 / 05 /2010 ",
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
                  )
                ],
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
              child: Row(
                children: [
                  const Icon(
                    LineIcons.male,
                    size: 26,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text(
                    "Gender :",
                    style:  TextStyle(fontWeight: FontWeight.w300, fontSize: 20),
                  ),
                  const Text(
                    "  male ",
                    style:  TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
                  )
                ],
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
              child: Row(
                children: [
                  const Icon(
                    Icons.location_on_outlined,
                    size: 26,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text(
                    "Country :",
                    style:  TextStyle(fontWeight: FontWeight.w300, fontSize: 20),
                  ),
                  const Text(
                    " Algeria",
                    style:  TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
