import 'package:flutter/material.dart';
import 'package:news_app/home_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
    backgroundColor: Color(0xff171717),
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 166,
              color: const Color(0xffFFFFFF),
              child: Text(
                "News App",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            InkWell(
              onTap: ()
              {
                Navigator.of(context).pushNamed(HomeScreen.routeName);
              },
              child:  ListTile(
                leading: Icon(
                  Icons.home,
                  color: Colors.white,
                  size: 26,
                ),
                title: Text(
                  "Home",
                  style: TextStyle(color: Colors.white,
                  fontSize: 24),
                ),
                subtitle: Text(
                  "Click Here",
                  style: TextStyle(color: Colors.white,
                  fontSize: 18),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 26,
                ),
              ),
            )
          ],
        ),
      );
  }
}