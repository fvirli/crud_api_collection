// ignore_for_file: avoid_print

import 'package:crud_api_collect/data/models/target.dart';
import 'package:dio/dio.dart';

class TargetRemoteDataSource {
  final Dio dio;

  TargetRemoteDataSource({required this.dio});

  Future<List<TargetModel>> getTargets() async {
    try {
      Response response = await dio.get('http://localhost:3000/mycollect');

      if (response.statusCode == 200 && response.data is List) {
        List<TargetModel> targets = (response.data as List)
            .map((json) => TargetModel.fromJson(json))
            .toList();
        return targets;
      } else {
        print('Failed to fetch targets. Status Code: ${response.statusCode}');
        throw Exception(
            'Failed to fetch targets. Status Code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error fetching targets: $error');
      throw Exception('Failed to get targets: $error');
    }
  }

  Future<void> addTarget(TargetModel target) async {
    try {
      Response response =
          await dio.post('http://localhost:3000/post', data: target.toJson());

      if (response.statusCode == 200) {
        print('Add Target Response: ${response.data}');
      } else {
        print('Failed to add target. Status Code: ${response.statusCode}');
        throw Exception(
            'Failed to add target. Status Code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error adding target: $error');
      throw Exception('Failed to add target: $error');
    }
  }

  Future<void> updateTarget(TargetModel target) async {
    try {
      Response response = await dio.put(
          'http://localhost:3000/update/${target.id}',
          data: target.toJson());

      if (response.statusCode == 200) {
        print('Update Target Response: ${response.data}');
      } else {
        print('Failed to update target. Status Code: ${response.statusCode}');
        throw Exception(
            'Failed to update target. Status Code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error updating target: $error');
      throw Exception('Failed to update target: $error');
    }
  }

  Future<void> deleteTarget(String targetId) async {
    try {
      Response response =
          await dio.delete('http://localhost:3000/delete/$targetId');

      if (response.statusCode == 200) {
        print('Delete Target Response: ${response.data}');
      } else {
        print('Failed to delete target. Status Code: ${response.statusCode}');
        throw Exception(
            'Failed to delete target. Status Code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error deleting target: $error');
      throw Exception('Failed to delete target: $error');
    }
  }
}
