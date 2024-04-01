import 'package:flutter/material.dart';

import 'package:learn/View/app_widget.dart';
import 'package:learn/repository/UserFakeRepository.dart';
import 'package:learn/repository/fakeDb.dart';
import 'package:learn/repository/repository.dart';
import 'package:learn/repository/user_repository.dart';

void main() {

  RepositoryImplementing fake = FakeRepository(MyRepo.getData());
  RepositoryImplementing local = UserRepository('http://192.168.56.1:8080');
  RepositoryImplementing gitpod = UserRepository('https://8080-igorcalves-condominusba-8hnd04t45m2.ws-us110.gitpod.io');




  runApp(AppWidget(local));
}
