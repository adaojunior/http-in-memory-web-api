// Copyright (c) 2016, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
@TestOn("browser")
import 'package:test/test.dart';
import 'package:http_in_memory_web_api/http_in_memory_web_api.dart';
import 'dart:convert';

final List heroes = [
  { "id": "1", "name": "Windstorm" },
  { "id": "2", "name": "Bombasto" },
  { "id": "3", "name": "Magneta" },
  { "id": "4", "name": "Tornado" }
];

CreateDb data = () => {'heroes': heroes};

void main() {
  group('HttpClientInMemoryBackendService', () {
    HttpClientInMemoryBackendService http;

    setUp(() {
      http = new HttpClientInMemoryBackendService(data);
    });

    test('get All', () async {
      final response = await http.get('app/heroes.json');
      expect(response.body,JSON.encode(heroes));
      expect(response.statusCode,200);
      expect(response.headers['Content-Type'],'application/json');
    });
  });
}
