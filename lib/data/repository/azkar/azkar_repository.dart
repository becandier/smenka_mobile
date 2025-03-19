import 'package:templatecmd/data/entity/azkar.dart';

abstract class AzkarRepository {
  Future<List<AzkarE>> getAzkar();
  Future<AzkarE> getAzkarById(int id);
}
