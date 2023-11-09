// ignore_for_file: file_names

import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserDataProvider extends StateNotifier<String> {
  UserDataProvider(super.state);

  void setUserName(String userName) {
    state = userName;
  }
}

final userDataProvider = StateNotifierProvider((ref) => UserDataProvider(""));
