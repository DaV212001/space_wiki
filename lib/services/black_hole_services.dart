// black_hole_service.dart
import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/black_hole.dart';

class BlackHoleService {
  final supabase = Supabase.instance.client;

  Future<List<BlackHole>> fetchBlackHoles() async {
    final response = await supabase.from('Black_Holes').select();
    final responseData = response;
    return responseData.map((data) => BlackHole.fromJson(data)).toList();
  }

  Future<BlackHole?> getBlackHoleById(int id) async {
    final response =
        await supabase.from('Black_Holes').select().eq('id', id).single();
    final responseData = response;
    return BlackHole.fromJson(responseData);
  }
}
