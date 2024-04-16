// nebula_controller.dart
import 'package:get/get.dart';
import '../models/nebulae.dart';
import '../services/nebulae_services.dart';

class NebulaController extends GetxController {
  final NebulaeService _nebulaService = NebulaeService();
  var nebulae = <Nebula>[].obs;

  @override
  void onInit() {
    fetchNebulae();
    super.onInit();
  }

  Future<void> fetchNebulae() async {
    try {
      final List<Nebula> fetchedNebulae = await _nebulaService.fetchNebulae();
      nebulae.assignAll(fetchedNebulae);
    } catch (e) {
      throw Exception('Failed to load nebulae: $e');
    }
  }

  Future<Nebula?> getNebulaById(int id) async {
    try {
      return await _nebulaService.getNebulaById(id);
    } catch (e) {
      throw Exception('Failed to get nebula: $e');
    }
  }
}
