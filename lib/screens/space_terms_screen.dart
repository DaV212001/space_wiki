import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:space_wiki/controllers/space_term_controller.dart';
import 'package:space_wiki/screens/space_term_detail_screen.dart';
import 'package:space_wiki/widgets/small_content_card.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SpaceTermsScreen extends StatelessWidget {
  const SpaceTermsScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    SpaceTermController spaceTermController = Get.put(SpaceTermController());

    return Scaffold(
      appBar: AppBar(
        title: Text('Space Terms'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GetBuilder<SpaceTermController>(
            init: spaceTermController,
            builder: (spaceTermController) {
              return Obx(() {
                if (spaceTermController.spaceTerms.isEmpty) {
                  return const Center(child: SpinKitSpinningLines(color: Colors.blue));
                } else {
                  return GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      childAspectRatio: 0.75
                    ),
                    itemCount: spaceTermController.spaceTerms.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: (){
                          Get.to(SpaceTermDetailScreen(spaceTerm: spaceTermController.spaceTerms[index]));
                        },
                        child: SmallContentCard(
                          title: spaceTermController.spaceTerms[index].term,
                          subtitle: spaceTermController.spaceTerms[index].partOfSpeech,
                          size: 'Originator(s): ${spaceTermController.spaceTerms[index].originators?.split(',').length}',
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.black87, Colors.grey[900]!],
                            stops: const [0.0, 1.0],
                          ),
                        ),
                      );
                    },
                  );
                }
              });
            },
          ),
        ),
      ),
    );
  }
}
