import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:space_wiki/controllers/space_term_controller.dart';
import 'package:space_wiki/screens/space_term_detail_screen.dart';
import 'package:space_wiki/widgets/small_content_card.dart';

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
                  return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 8,
                              childAspectRatio: 0.65),
                      itemCount: 10,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return LoadingShimmer();
                      });
                } else {
                  return SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          fit: FlexFit.loose,
                          child: Row(
                            children: [
                              Expanded(
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: spaceTermController
                                      .spaceTermsSubSet1.length,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        Get.to(SpaceTermDetailScreen(
                                            spaceTerm: spaceTermController
                                                .spaceTermsSubSet1[index]));
                                      },
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 8.0),
                                        child: SmallContentCard(
                                          title: spaceTermController
                                              .spaceTermsSubSet1[index].term,
                                          subtitle: spaceTermController
                                              .spaceTermsSubset2[index]
                                              .partOfSpeech,
                                          size:
                                              'Originator(s): ${spaceTermController.spaceTermsSubSet1[index].originators?.split(',').length}',
                                          gradient: LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              Colors.black87,
                                              Colors.grey[900]!
                                            ],
                                            stops: const [0.0, 1.0],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: spaceTermController
                                      .spaceTermsSubset2.length,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        Get.to(SpaceTermDetailScreen(
                                            spaceTerm: spaceTermController
                                                .spaceTermsSubset2[index]));
                                      },
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 8.0),
                                        child: SmallContentCard(
                                          title: spaceTermController
                                              .spaceTermsSubset2[index].term,
                                          subtitle: spaceTermController
                                              .spaceTermsSubset2[index]
                                              .partOfSpeech,
                                          size:
                                              'Originator(s): ${spaceTermController.spaceTermsSubset2[index].originators?.split(',').length}',
                                          gradient: LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              Colors.black87,
                                              Colors.grey[900]!
                                            ],
                                            stops: const [0.0, 1.0],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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

class LoadingShimmer extends StatelessWidget {
  const LoadingShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer(
        loop: 1000,
        gradient: LinearGradient(
            colors: [Colors.black26, Colors.white, Colors.black26]),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.45,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Expanded(
                flex: 5,
                child: Container(
                    width: MediaQuery.of(context).size.width * 0.45,
                    height: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black26))),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  width: MediaQuery.of(context).size.width * 0.45 - 100,
                  height: 5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.black26)),
            )),
            Expanded(
                child: Padding(
              padding:
                  const EdgeInsets.only(bottom: 8.0, left: 8.0, right: 8.0),
              child: Container(
                  width: MediaQuery.of(context).size.width * 0.45 - 70,
                  height: 5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.black26)),
            ))
          ]),
        ));
  }
}
