import 'dart:convert';

import 'package:http/http.dart';

class Api{
  Future<List> getData() async {
    Uri uri=Uri.parse("https://jsonplaceholder.typicode.com/todos");
    Response response= await get(uri);
    List data=jsonDecode(response.body);
    return List.generate(data.length, (index) => data[index]["title"]);
  }
}