// star_controller.dart
import 'package:get/get.dart';
import '../models/star.dart';
import '../services/star_service.dart';

class StarController extends GetxController {
  final StarService _starService = StarService();
  var stars = <Star>[].obs;

  @override
  void onInit() {
    fetchStars();
    super.onInit();
  }

  Future<void> fetchStars() async {
    try {
      final List<Star> fetchedStars = await _starService.fetchStars();
      stars.assignAll(fetchedStars);
    } catch (e) {
      throw Exception('Failed to load stars: $e');
    }
  }

  Future<Star?> getStarById(int id) async {
    try {
      return await _starService.getStarById(id);
    } catch (e) {
      throw Exception('Failed to get star: $e');
    }
  }
}
