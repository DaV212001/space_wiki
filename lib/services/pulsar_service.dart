// pulsar_service.dart
import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/pulsar.dart';

class PulsarService {
  final supabase = Supabase.instance.client;

  Future<List<Pulsar>> fetchPulsars() async {
    final response = await supabase.from('Pulsars').select();

      final List<dynamic> responseData = response as List<dynamic>;
      return responseData.map((data) => Pulsar.fromJson(data)).toList();

  }

  Future<Pulsar?> getPulsarById(int id) async {
    final response = await supabase.from('Pulsars').select().eq('id', id).single();

      final responseData = response;
        return Pulsar.fromJson(responseData);


  }
}
