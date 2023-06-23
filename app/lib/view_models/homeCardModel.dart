import 'package:app/utils/colors.dart';
import 'package:app/utils/fontFamily.dart';
import 'package:flutter/material.dart';
class HomeCardModel extends StatelessWidget{
  String? day;
  String? recipe;
  String? preparation_time;
  String? imagePath;
  String? star;

  HomeCardModel(
      String recipe, String preparation_time, String imagePath,String star) {
    this.recipe = recipe;
    this.preparation_time = preparation_time;
    this.imagePath = imagePath;
    this.star = star;
  }

  @override
  Widget build(BuildContext context) {
    return (Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.70,
                height: MediaQuery.of(context).size.width * 0.45,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        '$imagePath'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.7),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.all(20),
                  //margin: EdgeInsets.all(10),
                  child:  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child:  Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(width: 50,height: 30,decoration: BoxDecoration(borderRadius: BorderRadius.circular(6),color:AppColors.goldColor ),child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                children: [
                                  Icon(Icons.star,color: AppColors.starColor,size: 15,),
                                  SizedBox(width: 3,),
                                  Text("$star",style: TextStyle(color: Colors.black,fontFamily: AppFontFamily.fontFamily),)
                                ],
                              ),
                            ),)
                          ],
                        ),
                        flex: 4,
                      ),
                      Expanded(
                        child:  SizedBox(height:3 ,),
                        flex: 3,
                      ),
                      Expanded(
                        flex: 5,
                        child:  Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '$recipe',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: AppFontFamily.fontFamily,
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              'can be cooked in $preparation_time',
                              style: TextStyle(
                                color: Colors.grey,
                                fontFamily: AppFontFamily.fontFamily,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            )
          ],
        ),
        SizedBox(height: 20,)
      ],
    ));
  }
}