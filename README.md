# http_in_memory_web_api

A library for Dart developers. It is awesome.

## Usage

A simple usage example:
```dart
import 'package:http_in_memory_web_api/http_in_memory_web_api.dart';

main() async {
  final http = new HttpClientInMemoryBackendService(data);

  final response = await http.get('app/heroes.json');
  print(response.body);
  print(response.statusCode);
  print(response.headers);
}

CreateDb data = () => {
  'heroes':[
    { "id": "1", "name": "Windstorm" },
    { "id": "2", "name": "Bombasto" },
    { "id": "3", "name": "Magneta" },
    { "id": "4", "name": "Tornado" }
  ]
};
```

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: http://example.com/issues/replaceme
