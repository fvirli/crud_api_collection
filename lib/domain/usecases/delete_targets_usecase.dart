// delete_targets_usecase.dart
import 'package:crud_api_collect/domain/repositories/target_repository.dart';

class DeleteTargetUseCase {
  final TargetRepository repository;

  DeleteTargetUseCase({required this.repository});

  Future<void> execute(String targetId) async {
    try {
      await repository.deleteTarget(targetId);
    } catch (e) {
      // Tambahkan penanganan kesalahan di sini
      rethrow; // lempar kembali kesalahan untuk memberi tahu bahwa sesuatu tidak beres
    }
  }
}
