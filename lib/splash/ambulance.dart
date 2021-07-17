import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EmergencyDashboard extends StatefulWidget {
  @override
  _EmergencyDashboardState createState() => _EmergencyDashboardState();
}

class _EmergencyDashboardState extends State<EmergencyDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Color(0xFFEEEEEE),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.red,
        title: Text("EMERGENCY"),
      ),
      body: SingleChildScrollView(padding:EdgeInsets.symmetric(horizontal: 5.0,vertical: 3.0),
      child:Column(
        children: <Widget>[
          _buildEmergencyOptions(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Here is a list of hospitals around you", style: TextStyle(color: Colors.black, fontSize: 18.0),),
          ),
          _buildHospitalList(),
        ],
      ),
    ),
    );
  }

  Widget _buildEmergencyOptions() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.red,
        child: InkWell(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Icon(
                    FontAwesomeIcons.ambulance,
                    size: 40.0,
                    color: Colors.white,
                  ),
                  flex: 1,
                ),
                Expanded(
                  child: Center(
                      child: Text(
                        "Call an ambulance \nto your location",
                        style: TextStyle(fontSize: 20.0, color: Colors.white),
                      )),
                  flex: 3,
                )
              ],
            ),
          ),
          onTap: () {

          },
        ),
      ),
    );
  }

  Widget _buildHospitalList() {
    return ListView(
      children: <Widget>[
        _buildHospitalCard("Civil Hospital","9955446622", "uttrakhand"),
        _buildHospitalCard("DMC Hospital","9966554477", "uttrakhand"),
        _buildHospitalCard("Fortis Hospital","885544215465", "uttrakhand"),
      ],
      shrinkWrap: true,
    );
  }

  Widget _buildHospitalCard(String hospitalName,String number, String address) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(hospitalName, style: TextStyle(fontSize: 22.0,),),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(number, style: TextStyle(fontSize: 16.0),),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(address, style: TextStyle(fontSize: 16.0),),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
