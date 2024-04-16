// planet_controller.dart
import 'package:get/get.dart';
import '../models/planet.dart';
import '../services/planet_service.dart';

class PlanetController extends GetxController {
  final PlanetService _planetService = PlanetService();
  var planets = <Planet>[].obs;
  var solarPlanets = <Planet>[].obs;
  @override
  void onInit() {
    fetchPlanets();
    fetchSolarPlanets();
    super.onInit();
  }

  Future<void> fetchPlanets() async {
    try {
      final List<Planet> fetchedPlanets = await _planetService.fetchPlanets();
      print('CHECKING DATA: fetchedPlanets: ${fetchedPlanets.length}');
      planets.assignAll(fetchedPlanets);
    } catch (e) {
      throw Exception('Failed to load planets: $e');
    }
  }

  Future<void> fetchSolarPlanets() async {
    // try {
      final List<Planet> fetchedPlanets = await _planetService.fetchSolarPlanets();
      print('CHECKING DATA: fetchedPlanets: ${fetchedPlanets.length}');
      solarPlanets.assignAll(fetchedPlanets);
    // } catch (e) {
    //   throw Exception('Failed to load solar planets: $e');
    // }
  }

  Future<Planet?> getPlanetById(int id) async {
    try {
      return await _planetService.getPlanetById(id);
    } catch (e) {
      throw Exception('Failed to get planet: $e');
    }
  }
}
