import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sample_city_api/data.dart';
import 'models/models.dart' as city;

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isLoading = true;
  @override
  void initState() {
    super.initState();
    getData();
  }

  city.City? dataFromApi;
  getData() async {
    try {
      http.Response response = await http
          .get(Uri.parse("http://sjf.proximys.in/api/cities/list-all/"));
      if (response.statusCode == 200) {
        final result = city.City.fromJson(jsonDecode(response.body));
        dataFromApi = result;
        _isLoading = false;
        setState(() {});
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: dataFromApi!.response.details.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Image.network(
                        //   dataFromApi.response.details[index].district.state,
                        //   width: 100,
                        // ),
                        Text(dataFromApi!.response.details[index].name),
                        Text(dataFromApi!
                            .response.details[index].district.state.name
                            .toString()),
                      ],
                    ),
                  );
                },
              ));
  }
}
