import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/User.dart';

class UsersPage extends StatefulWidget {
  UsersPage({
    Key key,
  }) : super(key: key);

  @override
  _UsersPageState createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  List<Users> users = [];

  final String baseUrl = "http://10.0.2.2:8080";

  void _fetchDataFromTheServer() async {
    final Dio dio = new Dio();

    try {
      var response = await dio.get("$baseUrl/TP1/myrest/users/listUsers");
      print(response.statusCode);
      print(response.data);
      var responseData = response.data as List;

      setState(() {
        users = responseData.map((e) => Users.fromJson(e)).toList();
      });
    } on DioError catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          ...users.map(
            (users) => ListTile(
              leading: Container(
                height: 50,
                width: 50,
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("${users.nom} ${users.prenom}"),
                  Text(
                    "${users.identifiant}",
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(
                    height: 7,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _fetchDataFromTheServer,
        tooltip: 'Fetch Data',
        child: Icon(Icons.cloud_download),
      ),
    );
  }
}
