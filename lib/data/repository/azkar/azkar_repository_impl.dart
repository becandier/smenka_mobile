import 'package:flutter/foundation.dart';
import 'package:templatecmd/data/api/azkar/azkar_api.dart';
import 'package:templatecmd/data/entity/azkar.dart';
import 'package:templatecmd/data/repository/azkar/azkar_repository.dart';

class AzkarRepositoryImpl implements AzkarRepository {
  AzkarRepositoryImpl({required AzkarApi api}) : _api = api;

  final AzkarApi _api;
  @override
  Future<List<AzkarE>> getAzkar() async {
    final apiResponse = await _api.getAzkar();
    return apiResponse.map(AzkarE.fromModel).toList();
  }

  @override
  Future<AzkarE> getAzkarById(int id) async {
    final apiResponse = await _api.getAzkarById(id);
    return compute(AzkarE.fromModel, apiResponse);
  }
}
