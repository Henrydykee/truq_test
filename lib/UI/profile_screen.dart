
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:truq_test/components/text_holder.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width:  MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/Group45.png"),
            fit: BoxFit.cover
          )
        ),
        child: SingleChildScrollView(

          child: Column(
            children: [
              Gap(50),
              CircleAvatar(
                backgroundColor: Colors.white,
                child: Image.asset("assets/images/picture.png"),
                radius: 70,
              ),
              Gap(12),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24 ,vertical: 5),
                  child: BurgerText(title: "Buyer",color: Colors.black,size: 12,),
                ),
              ),
              Gap(11),
              BurgerText(title: "Semedo Dapaah",color: Colors.white,size: 15,fontWeight: FontWeight.w700,),
              Gap(6),
              BurgerText(title: "Head Cook /  Marina, Lagos",color: Colors.white,size: 12,),
              Gap(11),
              SvgPicture.asset("assets/svg/socials.svg",height: 15,),
              Gap(30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(13.0),
                    child:  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                BurgerText(title: "Commentaries",color: Colors.black,size: 14,fontWeight: FontWeight.w300,),
                                BurgerText(title: "11",color: Colors.black,size: 14,fontWeight: FontWeight.w700,),
                              ],
                            ),
                            Gap(30),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                BurgerText(title: "Orders",color: Colors.black,size: 14,fontWeight: FontWeight.w300,),
                                BurgerText(title: "86",color: Colors.black,size: 14,fontWeight: FontWeight.w700,),
                              ],
                            )
                          ],
                        ),
                        Gap(20),
                        Divider(),
                        Gap(12),
                        BurgerText(title: "About",color: Colors.black,size: 13,fontWeight: FontWeight.w300,),
                        Gap(20),
                        BurgerText(title: "Hello, we want you to work with us in developing a great meal profile. We use this platform to improve our services and give feedback to our customers",color: Colors.black,size: 13,fontWeight: FontWeight.w200,),
                        Gap(16),
                        Divider(),
                        Gap(20),
                        BurgerText(title: "Contact",color: Colors.black,size: 14,fontWeight: FontWeight.w300,),
                        Gap(15),
                        Row(
                          children: [
                            Icon(Icons.phone_android,color: Colors.black,),
                            BurgerText(title: "+0 123 4456 7890",color: Color(0xFF979797),size: 14,fontWeight: FontWeight.w300,),
                          ],
                        ),
                        Gap(15),
                        Row(
                          children: [
                            Icon(Icons.mail,color: Colors.black,),
                            BurgerText(title: "hello@mytruq.com",color: Color(0xFF979797),size: 14,fontWeight: FontWeight.w300,),
                          ],
                        ),
                        Gap(37),
                        Divider(),
                        Gap(20),
                        Center(child: Icon(Icons.keyboard_arrow_down,color: Colors.black,size: 30,)),

                    ],)
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
