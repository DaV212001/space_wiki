// space_term_controller.dart
import 'package:get/get.dart';

import '../models/space_term.dart';
import '../services/space_term_service.dart';

class SpaceTermController extends GetxController {
  final SpaceTermService _spaceTermService = SpaceTermService();
  var spaceTerms = <SpaceTerm>[].obs;

  @override
  void onInit() {
    fetchSpaceTerms();
    super.onInit();
  }

  Future<void> fetchSpaceTerms() async {
    try {
      final List<SpaceTerm> fetchedSpaceTerms =
          await _spaceTermService.fetchSpaceTerms();
      spaceTerms.assignAll(fetchedSpaceTerms);
    } catch (e) {
      throw Exception('Failed to load space terms: $e');
    }
  }

  Future<SpaceTerm?> getSpaceTermById(int id) async {
    try {
      return await _spaceTermService.getSpaceTermById(id);
    } catch (e) {
      throw Exception('Failed to get space term: $e');
    }
  }

  List<SpaceTerm> get spaceTermsSubSet1 =>
      spaceTerms.sublist(0, (spaceTerms.length / 2).ceil());
  List<SpaceTerm> get spaceTermsSubset2 =>
      spaceTerms.sublist((spaceTerms.length / 2).ceil());
}
