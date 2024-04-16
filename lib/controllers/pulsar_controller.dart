// pulsar_controller.dart
import 'package:get/get.dart';
import '../models/pulsar.dart';
import '../services/pulsar_service.dart';

class PulsarController extends GetxController {
  final PulsarService _pulsarService = PulsarService();
  var pulsars = <Pulsar>[].obs;

  @override
  void onInit() {
    fetchPulsars();
    super.onInit();
  }

  Future<void> fetchPulsars() async {
    try {
      final List<Pulsar> fetchedPulsars = await _pulsarService.fetchPulsars();
      pulsars.assignAll(fetchedPulsars);
    } catch (e) {
      throw Exception('Failed to load pulsars: $e');
    }
  }

  Future<Pulsar?> getPulsarById(int id) async {
    try {
      return await _pulsarService.getPulsarById(id);
    } catch (e) {
      throw Exception('Failed to get pulsar: $e');
    }
  }
}
