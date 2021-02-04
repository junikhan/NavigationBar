
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Dashboard extends StatelessWidget {




  @override
  Widget build(BuildContext context)
  {

    return MaterialApp(

      debugShowCheckedModeBanner: false,



      home: HomePage(),
    );


  }
}

class HomePage extends StatefulWidget
{
  @override
  _HomePageState createState() => _HomePageState();


}


class _HomePageState extends State<HomePage>
{
  static var chartdisplay;

  void initState()
  {
    setState(()
    {
       var data =
       [
         addcharts("val1",10),
         addcharts("val2",20),
         addcharts("val3",30),
         addcharts("val4",40),
         addcharts("val5",50),
         addcharts("val6",60),
         addcharts("val7",70),

       ];

       var series = [charts.Series(
         domainFn: (addcharts addcharts,_) => addcharts.label,
         measureFn: (addcharts addcharts,_) => addcharts.value,
         id : 'addcharts',
         data : data,
       ),];

       chartdisplay = charts.BarChart(
         series,
         animationDuration: Duration(microseconds: 2000),
       );

    });
  }


  Material myItems(IconData icon,String heading,int color){
    return Material(
      color: Colors.white,
      elevation: 14.0,
      shadowColor: Colors.grey,
      borderRadius: BorderRadius.circular(24.0),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child:
                    //Text part
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(heading,
                        style: TextStyle(
                            color: new Color(color),
                            fontSize: 20.0
                        ),
                      ),
                    ),


                  ),

                  Material(
                    color: new Color(color),
                    borderRadius: BorderRadius.circular(24.0),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Icon(
                        icon,
                        color: Colors.white,
                        size: 30.0,
                      ),
                    ),
                  ),



                ],

              )
            ],
          ),
        ),



      ),

    );
  }


  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(

        title: Text("Dashboard",
            style: TextStyle(
              color: Colors.white,
            )),
        centerTitle:true,
        leading: IconButton(icon: Icon(Icons.arrow_back),
            onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ));

            }
        ),
      ),

      body:StaggeredGridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 12.0,
        padding: EdgeInsets.symmetric(horizontal: 16.0,vertical: 8.0),
        children: <Widget>[
          myItems(Icons.add_alert,"ALERT",0xfff44336),
          myItems(Icons.ad_units,"22.13",0xffed622b),
          myItems(Icons.ad_units,"0",0xffed622b),
          myItems(Icons.read_more_outlined,"22.13",0xffed622b),
          myItems(Icons.date_range,"2/2/2021",0xffed622b),
          Expanded(
            flex: 3,
            child:Container(
              padding: EdgeInsets.all(40.0),
              height: MediaQuery.of(context).size.height*0.30,
              color: Colors.white,
              child: chartdisplay,
            ),
          ),
          Expanded(
            flex: 3,
            child:Container(
              padding: EdgeInsets.all(40.0),
              height: MediaQuery.of(context).size.height*0.30,
              color: Colors.white,
              child: chartdisplay,
            ),
          ),




        ],
        staggeredTiles: [
          StaggeredTile.extent(2, 130.0),
          StaggeredTile.extent(1, 150.0),
          StaggeredTile.extent(1, 150.0),
          StaggeredTile.extent(1, 150.0),
          StaggeredTile.extent(1, 150.0),
          StaggeredTile.extent(2, 250.0),
          StaggeredTile.extent(2, 250.0),


        ],
      ),




    );
  }
}


class addcharts
{
  final String label;
  final int value;

  addcharts(this.label,this.value);
}

