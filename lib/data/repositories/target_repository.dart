// ignore_for_file: avoid_print, await_only_futures, override_on_non_overriding_member
import 'package:crud_api_collect/data/datasources/remote_data.dart';
import 'package:crud_api_collect/domain/entities/target.dart';
import 'package:crud_api_collect/data/models/target.dart';
import 'package:crud_api_collect/domain/repositories/target_repository.dart'; // Import TargetModel

class TargetRepositoryImpl implements TargetRepository {
  final TargetRemoteDataSource remoteDataSource;

  TargetRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Target>> getTargets() async {
    try {
      // Panggil metode getTargets dari remoteDataSource
      List<Target> targets = (await remoteDataSource.getTargets())
          .map((target) =>
              TargetModel.fromTarget(target)) // Convert to TargetModel
          .toList();
      return targets;
    } catch (error) {
      print('Error fetching targets: $error');
      throw Exception('Failed to get targets: $error');
    }
  }

  @override
  Future<void> addTarget(Target target) async {
    try {
      // Panggil metode addTarget dari remoteDataSource
      await remoteDataSource
          .addTarget(TargetModel.fromTarget(target)); // Convert to TargetModel
    } catch (error) {
      print('Error adding target: $error');
      throw Exception('Failed to add target: $error');
    }
  }

  @override
  Future<void> updateTarget(Target target) async {
    try {
      // Panggil metode updateTarget dari remoteDataSource
      await remoteDataSource.updateTarget(
          TargetModel.fromTarget(target)); // Convert to TargetModel
    } catch (error) {
      print('Error updating target: $error');
      throw Exception('Failed to update target: $error');
    }
  }

  @override
  Future<void> deleteTarget(String targetId) async {
    try {
      // Panggil metode deleteTarget dari remoteDataSource
      await remoteDataSource.deleteTarget(targetId);
    } catch (error) {
      print('Error deleting target: $error');
      throw Exception('Failed to delete target: $error');
    }
  }
}
