import 'package:flutter/material.dart';
import 'package:upalerts/appAssets/assets.dart';
import 'package:upalerts/res/res.dart';
class RegisterSuccessModalSheet extends StatelessWidget{
  const RegisterSuccessModalSheet({super.key});
  @override
  Widget build(BuildContext context) {
   return SizedBox(
    height:getHeight()*0.4,
    width:getWidth(),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(Assets.tickIllustration),
          SizedBox(height:getHeight()*0.01),
          const Text("Success!",style: TextStyle(fontSize:20,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
SizedBox(height:getHeight()*0.01),
          SizedBox(width:getWidth()*0.2 ,child: const Text("Your account has been created successfully!",style: TextStyle(fontSize:15,),textAlign: TextAlign.center,)),
        SizedBox(height:getHeight()*0.01),
                        ElevatedButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
    
                    backgroundColor: Colors.green,
                    shadowColor: Colors.white,
                    splashFactory: InkSparkle.splashFactory,
                    padding:  EdgeInsets.symmetric(vertical: 15,horizontal:getWidth()*0.085),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'Done',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),

      ],),
    ),
   );
  }
}