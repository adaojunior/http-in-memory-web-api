import 'dart:async';
import 'dart:convert';
import 'package:http_in_memory_web_api/http_in_memory_web_api.dart';

final HttpClientInMemoryBackendService http =
    new HttpClientInMemoryBackendService(data);

Future main() async {
  await _get();
  await _post();
  await _put();
  await _get();
  await _delete();
  await _get();
}

Future _get() async {
  final url = 'app/heroes';
  print('[GET] /$url');
  var response = await http.get(url);
  print(response.statusCode);
  print(response.headers);
  print(response.body);
}

Future _post() async {
  final url = 'app/heroes';
  print('[POST] /$url');
  final body = JSON.encode({'id': 5, 'name': 'Windstorm: the great'});
  var response = await http.post(url, body: body);
  print(response.statusCode);
  print(response.headers);
  print(response.body);
}

Future _put() async {
  final url = 'app/heroes/7';
  print('[PUT] /$url');
  final body = JSON.encode({'id': 7, 'name': 'Windstorm: the great'});
  var response = await http.put(url, body: body);
  print(response.statusCode);
  print(response.headers);
  print(response.body);
}

Future _delete() async {
  final url = 'app/heroes/4';
  print('[DELETE] /$url');
  var response = await http.delete(url);
  print(response.statusCode);
  print(response.headers);
  print(response.body);
}

CreateDb data = () => {
      'heroes': [
        {"id": 1, "name": "Windstorm"},
        {"id": 2, "name": "Bombasto"},
        {"id": 3, "name": "Magneta"},
        {"id": 4, "name": "Tornado"}
      ]
    };
