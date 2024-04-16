// galaxy_controller.dart
import 'package:get/get.dart';
import '../models/galaxy.dart';
import '../services/galaxy_services.dart';

class GalaxyController extends GetxController {
  final GalaxyService _galaxyService = GalaxyService();
  var galaxies = <Galaxy>[].obs;

  @override
  void onInit() {
    fetchGalaxies();
    super.onInit();
  }

  Future<void> fetchGalaxies() async {
    try {
      final List<Galaxy> fetchedGalaxies = await _galaxyService.fetchGalaxies();
      galaxies.assignAll(fetchedGalaxies);
    } catch (e) {
      throw Exception('Failed to load galaxies: $e');
    }
  }

  Future<Galaxy?> getGalaxyById(int id) async {
    try {
      return await _galaxyService.getGalaxyById(id);
    } catch (e) {
      throw Exception('Failed to get galaxy: $e');
    }
  }
}
