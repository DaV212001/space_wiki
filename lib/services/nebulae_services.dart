// nebula_service.dart
import 'package:supabase/supabase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/nebulae.dart';

class NebulaeService {
  final supabase = Supabase.instance.client;

  Future<List<Nebula>> fetchNebulae() async {
    final response = await supabase.from('Nebulae').select();

      final List<dynamic> responseData = response as List<dynamic>;
      return responseData.map((data) => Nebula.fromJson(data)).toList();

  }

  Future<Nebula?> getNebulaById(int id) async {
    final response = await supabase.from('Nebulae').select().eq('id', id).single();

      final responseData = response;

        return Nebula.fromJson(responseData);


  }
}
