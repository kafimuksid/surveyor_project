import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SurveyForm extends StatefulWidget {
  SurveyForm({Key key}) : super(key: key);
  @override
  _SurveyFormState createState() => _SurveyFormState();
}

enum MultipleChoiceAns { select, verygood, good, neutral, bad, verybad }
MultipleChoiceAns _mood = MultipleChoiceAns.select;

class _SurveyFormState extends State<SurveyForm> {
  String stringResponse;
  List listResponse;
  Map mapResponse1;
  Map mapResponse2;
  Map mapResponse3;
  Map mapResponse4;
  Map mapResponse5;
  Map mapResponseq1;
  Map mapResponseq2;
  Map mapResponseq3;
  Map mapResponseq4;
  Map mapResponseq5;
  Map mapResponset1;
  Map mapResponset2;
  Map mapResponset3;
  Map mapResponset4;
  Map mapResponset5;

  Future fetchdata() async {
    http.Response response;
    response = await http
        .get('https://example-response.herokuapp.com/getSurvey'); //API URL
    if (response.statusCode == 200) {
      setState(() {
        listResponse = json.decode(response.body);

        //individual question sets getting sorted
        mapResponse1 = listResponse[0];
        mapResponse2 = listResponse[1];
        mapResponse3 = listResponse[2];
        mapResponse4 = listResponse[3];
        mapResponse5 = listResponse[4];

        //individual ques getting sorted of individual ques sets
        mapResponseq1 = mapResponse1['question'];
        mapResponseq2 = mapResponse2['question'];
        mapResponseq3 = mapResponse3['question'];
        mapResponseq4 = mapResponse4['question'];
        mapResponseq5 = mapResponse5['question'];

        //individual types getting sorted of individual ques sets
        mapResponset1 = mapResponse1['type'];
        mapResponset2 = mapResponse2['type'];
        mapResponset3 = mapResponse3['type'];
        mapResponset4 = mapResponse4['type'];
        mapResponset5 = mapResponse5['type'];
      });
    }
  }

  @override
  void initState() {
    fetchdata();
    super.initState();
  }

  typeChecker(types) {
    if (types == 'text') {
      TextFormField(
        decoration: InputDecoration(
          icon: Icon(Icons.home),
          hintText: 'Write your answer here *', //survey form textbox
        ),
        keyboardType: TextInputType.text,
        validator: (text) {
          //textbox validator
          if (text == null || text.isEmpty) {
            return 'Text is empty';
          }
        },
      );
    } else if (types == 'number') {
      TextFormField(
        decoration: InputDecoration(
          icon: Icon(Icons.phone),
          hintText: 'Your contact number', //survey form contact
        ),
        keyboardType: TextInputType.phone,
        // validator: (text) {
        //   //phone validator
        //   if (text == null || text.isEmpty) {
        //     return 'Text is empty';
        //   }
        // },
      );
    } else if (types == 'multiple choice') {
      Column(
        children: <Widget>[
          ListTile(
            title: const Text('Thomas Jefferson'),
            leading: Radio(
              value: MultipleChoiceAns.select,
              groupValue: _mood,
              onChanged: (MultipleChoiceAns value) {
                setState(() {
                  _mood = value;
                });
              },
            ),
          ),
        ],
      );
    }

    // return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('Survey')),
      body: listResponse == null
          ? Container()
          : Column(
              children: <Widget>[
                Text(
                  mapResponseq1.toString(),
                ),
                SizedBox(
                  height: 10.0,
                ),
                typeChecker(mapResponset1.toString()),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  mapResponseq2.toString(),
                ),
              ],
            ),
    );
  }
}
