import 'package:flutter/material.dart';

import './survey.dart';

Future goToSurveyForm(context) async {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => SurveyForm()));
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(centerTitle: true, title: Text('Home')),
        body: Center(
            child: Container(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Flexible(
                      child: Text(
                        'Hello Dear User! Are you in mood for a quick survey?',
                        textAlign: TextAlign.center,
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                            fontFamily: 'ArchitectsDaughter',
                            fontSize: 25.0,
                            color: Colors.deepOrange),
                        maxLines: 3,
                      ),
                    ),
                    SizedBox(height: 70.0),
                    FloatingActionButton.extended(
                      heroTag: "btn1",
                      onPressed: () {
                        goToSurveyForm(context);
                      },
                      icon: Icon(Icons.assignment),
                      label: Text(
                        'Take the survey',
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Colors.purple[900],
                    ),
                    SizedBox(height: 20.0),
                    FloatingActionButton.extended(
                      heroTag: "btn2",
                      onPressed: () {
                        // Add your onPressed code here!
                      },
                      icon: Icon(Icons.dashboard),
                      label: Text(
                        'See previous surveys',
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Colors.purple[900],
                    ),
                  ],
                ))

            /*Card( 
            color: Colors.grey[300],
            elevation: 10.0,
            child: Container(
                height: 100.0,
                width: 100.0,
                alignment: Alignment.center,
                child: Text(
                  'Welcome Home!',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20.0),
                )),
          ),*/
            ));
  }
}

// void goToSurveyForm() {
//   Navigator.of(context).push(MaterialPageRoute(builder: (context) {
//     return SurveyForm();
//   }));
// }
