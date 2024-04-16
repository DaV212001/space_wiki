// galaxy_service.dart
import 'package:supabase/supabase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/galaxy.dart';

class GalaxyService {
  final supabase = Supabase.instance.client;

  Future<List<Galaxy>> fetchGalaxies() async {
    final response = await supabase.from('Galaxies').select();

    final List<dynamic> responseData = response as List<dynamic>;
    return responseData.map((data) => Galaxy.fromJson(data)).toList();
  }

  Future<Galaxy?> getGalaxyById(int id) async {
    final response =
        await supabase.from('Galaxies').select().eq('id', id).single();

    final responseData = response;
    return Galaxy.fromJson(responseData);
  }
}
