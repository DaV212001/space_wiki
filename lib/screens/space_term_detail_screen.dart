import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:http/http.dart';
import 'package:shimmer/shimmer.dart';
import 'package:space_wiki/utils/animations.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../configs/constants.dart';
import '../models/space_term.dart';
import '../widgets/header_image_and_text.dart';

class SpaceTermDetailScreen extends StatefulWidget {
  final SpaceTerm spaceTerm;
  const SpaceTermDetailScreen({super.key, required this.spaceTerm});

  @override
  State<SpaceTermDetailScreen> createState() => _SpaceTermDetailScreenState();
}

class _SpaceTermDetailScreenState extends State<SpaceTermDetailScreen> {
  late YoutubePlayerController _controller;

  initState() {
    fetchVideos();
    super.initState();
  }

  List<dynamic> videoIds = [];
  Future<void> fetchVideos() async {
    final apiKey = Assets.youtube_key;
    final query = Uri.encodeFull('Space term ${widget.spaceTerm.term!}');
    final url =
        "https://www.googleapis.com/youtube/v3/search?part=snippet&q=$query&type=video&key=$apiKey";
    try {
      final response = await get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final items = data['items'] as List<dynamic>;
        setState(() {
          print('FILLED');
          videoIds = items.map((item) => item['id']['videoId']).toList();
        });
      } else {
        print('Failed to fetch videos: ${response.statusCode}');
      }
    } catch (error) {
      print('Error fetching videos: $error');
    }
  }

  Widget buildYouTubePlayer(String videoId) {
    _controller = YoutubePlayerController(
      initialVideoId: videoId, // Initial video ID
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    )..load(videoId);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: true,
            progressIndicatorColor: Colors.greenAccent,
            progressColors: ProgressBarColors(
              playedColor: Colors.greenAccent,
              handleColor: Colors.white12,
            ),
          ),
        ),
      ),
    );
  }

  void playVideo(String videoId) {
    _controller.load(videoId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildHeader(context),
                  Divider(
                    height: 32,
                    thickness: 1,
                  ),
                  buildBody(context),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(24, 10, 0, 0),
                    child: Text(
                      'Related Videos',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.loose,
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24, 10, 0, 0),
                      child: SizedBox(
                        height: 200,
                        child: ListView.builder(
                          itemCount: videoIds.isEmpty ? 10 : videoIds.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            if (videoIds.isEmpty) {
                              return Shimmer(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.black26,
                                      Colors.white,
                                      Colors.black26
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 300,
                                      width: 300,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Colors.black),
                                    ),
                                  ));
                            }
                            return GestureDetector(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return Center(
                                        child: Container(
                                          height: 300,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: buildYouTubePlayer(
                                              videoIds[index]),
                                        ),
                                      );
                                    });
                              },
                              child: Container(
                                width: 300,
                                height: 300,
                                margin: EdgeInsets.only(right: 16),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: Colors.grey),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.network(
                                    'https://img.youtube.com/vi/${videoIds[index]}/0.jpg',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]));
  }

  Column buildHeader(BuildContext context) {
    final animationsMap = {
      'textOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effects: [
          VisibilityEffect(duration: 100.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 100.ms,
            duration: 600.ms,
            begin: 0,
            end: 1,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 100.ms,
            duration: 600.ms,
            begin: Offset(0, 170),
            end: Offset(0, 0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effects: [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.ms,
            duration: 600.ms,
            begin: 0,
            end: 1,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.ms,
            duration: 600.ms,
            begin: Offset(0, -250),
            end: Offset(0, 0),
          ),
        ],
      ),
    };

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      HeaderImageAndButtons()
          .animateOnPageLoad(animationsMap['containerOnPageLoadAnimation1']!),
      Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(24, 10, 0, 0),
          child: Text(
            widget.spaceTerm.term!,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ))
    ]);
  }

  Column buildBody(BuildContext context) {
    final animationsMap = {
      'textOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effects: [
          VisibilityEffect(duration: 100.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 100.ms,
            duration: 600.ms,
            begin: 0,
            end: 1,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 100.ms,
            duration: 600.ms,
            begin: Offset(0, 170),
            end: Offset(0, 0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effects: [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.ms,
            duration: 600.ms,
            begin: 0,
            end: 1,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.ms,
            duration: 600.ms,
            begin: Offset(0, -250),
            end: Offset(0, 0),
          ),
        ],
      ),
    };
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(24, 12, 0, 0),
          child: Text(
            'Definition',
            textAlign: TextAlign.start,
            style:
                TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(24, 4, 24, 12),
          child: Text(
            widget.spaceTerm.definition!,
            textAlign: TextAlign.start,
            style: TextStyle(
              fontFamily: 'Poppins',
            ),
          ).animateOnPageLoad(animationsMap['textOnPageLoadAnimation']!),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(24, 4, 24, 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Originators',
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontFamily: 'Poppins', fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  '${widget.spaceTerm.originators!}',
                  textAlign: TextAlign.start,
                  softWrap: true,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ],
          ).animateOnPageLoad(animationsMap['textOnPageLoadAnimation']!),
        ),
      ],
    );
  }
}
