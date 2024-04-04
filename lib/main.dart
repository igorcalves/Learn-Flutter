import 'package:flutter/material.dart';
import 'package:learn/View/app_widget.dart';
import 'package:learn/repository/data_base/fakeDb.dart';

import 'package:learn/repository/repository.dart';
import 'package:learn/repository/user_fake_repositoty.dart';
import 'package:learn/repository/user_repository.dart';

void main() {
  RepositoryImplementing fake = FakeRepository(MyRepo.getData());

  RepositoryImplementing windowsLocal = UserRepository('http://192.168.56.1:8080');

  RepositoryImplementing linuxLocal = UserRepository('http://192.168.0.90:8080');
  
  RepositoryImplementing gitpod = UserRepository('https://8080-igorcalves-condominusba-8hnd04t45m2.ws-us110.gitpod.io');
  

  runApp(AppWidget(linuxLocal));
}
