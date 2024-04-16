// galaxy_cluster_controller.dart
import 'package:get/get.dart';
import '../models/galaxy_cluster.dart';
import '../services/galaxy_cluster_services.dart';

class GalaxyClusterController extends GetxController {
  final GalaxyClusterService _galaxyClusterService = GalaxyClusterService();
  var galaxyClusters = <GalaxyCluster>[].obs;

  @override
  void onInit() {
    fetchGalaxyClusters();
    super.onInit();
  }

  Future<void> fetchGalaxyClusters() async {
    try {
      final List<GalaxyCluster> fetchedGalaxyClusters = await _galaxyClusterService.fetchGalaxyClusters();
      galaxyClusters.assignAll(fetchedGalaxyClusters);
    } catch (e) {
      throw Exception('Failed to load galaxy clusters: $e');
    }
  }

  Future<GalaxyCluster?> getGalaxyClusterById(int id) async {
    try {
      return await _galaxyClusterService.getGalaxyClusterById(id);
    } catch (e) {
      throw Exception('Failed to get galaxy cluster: $e');
    }
  }
}
