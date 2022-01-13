import 'package:api_use/login.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:api_use/json/api_link.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<ApiLink> apiLinkList = [];
  bool _isLoading = false;

  Future<bool> getData() async {
    String searchUrl = "https://jsonplaceholder.typicode.com/users";
    var response = await http.get(Uri.parse(searchUrl));
    setState(() {
      apiLinkList = apiLinkFromJson(response.body.toString());
      _isLoading = true;
    });
    if(response.statusCode == 200 || response.statusCode == 400){
      return true;
    } else {
      throw Exception("Data loading");
    }

  }

  @override
  void initState() {
    super.initState();
    _isLoading = false;
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Api Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  LoginPage(
        apiLinkList: apiLinkList,
        isLoading: _isLoading,
      ),
    );
  }
}
