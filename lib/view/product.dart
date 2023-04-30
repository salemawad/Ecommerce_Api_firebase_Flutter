
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:myecommerc/coordination/fade_animation.dart';
import 'package:myecommerc/model/Api/prodcut_model.dart';
import 'package:myecommerc/controller/homecontroller.dart';
import 'package:myecommerc/view/mycategory.dart';
import 'package:myecommerc/view/widget/coustomStagGrid.dart';


import '../coordination/colors.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
    return DefaultTabController(
      length: 5,
      child: SafeArea(
        child: Scaffold(
            body: ListView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
                FadeAnimation(2, child: Container(
                  color: MyColors.backgroundAppBar,
                  padding: const EdgeInsets.only(left: 10, top: 20),
                  child:   TabBar(
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.black54,
                      padding: const EdgeInsets.only(right: 20),
                      isScrollable: true,
                      indicator: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(8)),
                          color: const Color(0xFFF9A236),
                          border: Border.all(color:const Color(0xEFEFEFEF),width: 1 )),
                      tabs:const [
                        Tab(
                          text: "All",
                        ),
                        Tab(
                          text: "electronics",
                        ),
                        Tab(
                          text: "jewelery",
                        ),
                        Tab(
                          text: "men's clothing",
                        ),
                        Tab(
                          text: "women's clothing",
                        ),
                      ]
                  ),
                )),
                Container(
                  color: const Color(0xEFEFEFEF),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: TabBarView(
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        FutureBuilder<List<ProductModel>>(
                          future:controller.getProduct(),
                          builder: (context, snapshot) {
                          if(snapshot.hasData){
                            return StaggeredGridView.countBuilder(
                              physics: const BouncingScrollPhysics(),
                              staggeredTileBuilder: (int index) =>
                              const StaggeredTile.count(1, 1.8),
                              crossAxisCount: 2,
                              itemCount: snapshot.data!.length,
                              itemBuilder: (BuildContext context, int index) {
                                return FadeAnimation(1.3, child: CustomStagGrid(
                                  // onPress:(){
                                  //   uploadData(index,snapshot.data!);
                                  // },
                                    onTap: () => Get.to(
                                      MyCategory(
                                        productModel: snapshot.data![index],
                                      ),

                                         transition: Transition.zoom,
                                        duration: const Duration(milliseconds: 400)
                                    ),
                                    label: snapshot.data![index].title,
                                    image: snapshot.data![index].image,
                                    description:snapshot.data![index].description,
                                    price: "${snapshot.data![index].price}"));
                              },
                            );
                          }else{
                            return Center(child: LoadingAnimationWidget.staggeredDotsWave(color: MyColors.primary, size: 100),);
                          }
                        },),

                        FutureBuilder<List<ProductModel>>(
                          future:controller.getProductEl(),
                          builder: (context, snapshot) {
                            if(snapshot.hasData){
                              return FadeAnimation(1.3, child: StaggeredGridView.countBuilder(
                                physics: const BouncingScrollPhysics(),
                                staggeredTileBuilder: (int index) =>
                                const StaggeredTile.count(1, 1.8),
                                crossAxisCount: 2,
                                itemCount: snapshot.data!.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return CustomStagGrid(
                                    // onPress:(){
                                    //   uploadData(index,snapshot.data!);
                                    // },
                                      onTap: () => Get.to(
                                        MyCategory(
                                          productModel: snapshot.data![index],
                                        ),

                                         transition: Transition.zoom,
                                        duration: const Duration(milliseconds: 400)

                                  ),
                                      label: snapshot.data![index].title,
                                      image: snapshot.data![index].image,
                                      description:snapshot.data![index].description,
                                      price: "${snapshot.data![index].price}");
                                },
                              ));
                            }else{
                              return  Center(child:LoadingAnimationWidget.stretchedDots(color: MyColors.primary, size: 100));
                            }
                          },),

                        FutureBuilder<List<ProductModel>>(
                          future:controller.getProductJe(),
                          builder: (context, snapshot) {
                            if(snapshot.hasData){
                              return StaggeredGridView.countBuilder(
                                physics: const BouncingScrollPhysics(),
                                staggeredTileBuilder: (int index) =>
                                const StaggeredTile.count(1, 1.8),
                                crossAxisCount: 2,
                                itemCount: snapshot.data!.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return FadeAnimation(1.3, child: CustomStagGrid(
                                    // onPress:(){
                                    //   uploadData(index,snapshot.data!);
                                    // },
                                      onTap: () => Get.to(
                                        MyCategory(
                                          productModel: snapshot.data![index],
                                          // categoryModel: CategoryAllList[index]
                                        ),
                                         transition: Transition.zoom,
                                        duration: const Duration(milliseconds: 400)
                                      ),
                                      label: snapshot.data![index].title,
                                      image: snapshot.data![index].image,
                                      description:snapshot.data![index].description,
                                      price: "${snapshot.data![index].price}"));
                                },
                              );
                            }else{
                              return  Center(child:LoadingAnimationWidget.stretchedDots(color:MyColors.primary, size: 100));
                            }
                          },),

                        FutureBuilder<List<ProductModel>>(
                          future:controller.getProductMe(),
                          builder: (context, snapshot) {
                            if(snapshot.hasData){
                              return StaggeredGridView.countBuilder(
                                physics: const BouncingScrollPhysics(),
                                staggeredTileBuilder: (int index) =>
                                const StaggeredTile.count(1, 1.8),
                                crossAxisCount: 2,
                                itemCount: snapshot.data!.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return FadeAnimation(1.3, child: CustomStagGrid(
                                    // onPress:(){
                                    //   uploadData(index,snapshot.data!);
                                    // },
                                      onTap: () => Get.to(
                                        MyCategory(
                                          productModel: snapshot.data![index],
                                          // categoryModel: CategoryAllList[index]
                                        ),
                                         transition: Transition.zoom,
                                        duration: const Duration(milliseconds: 400)
                                      ),
                                      label: snapshot.data![index].title,
                                      image: snapshot.data![index].image,
                                      description:snapshot.data![index].description,
                                      price: "${snapshot.data![index].price}"));
                                },
                              );
                            }else{
                              return  Center(child:LoadingAnimationWidget.stretchedDots(color: MyColors.primary, size: 100));
                            }
                          },),

                        FutureBuilder<List<ProductModel>>(
                          future:controller.getProductWo(),
                          builder: (context, snapshot) {
                            if(snapshot.hasData){
                              return StaggeredGridView.countBuilder(
                                physics: const BouncingScrollPhysics(),
                                staggeredTileBuilder: (int index) =>
                                const StaggeredTile.count(1, 1.8),
                                crossAxisCount: 2,
                                itemCount: snapshot.data!.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return FadeAnimation(1.3, child: CustomStagGrid(
                                    // onPress:(){
                                    //   uploadData(index,snapshot.data!);
                                    // },
                                      onTap: () => Get.to(
                                        MyCategory(
                                          productModel: snapshot.data![index],
                                          // categoryModel: CategoryAllList[index]
                                        ),
                                         transition: Transition.zoom,
                                        duration: const Duration(milliseconds: 400)
                                      ),
                                      label: snapshot.data![index].title,
                                      image: snapshot.data![index].image,
                                      description:snapshot.data![index].description,
                                      price: "${snapshot.data![index].price}"));
                                },
                              );
                            }else{
                              return  Center(child:LoadingAnimationWidget.stretchedDots(color: MyColors.primary, size: 100));
                            }
                          },),



                        // StaggeredGridView.countBuilder(
                        //   physics: const BouncingScrollPhysics(),
                        //   staggeredTileBuilder: (int index) =>
                        //       const StaggeredTile.count(1, 1.8),
                        //   crossAxisCount: 2,
                        //   itemCount: CategoryList.length,
                        //   itemBuilder: (BuildContext context, int index) {
                        //     return CustomStagGrid(
                        //         onPress:()=>uploadData(index,CategoryAllList),
                        //
                        //         onTap: () => Get.to(
                        //               MyCategory(
                        //                   categoryModel: CategoryList[index]),
                        //             ),
                        //         label: "${CategoryList[index].name}",
                        //         image: "${CategoryList[index].image}",
                        //         description: "${CategoryList[index].description}",
                        //         price: "${CategoryList[index].price}");
                        //   },
                        // ),
                        // StaggeredGridView.countBuilder(
                        //   physics: const BouncingScrollPhysics(),
                        //   staggeredTileBuilder: (int index) =>
                        //       const StaggeredTile.count(1, 1.8),
                        //   crossAxisCount: 2,
                        //   itemCount: CategoryTableList.length,
                        //   itemBuilder: (BuildContext context, int index) {
                        //     return CustomStagGrid(
                        //          onPress:()=>uploadData(index,CategoryTableList),
                        //
                        //
                        //     onTap: () => Get.to(
                        //           MyCategory(
                        //               categoryModel: CategoryTableList[index]),
                        //         ),
                        //         label: "${CategoryTableList[index].name}",
                        //         image: "${CategoryTableList[index].image}",
                        //         description:
                        //             "${CategoryTableList[index].description}",
                        //         price: "${CategoryTableList[index].price}");
                        //   },
                        // ),
                        // StaggeredGridView.countBuilder(
                        //   physics: const BouncingScrollPhysics(),
                        //   staggeredTileBuilder: (int index) =>
                        //       const StaggeredTile.count(1, 1.8),
                        //   crossAxisCount: 2,
                        //   itemCount: CategorySofaList.length,
                        //   itemBuilder: (BuildContext context, int index) {
                        //     return CustomStagGrid(
                        //         onPress:()=>uploadData(index,CategorySofaList),
                        //
                        //         onTap: () => Get.to(
                        //           MyCategory(
                        //               categoryModel: CategorySofaList[index]),
                        //         ),
                        //         label: "${CategorySofaList[index].name}",
                        //         image: "${CategorySofaList[index].image}",
                        //         description:
                        //             "${CategorySofaList[index].description}",
                        //         price: "${CategorySofaList[index].price}");
                        //   },
                        // ),
                        // StaggeredGridView.countBuilder(
                        //   physics: const BouncingScrollPhysics(),
                        //   staggeredTileBuilder: (int index) =>
                        //       const StaggeredTile.count(1, 1.8),
                        //   crossAxisCount: 2,
                        //   itemCount: CategoryDeskList.length,
                        //   itemBuilder: (BuildContext context, int index) {
                        //     return CustomStagGrid(
                        //         onPress:()=>uploadData(index,CategoryDeskList),
                        //         onTap: () => Get.to(
                        //           MyCategory(
                        //               categoryModel: CategoryDeskList[index]),
                        //         ),
                        //         label: "${CategoryDeskList[index].name}",
                        //         image: "${CategoryDeskList[index].image}",
                        //         description:"${CategoryDeskList[index].description}",
                        //         price: "${CategoryDeskList[index].price}");
                        //   },
                        // ),
                      ]),
                )
              ],
            )),
      ),
    );
  }
}
