import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../screens/users.dart';

class UserProvider with ChangeNotifier {
  List<User> _users = [];
  bool _isLoading = false;

  List<User> get users => _users;
  bool get isLoading => _isLoading;

  Future<void> fetchUsers() async {
    _isLoading = true;
    notifyListeners();

    final response =
        await http.get(Uri.parse('https://randomuser.me/api/?results=30'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      _users =
          (data['results'] as List).map((user) => User.fromJson(user)).toList();
    } else {
      throw Exception('Failed to load users');
    }

    _isLoading = false;
    notifyListeners();
  }
}
