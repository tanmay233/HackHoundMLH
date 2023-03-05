import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:testing_add_subtract_of_items/productlist.dart';

class PieChartMaker2 extends StatefulWidget {
  const PieChartMaker2({Key? key}) : super(key: key);

  @override
  State<PieChartMaker2> createState() => _PieChartMakerState();
}

class _PieChartMakerState extends State<PieChartMaker2> {
  String displayInstitute ="Cusines";
  String year="Click to";
  String valueInstitute = "View";
  int touchedIndex= -1;
  Color textColor = Colors.brown; //textColor for data display

  List<String> yearReceived = [
    "Mars Special","Bevrages","Alien Salad","Fast Food","Alien Special ","Combos"
  ];

  List<String> numInstitute =[
    "","","","","",""
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // height: 400,
      // width: 600,
      body: Stack(
        children: [
          Material(
            color: Colors.white,
            elevation: 200,
            child: Container(
              decoration:  const BoxDecoration(
                shape: BoxShape.circle,
                // color: Colors.green,
              ),
              child: PieChart(
                PieChartData(
                    pieTouchData: PieTouchData(touchCallback: (FlTouchEvent event, pieTouchResponse){
                      setState(() {
                        if(!event.isInterestedForInteractions ||
                            pieTouchResponse == null ||
                            pieTouchResponse.touchedSection == null){
                          touchedIndex = -1;
                          return;
                        }
                        touchedIndex = pieTouchResponse.touchedSection!.touchedSectionIndex;
                        year = yearReceived[touchedIndex];
                        displayInstitute = "Cusine";
                        valueInstitute = numInstitute[touchedIndex];

                      });
                    }),
                    borderData: FlBorderData(show: false,),
                    sectionsSpace: 0,
                    centerSpaceRadius: 90,
                    sections: showingSections()
                ),
              ),
            ),
          ),
          Padding( //for elevated circle
            padding: const EdgeInsets.fromLTRB(82, 80, 80, 80),
            child: Material(
              elevation: 130,
              shadowColor: Colors.transparent,
              //shadowColor: Colors.red,
              shape: const CircleBorder(side: BorderSide.none),
              child: Container(
                //color: Colors.red,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  <Widget>[
              Center(
                  child: Text(
                    displayInstitute,
                    style: TextStyle(color: textColor,fontSize: 30,fontWeight: FontWeight.bold),
                  )
              ),
              const SizedBox(height: 10,),
              Center(
                child: Text(
                  year,
                  style: TextStyle(color: textColor,fontSize: 25,fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10,),
              Center(
                child: Text(
                  valueInstitute,
                  style: TextStyle(color: textColor,fontSize: 26,fontWeight: FontWeight.bold),
                ),
              ),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> productlist()));
                },
                child: Container(
                  child: Text("Order Now"),
                )
              )
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 190,
            padding: EdgeInsets.fromLTRB(40, 110, 10, 20),
            child: Text(
              "Mars Menu",
              style: TextStyle(color: Colors.white,fontSize: 26,fontWeight: FontWeight.bold),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(25),bottomLeft: Radius.circular(25)),
              color: Colors.black,
            ),

          ),

        ],
      ),
    );
  }

  List<PieChartSectionData> showingSections() {

    return List.generate(6, (i) {
      //final showYear = yearReceived[i];  //for displaying title on pie chart surface
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 95.0 : 80.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Colors.orange.shade300,
            //value: 40,
            showTitle: false,
            //title: showYear,
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 1:
          return PieChartSectionData(
            color: Colors.orange.shade800,
            //value: 30,
            //title: showYear,
            showTitle: false,
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 2:
          return PieChartSectionData(
            color: Colors.orange.shade700,
            //value: 15,
            //title: showYear,
            showTitle: false,
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 3:
          return PieChartSectionData(
            color: Colors.orange.shade200,
            //value: 15,
            //title: showYear,
            showTitle: false,
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 4:
          return PieChartSectionData(
            color: Colors.orange.shade400,
            //value: 15,
            //title: showYear,
            showTitle: false,
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 5:
          return PieChartSectionData(
            color: Colors.orange.shade600,
            //value: 15,
            //title: showYear,
            showTitle: false,
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );

        default:
          throw Error();
      }
    });
  }
}