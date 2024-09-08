import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geeksnergy/movie_model.dart';
import 'package:geeksnergy/signup_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.teal,
              title: Padding(
                padding: const EdgeInsets.only(
                  left: 90,
                ),
                child: Text(
                  "Home",
                  style: TextStyle(color: Colors.white),
                ),
              )),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.only(top: 60),
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.home_filled),
                  title: Text('Home'),
                  onTap: () {
                    Navigator.pop(context); // Close the drawer
                  },
                ),
                ListTile(
                  leading: Icon(Icons.business),
                  title: Text('Company Info'),
                  onTap: () {
                    Navigator.pop(context); // Close the drawer
                    _showCompanyInfo(context);
                  },
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.logout_sharp),
                  title: Text('Logout'),
                  onTap: () {
                    Navigator.pop(context); // Close the drawer
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => SignupPage()),
                    );
                  },
                ),
              ],
            ),
          ),
          body: FutureBuilder(
              future: _fetchData(),
              builder: (_, snapShot) {
                if (snapShot.hasData) {
                  return ListView.builder(
                      itemCount: snapShot.data?.length,
                      itemBuilder: (context, index) {
                        var data = snapShot.data?[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(data!.title.toString()),
                                Text('Language: ${data.language.toString()}'),
                                Text('Genre: ${data.genre.toString()}'),
                                Text('Voting:${data.voting.toString()}')
                              ],
                            ),
                            leading: Image.network(data!.poster.toString()),
                            trailing: Text(data!.director.toString()),
                            // title: Text(data!.title.toString()),
                          ),
                        );
                      });
                }
                return Text('No data');
              })),
    );
  }
}

Future<List<MovieModel>?> _fetchData() async {
  List<MovieModel> movieModelList = [];
  var url = Uri.parse('https://hoblist.com/api/movieList');
  var response = await http.post(url,
      body: jsonEncode({
        'category': 'movies',
        'language': 'kannada',
        'genre': 'all',
        'sort': 'voting'
      }),
      headers: {'Content-Type': 'application/json'});

  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    //   print(data["result"]);
    List dataList = data["result"];
    for (int i = 0; i < dataList.length; i++) {
      var json = dataList[i];
      movieModelList.add(MovieModel.fromJson(json));
    }

    // Handle data presentation or manipulation here
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
  return movieModelList;
}

void _showCompanyInfo(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Company Info"),
        content: Text("Company: Geeksynergy Technologies Pvt Ltd\n"
            "Address: Sanjayanagar, Bengaluru-56\n"
            "Phone: XXXXXXXXX09\n"
            "Email: XXXXXX@gmail.com"),
        actions: <Widget>[
          TextButton(
            child: Text("Close"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
