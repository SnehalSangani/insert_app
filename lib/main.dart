import 'package:flutter/material.dart';
import 'package:insert_app/screens/home/provider/home_provider.dart';
import 'package:provider/provider.dart';

import 'screens/home/view/home_screen.dart';
void main()
{
  runApp(
      ChangeNotifierProvider(
        create: (context) => Homeprovider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            '/':(context) => homescreen(),
          },
        ),
      )
  );
}