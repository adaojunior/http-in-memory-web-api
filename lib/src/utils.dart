import 'dart:html';
import 'package:http/http.dart' show Request;

/// Interface for a class that creates an in-memory database
/// Safe for consuming service to morph arrays and objects.
/// Creates "database" object hash whose keys are collection names
/// and whose values are arrays of the collection objects.
/// It must be safe to call again and should return new arrays with new objects.
/// This condition allows InMemoryBackendService to morph the arrays and objects
/// without touching the original source data.
typedef Map<String, dynamic> CreateDb();

/// Interface for InMemoryBackend configuration options
abstract class InMemoryBackendConfigArgs {
  /// delay (in ms) to simulate latency
  num get delay;

  /// false (default) if ok when object-to-delete not found; else 404
  bool get delete404;

  /// host for this service
  String get host;

  /// root path before any API call
  String get rootPath;
}

/// InMemoryBackendService configuration options
class InMemoryBackendConfig implements InMemoryBackendConfigArgs {
  /// delay (in ms) to simulate latency
  num delay = 500;

  /// false (default) if ok when object-to-delete not found; else 404
  bool delete404 = false;

  /// host for this service
  String host;

  /// root path before any API call
  String rootPath;

  InMemoryBackendConfig(
      {num delay, bool delete404, String host, String rootPath}) {
    this.delay = delay ?? this.delay;
    this.delete404 = delete404 ?? this.delete404;
    this.host = host ?? this.host;
    this.rootPath = rootPath ?? this.rootPath;
  }
}

class Location {
  AnchorElement _el;

  Location(href) {
    _el = document.createElement('a');
    _el.href = href;
  }

  String get host => _el.host;

  String get protocol => _el.protocol;

  String get pathname => _el.pathname;
}

class ParsedURL {
  final String base;
  final String collectionName;
  final String id;
  final String resourceUrl;
  ParsedURL(this.base, this.collectionName, this.id, this.resourceUrl);
}

class Collection {
  String name;
  List data;
  Collection(this.name, this.data);

  String toString() => name;
}

class RequestInfo {
  final Request req;
  final String base;
  final Collection collection;
  final Map headers;
  final dynamic id;
  final String resourceUrl;

  RequestInfo(this.req, this.base, this.collection, this.headers, this.id,
      this.resourceUrl);

  bool get hasId => id != null;
}
