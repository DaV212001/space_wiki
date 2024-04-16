// space_term_service.dart
import 'package:supabase/supabase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/space_term.dart';

class SpaceTermService {
  final supabase = Supabase.instance.client;

  Future<List<SpaceTerm>> fetchSpaceTerms() async {
    final response = await supabase.from('Space_Terms').select();

      final List<dynamic> responseData = response as List<dynamic>;
      return responseData.map((data) => SpaceTerm.fromJson(data)).toList();

  }

  Future<SpaceTerm?> getSpaceTermById(int id) async {
    final response = await supabase.from('Space_Terms').select().eq('id', id).single();

      final responseData = response;

        return SpaceTerm.fromJson(responseData);


  }
}
