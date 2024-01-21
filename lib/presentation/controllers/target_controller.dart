import 'package:get/get.dart';
import 'package:crud_api_collect/domain/entities/target.dart';
import 'package:crud_api_collect/domain/usecases/get_targets_usecase.dart';
import 'package:crud_api_collect/domain/usecases/add_targets_usecase.dart';
import 'package:crud_api_collect/domain/usecases/update_targets_usecase.dart';
import 'package:crud_api_collect/domain/usecases/delete_targets_usecase.dart';

class TargetController extends GetxController {
  final GetTargetsUseCase getTargetsUseCase;
  final AddTargetUseCase addTargetUseCase;
  final UpdateTargetUseCase updateTargetUseCase;
  final DeleteTargetUseCase deleteTargetUseCase;

  TargetController({
    required this.getTargetsUseCase,
    required this.addTargetUseCase,
    required this.updateTargetUseCase,
    required this.deleteTargetUseCase,
  });

  final RxList<Target> targets = <Target>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchTargets();
  }

  Future<void> fetchTargets() async {
    try {
      targets.value = await getTargetsUseCase.execute();
    } catch (error) {
      // Tambahkan penanganan kesalahan sesuai kebutuhan Anda
    }
  }

  Future<void> addTarget(Target target) async {
    await addTargetUseCase.execute(target);
    fetchTargets();
  }

  Future<void> updateTarget(Target target) async {
    await updateTargetUseCase.execute(target);
    fetchTargets();
  }

  Future<void> deleteTarget(String targetId) async {
    await deleteTargetUseCase.execute(targetId);
    fetchTargets();
  }
}
