// add_targets_usecase.dart
import 'package:crud_api_collect/domain/entities/target.dart';
import 'package:crud_api_collect/domain/repositories/target_repository.dart';

class AddTargetUseCase {
  final TargetRepository repository;

  AddTargetUseCase({required this.repository});

  Future<void> execute(Target target) async {
    try {
      await repository.addTarget(target);
    } catch (e) {
      rethrow;
    }
  }
}
