import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/route_names.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 150,
            width: double.infinity,
            color: Theme
                .of(context)
                .primaryColor,
            alignment: Alignment.center,
            child: Text(
              'Meals App',
              style: TextStyle(
                  fontFamily: GoogleFonts
                      .abrilFatface()
                      .fontFamily,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.restaurant),
            title: const Text('Meals'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(RouteNames.HOME);
            },
          ),
          ListTile(
            leading: const Icon(Icons.filter),
            title: const Text('Filters'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(RouteNames.FILTERS);
            },
          )
        ],
      ),
    );
  }
}
