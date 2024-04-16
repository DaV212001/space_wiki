// interstellar_cloud_controller.dart
import 'package:get/get.dart';
import '../models/interstellar_cloud.dart';
import '../services/interstellar_cloud_services.dart';


class InterstellarCloudController extends GetxController {
  final InterstellarCloudService _interstellarCloudService = InterstellarCloudService();
  var interstellarClouds = <InterstellarCloud>[].obs;

  @override
  void onInit() {
    fetchInterstellarClouds();
    super.onInit();
  }

  Future<void> fetchInterstellarClouds() async {
    try {
      final List<InterstellarCloud> fetchedInterstellarClouds = await _interstellarCloudService.fetchInterstellarClouds();
      interstellarClouds.assignAll(fetchedInterstellarClouds);
    } catch (e) {
      throw Exception('Failed to load interstellar clouds: $e');
    }
  }

  Future<InterstellarCloud?> getInterstellarCloudById(int id) async {
    try {
      return await _interstellarCloudService.getInterstellarCloudById(id);
    } catch (e) {
      throw Exception('Failed to get interstellar cloud: $e');
    }
  }
}
