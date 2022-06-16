import 'package:flutter/material.dart';
import 'package:it_intership_jobs_r2s/screens/pages/job_page.dart';
import 'package:it_intership_jobs_r2s/screens/pages/person_page.dart';

import '../screens/pages/home_page.dart';

var appScreen = [
  const HomePage(),
  const JobPage(),
  const Center(
    child: Text('Notifications'),
  ),
  const PersonPage(),
];
