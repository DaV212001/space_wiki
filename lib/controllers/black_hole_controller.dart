// black_hole_controller.dart
import 'package:get/get.dart';
import '../models/black_hole.dart';
import '../services/black_hole_services.dart';

class BlackHoleController extends GetxController {
  final BlackHoleService _blackHoleService = BlackHoleService();
  var blackHoles = <BlackHole>[].obs;

  @override
  void onInit() {
    fetchBlackHoles();
    super.onInit();
  }

  Future<void> fetchBlackHoles() async {
    try {
      final List<BlackHole> fetchedBlackHoles = await _blackHoleService.fetchBlackHoles();
      blackHoles.assignAll(fetchedBlackHoles);
    } catch (e) {
      throw Exception('Failed to load black holes: $e');
    }
  }

  Future<BlackHole?> getBlackHoleById(int id) async {
    try {
      return await _blackHoleService.getBlackHoleById(id);
    } catch (e) {
      throw Exception('Failed to get black hole: $e');
    }
  }
}
