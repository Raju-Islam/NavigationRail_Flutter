import 'package:flutter/material.dart';
import 'wifi.dart';
import 'bluetooth.dart';
void main()=>runApp(MaterialApp(debugShowCheckedModeBanner: false, home:HomePage()));
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _selectedIndex=0;
  final _pages=[
        wifi(),
        bluetooth()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: Text("Nevigation Rail"),
      ),
      body: Container(
        child: Row(
          children:<Widget>[
          Card(
            elevation: 12,
                      child: NavigationRail(
              backgroundColor: Colors.black54,
             labelType: NavigationRailLabelType.all,
              destinations: [
              
              NavigationRailDestination(icon: Icon(Icons.wifi,color: Colors.white,),
              label: Text("wifi"),
              selectedIcon: Icon(Icons.wifi,color: Colors.blue,),
              ),

              NavigationRailDestination(icon: Icon(Icons.bluetooth,color: Colors.white,),
              label: Text("Bluetooth"),
              selectedIcon: Icon(Icons.bluetooth,color: Colors.blue,)
              ),
            ], selectedIndex: _selectedIndex,
            onDestinationSelected: (val){
              setState(() {
                _selectedIndex=val;
              });

            },
            ),
          ),
          Expanded(child: Container(
          child: _pages[_selectedIndex],
          ),
          )
          
          ],
        ),
      ),
    );
  }
}