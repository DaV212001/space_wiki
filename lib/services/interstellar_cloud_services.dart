// interstellar_cloud_service.dart
import 'package:supabase/supabase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/interstellar_cloud.dart';

class InterstellarCloudService {
  final supabase = Supabase.instance.client;

  Future<List<InterstellarCloud>> fetchInterstellarClouds() async {
    final response = await supabase.from('Interstellar_Clouds').select();

    final List<dynamic> responseData = response as List<dynamic>;
    return responseData
        .map((data) => InterstellarCloud.fromJson(data))
        .toList();
  }

  Future<InterstellarCloud?> getInterstellarCloudById(int id) async {
    final response = await supabase
        .from('Interstellar_Clouds')
        .select()
        .eq('id', id)
        .single();

    final responseData = response;

    return InterstellarCloud.fromJson(responseData);
  }
}
