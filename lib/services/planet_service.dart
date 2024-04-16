// planet_service.dart
import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/planet.dart';

class PlanetService {
  final supabase = Supabase.instance.client;

  Future<List<Planet>> fetchPlanets() async {
    final response = await supabase.from('Planets').select();
    print('CHECKING PLANET DATA: $response');
      final List<dynamic> responseData = response as List<dynamic>;
      return responseData.map((data) => Planet.fromJson(data)).toList();

  }

  Future<List<Planet>> fetchSolarPlanets() async {
    final response = await supabase.from('Solar Planets').select();
    print('CHECKING SOLAR PLANET DATA: $response');
    final List<dynamic> responseData = response as List<dynamic>;
    return responseData.map((data) => Planet.fromJson(data)).toList();
  }


  Future<Planet?> getPlanetById(int id) async {
    final response = await supabase.from('Planets').select().eq('id', id).single();
    final responseData = response;
    return Planet.fromJson(responseData);
  }

  Future<Planet?> getSolarPlanetById(int id) async {
    final response = await supabase.from('Solar Planets').select().eq('id', id).single();
    final responseData = response;
    return Planet.fromJson(responseData);
  }
}
