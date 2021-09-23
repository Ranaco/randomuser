// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  final String? title;

  const HomePage({Key? key, this.title}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List userData = [];

  final String url = "https://randomuser.me/api/?results=50";

  bool isLoading = true;

  Future getUserData() async {
    var response =
        await http.get(Uri.parse(url), headers: {"Accept": "application/json"});
    List data = jsonDecode(response.body)["results"];

    setState(() {
      userData = data;
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
      ),
      body: Container(
        child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: userData.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.all(8.0),
                          child: Image.network(
                            userData[index]["picture"]["large"],
                            fit: BoxFit.cover,
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                userData[index]['name']['title'] +
                                    " " +
                                    userData[index]['name']['first'] +
                                    " " +
                                    userData[index]['name']['last'],
                                style: const TextStyle(fontSize: 20),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                }),
      ),
    );
  }
}
