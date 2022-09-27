
import 'dart:convert';

import 'package:http/http.dart'as http;
import 'package:practice/data/user_details.dart';
import 'package:practice/data/user_list.dart';

class UserRepository{

  final baseurl = "https://api.github.com/users";

  Future<List<UserList>> getUserList() async{
    final response = await http.get(Uri.parse(baseurl));
    if(response.statusCode==200)
    {
      return userListFromJson(response.body);
    }
    else{
      throw Exception('Failed To load Data');
    }
  }

  Future<UserDetails> getUsetDetails(login) async{
    final response = await http.get(Uri.parse('$baseurl/$login'));
    if (response.statusCode == 200)
      {
        return UserDetails.fromJson(jsonDecode(response.body));
      }
    else{
      throw Exception('Faild to load data');
    }
  }
}