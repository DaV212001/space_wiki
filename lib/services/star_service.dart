// star_service.dart
import 'package:supabase/supabase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/star.dart';

class StarService {
  final supabase = Supabase.instance.client;

  Future<List<Star>> fetchStars() async {
    final response = await supabase.from('Stars').select();

      final List<dynamic> responseData = response as List<dynamic>;
      return responseData.map((data) => Star.fromJson(data)).toList();
  }

  Future<Star?> getStarById(int id) async {
    final response = await supabase.from('Stars').select().eq('id', id).single();

      final responseData = response;

        return Star.fromJson(responseData);


  }
}
