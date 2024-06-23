import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_app/screens/login.dart';
import 'package:my_app/screens/userlist.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Contacts",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          Text(
            "Sign out",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          IconButton(
            onPressed: () {
              signout(context);
            },
            icon: Icon(Icons.logout),
            color: Colors.white,
          ),
        ],
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: users.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: ListTile(
                onTap: () {},
                leading: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      shape: (index % 2 == 0)
                          ? BoxShape.circle
                          : BoxShape.rectangle,
                      image: DecorationImage(
                          image: AssetImage(users[index].avatar),
                          fit: BoxFit.cover)),
                ),
                title: Text(
                  users[index].name,
                  style: const TextStyle(
                      fontFamily: "PlaywriteSK-Regular.ttf",
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
                subtitle: Text(users[index].number),
                trailing: Text(users[index].time),
              ),
            );
          }),
    );
  }
}

signout(BuildContext ctx) async {
  final _sharedprefs = await SharedPreferences.getInstance();
  await _sharedprefs.clear();

  Navigator.of(ctx).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => ScreenLogin(),
      ),
      (route) => false);
}
