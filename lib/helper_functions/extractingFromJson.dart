import 'dart:convert';

T extractingFromJson<T>(
    dynamic data, T Function(Map<String, dynamic>) fromJson) {
  return fromJson(json.decode(data));
}
