import 'package:flutter/material.dart';
import 'package:wether_aplecerion/AppColors/app_colors.dart';
  
class NextdaysStatus extends StatefulWidget {
  const NextdaysStatus({Key? key}) : super(key: key);

  @override
  State<NextdaysStatus> createState() => _NextdaysStatusState();
}
class _NextdaysStatusState extends State<NextdaysStatus> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 50),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "The Next 5 days",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
          Column(
            children: [
              const Text(
                "Sunday",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
              ),
              const SizedBox(height: 10),
              Container(
                height: 100,
                width: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    width: 3,
                    color: AppColors.borderColor,
                    style: BorderStyle.solid,
                  ),
                ),
                child:  Center(
                  child: Column(children: [
                    Image.asset("assets/icons/ic_rain_snow.png",height: 30,width: 30),
                    const SizedBox(height: 8),
                    const Text("10 C",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                  ],),
                ),
              ),
            ],
          ),
          Column(
            children: [
              const Text(
                "Monday",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
              ),
              const SizedBox(height: 10),
              Container(
                height: 100,
                width: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    width: 3,
                    color: AppColors.borderColor,
                    style: BorderStyle.solid,
                  ),
                ),
                child:  Center(
                  child:Column(children: [
                    Image.asset("assets/icons/ic_lighting.png",height: 30,width: 30),
                    const SizedBox(height: 8),
                    const Text("8 C",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                  ],),
                ),
              ),
            ],
          ),
          Column(
            children: [
              const Text(
                "Tuesday",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
              ),
              const SizedBox(height: 10),
              Container(
                height: 100,
                width: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    width: 3,
                    color: AppColors.borderColor,
                    style: BorderStyle.solid,
                  ),
                ),
                child:  Center(
                  child: Column(children: [
                    Image.asset("assets/icons/ic_wint.png",height: 30,width: 30),
                    const SizedBox(height: 8),
                    const Text("3 C",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                  ],),
                ),
              ),
            ],
          ),
          Column(
            children: [
              const Text(
                "Thursday",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
              ),
              const SizedBox(height: 10),
              Container(
                height: 100,
                width: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    width: 3,
                    color: AppColors.borderColor,
                    style: BorderStyle.solid,
                  ),
                ),
                child:  Center(
                  child: Column(children: [
                    Image.asset("assets/icons/ic_thunder.png",height: 30,width: 30),
                    const SizedBox(height: 8),
                    const Text("5 C",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                  ],),
                ),
              ),
            ],
          ),
          Column(
            children: [
              const Text(
                "Friday",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
              ),
              const SizedBox(height: 10),
              Container(
                height: 100,
                width: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    width: 3,
                    color: AppColors.borderColor,
                    style: BorderStyle.solid,
                  ),
                ),
                child:  Center(
                  child: Column(children: [
                    Image.asset("assets/icons/ic_cloude.png",height: 30,width: 30),
                    const SizedBox(height: 8),
                    const Text("9 C",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                  ],),
                ),
              ),
            ],
          )
        ]),
      ],
    );
  }
}
