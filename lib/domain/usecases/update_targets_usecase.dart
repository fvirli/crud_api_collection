// update_targets_usecase.dart
import 'package:crud_api_collect/domain/entities/target.dart';
import 'package:crud_api_collect/domain/repositories/target_repository.dart';

class UpdateTargetUseCase {
  final TargetRepository repository;

  UpdateTargetUseCase({required this.repository});

  Future<void> execute(Target target) async {
    try {
      await repository.updateTarget(target);
    } catch (e) {
      // Tambahkan penanganan kesalahan di sini
      rethrow; // lempar kembali kesalahan untuk memberi tahu bahwa sesuatu tidak beres
    }
  }
}
