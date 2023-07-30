import 'package:flutter/material.dart';
import 'package:oop_example/controller/http/http_service.dart';

import 'controller/dependency_injection/dependency_injection.dart';
import 'controller/http/provider/dio_http_provider.dart';
import 'model/post/post_model.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setUpLocators();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OOP Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final HTTPService _httpService = serviceLocator.get<HTTPService>();

  List<PostModel>? posts;

  Future<void> _getPosts() async {
    Future.delayed(const Duration(milliseconds: 20), () async {
      await _httpService.getPosts().then((postResponse) {
        setState(() {
          posts = postResponse;
        });
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OOP Example'),
      ),
      body: posts != null
          ? ListView.builder(
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                    ),
                    child: ListTile(
                      title: Text(posts![index].title),
                      subtitle: Text(posts![index].body),
                    ),
                  ),
                );
              },
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
