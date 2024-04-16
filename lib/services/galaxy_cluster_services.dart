// galaxy_cluster_service.dart
import 'package:supabase/supabase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/galaxy_cluster.dart';

class GalaxyClusterService {
  final supabase = Supabase.instance.client;

  Future<List<GalaxyCluster>> fetchGalaxyClusters() async {
    final response = await supabase.from('Galaxy_Clusters').select();

    final List<dynamic> responseData = response as List<dynamic>;
    return responseData.map((data) => GalaxyCluster.fromJson(data)).toList();
  }

  Future<GalaxyCluster?> getGalaxyClusterById(int id) async {
    final response =
        await supabase.from('Galaxy_Clusters').select().eq('id', id).single();

    final responseData = response;

    return GalaxyCluster.fromJson(responseData);
  }
}
