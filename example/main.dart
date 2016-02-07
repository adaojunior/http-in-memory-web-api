// #docregion
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