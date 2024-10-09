import 'package:flutter/material.dart';
import 'package:upalerts/appAssets/assets.dart';
import 'package:upalerts/res/res.dart';
import 'package:upalerts/screens/dashboard/alertScreenWidgets/add_custom_alert.dart';

class NoAlertScreen extends StatelessWidget{
  const NoAlertScreen({super.key,required this.activeScreen});
  final String activeScreen ;
  
  @override
  Widget build(BuildContext context) {
    String customText = activeScreen == "Portfolio"? "portfolio" : "custom alert";
    
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(Assets.alertsImage),
              SizedBox(height: getHeight() * 0.009),
               Text(
                activeScreen == "alert" ? "No Custom Alert Yet" : activeScreen == "activities" ? "No Activity Yet" : activeScreen == "Portfolio" ? "No Portfolio" : "",
                style:const TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: getHeight() * 0.003),
              Text(
                "It seems like you didn't add any $customText.\nKindly add one and get instant alert of your desire jobs",
                style: TextStyle(color: Colors.grey[500]),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: getHeight() * 0.008),
              activeScreen == "alert" ? InkWell(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AddCustomAlertScreen(),));
      
                },
                
                child: Container(
                    width: getWidth() * 0.12,
                    height: getHeight() * 0.023,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10)),
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.center
                      ,
                      children: [
                        const Text("Add Now",style: TextStyle(color:Colors.white),),
                        SizedBox(width:getWidth()*0.007),
                        const Icon(Icons.arrow_forward,color: Colors.white,),
                      ],
                    )),
              ) : const SizedBox(),
              SizedBox(height:getHeight()*0.02)
            ],
          ),
        ),
      ),
    );
  }
}