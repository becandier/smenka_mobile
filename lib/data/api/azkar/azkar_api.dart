// For dio methods
// ignore_for_file: inference_failure_on_function_invocation

import 'package:dio/dio.dart';
import 'package:templatecmd/data/api/models/azkar/azkar.dart';

class AzkarApi {
  AzkarApi({required Dio client}) : _client = client;

  final Dio _client;

  Future<List<AzkarM>> getAzkar() async {
    final response = await _client.get('/azkar');
    //
    // ignore: avoid_dynamic_calls
    return (response.data['data'] as List)
        .map((e) => AzkarM.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<AzkarM> getAzkarById(int id) async {
    final response = await _client.get('/azkar/$id');
    return AzkarM.fromJson(response.data as Map<String, dynamic>);
  }
}
