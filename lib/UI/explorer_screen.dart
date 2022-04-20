
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:truq_test/VIEWMODEL/food_viewmodel.dart';

import '../components/text_holder.dart';

class ExplorerScreen extends StatefulWidget {
  const ExplorerScreen({Key? key}) : super(key: key);

  @override
  State<ExplorerScreen> createState() => _ExplorerScreenState();
}

class _ExplorerScreenState extends State<ExplorerScreen> {

  FoodViewModel? _foodViewModel;

  @override
  void initState() {
    super.initState();
    _foodViewModel = FoodViewModel();
    // WidgetsBinding.instance?.addPostFrameCallback((_) {
    //   _foodViewModel?.getFood();
    // });
  }


  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _foodViewModel?.getFood();
    });
    return ScopedModel(
      model: _foodViewModel!,
      child: ScopedModelDescendant<FoodViewModel>(
        builder: (context , child, vm){
          return Scaffold(
            backgroundColor: Colors.white,
            body: _foodViewModel?.status ==  Status.LOADING ?
            Center(
              child:  CircularProgressIndicator(
                valueColor:AlwaysStoppedAnimation<Color>(Color(0xFFFFC700)),
              ),
            )
                : SingleChildScrollView(
              child:  Column(
                children: [
                  Gap(50),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.chevron_left_outlined),
                            BurgerText(title: "Explore",color: Colors.black,size: 14,fontWeight: FontWeight.w700,),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.search),
                            Gap(5),
                            SvgPicture.asset("assets/svg/cart_icon2.svg")
                          ],
                        )
                      ],
                    ),
                  ),
                  Gap(20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(image: AssetImage("assets/images/food.png"),
                              fit: BoxFit.cover
                          )
                      ),
                    ),
                  ),
                  Gap(16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BurgerText(title: "Global Steak",color: Colors.black,size: 16,fontWeight: FontWeight.w500,),
                        BurgerText(title: "\$30",color: Colors.black,size: 16,fontWeight: FontWeight.w500,),

                      ],
                    ),
                  ),
                  Gap(10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BurgerText(title: "Supreme King Size Double Steak Burger",color: Colors.black,size: 11,fontWeight: FontWeight.w300,),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color(0xFFFFC700)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                            child: BurgerText(title: "Add to Cart",color: Colors.black,fontWeight: FontWeight.w300,),
                          ),
                        )

                      ],
                    ),
                  ),
                  Gap(15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Divider(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: GridView.builder(
                      itemCount: _foodViewModel?.FoodList?.data?.length ?? 0,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Column(
                            children: [
                              ClipRRect(
                                child: SvgPicture.network(_foodViewModel?.FoodList?.data?[index].image ??"",placeholderBuilder: (cotext){
                                  return Image.asset("assets/images/food.png");
                                },height: 100,fit: BoxFit.cover,),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              Gap(5),
                              BurgerText(title: "${_foodViewModel?.FoodList?.data?[index].title}",color: Colors.black,size: 10,fontWeight: FontWeight.w600,),
                              Gap(15),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Color(0xFFFFC700)
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                                  child: BurgerText(title: "Add to Cart \$${_foodViewModel?.FoodList?.data?[index].price}",color: Colors.black,fontWeight: FontWeight.w300,size: 10,),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 17.0,
                        mainAxisExtent: 165,
                        mainAxisSpacing: 50.0,
                      ),),
                  )
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
