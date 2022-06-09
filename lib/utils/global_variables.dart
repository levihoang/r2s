import 'package:flutter/material.dart';
import 'package:it_intership_jobs_r2s/screens/pages/person_page.dart';

import '../screens/pages/home_page.dart';

var appScreen = [
  const HomePage(),
  const Center(
    child: Text('Saved'),
  ),
  const Center(
    child: Text('Notifications'),
  ),
  const PersonPage(),
];
