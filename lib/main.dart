import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:crud_api_collect/presentation/controllers/target_controller.dart';
import 'package:crud_api_collect/data/datasources/remote_data.dart';
import 'package:crud_api_collect/data/repositories/target_repository.dart';
import 'package:crud_api_collect/domain/usecases/get_targets_usecase.dart';
import 'package:crud_api_collect/domain/usecases/add_targets_usecase.dart';
import 'package:crud_api_collect/domain/usecases/update_targets_usecase.dart';
import 'package:crud_api_collect/domain/usecases/delete_targets_usecase.dart';
import 'package:crud_api_collect/presentation/pages/home_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final Dio dio = Dio(); // Konfigurasi Dio sesuai kebutuhan

    Get.put(TargetController(
      getTargetsUseCase: GetTargetsUseCase(
          repository: TargetRepositoryImpl(
              remoteDataSource: TargetRemoteDataSource(dio: dio))),
      addTargetUseCase: AddTargetUseCase(
          repository: TargetRepositoryImpl(
              remoteDataSource: TargetRemoteDataSource(dio: dio))),
      updateTargetUseCase: UpdateTargetUseCase(
          repository: TargetRepositoryImpl(
              remoteDataSource: TargetRemoteDataSource(dio: dio))),
      deleteTargetUseCase: DeleteTargetUseCase(
          repository: TargetRepositoryImpl(
              remoteDataSource: TargetRemoteDataSource(dio: dio))),
    ));

    return MaterialApp(
      title: 'CRUD API Collect',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
