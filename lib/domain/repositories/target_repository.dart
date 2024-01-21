import 'package:crud_api_collect/domain/entities/target.dart';

abstract class TargetRepository {
  Future<List<Target>> getTargets();
  Future<void> addTarget(Target target);
  Future<void> updateTarget(Target target);
  Future<void> deleteTarget(String targetId);
}
