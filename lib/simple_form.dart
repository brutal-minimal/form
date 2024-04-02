import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'pisulki.dart';
int defaultRed = 255;
int defaultGreen = 255;

Color defaultColor = Color.fromARGB(255, defaultRed, defaultGreen, 100);


class SimpleFormPage extends StatefulWidget {
  const SimpleFormPage({Key? key}) : super(key: key);

  @override
  SimpleFormPageState createState() => SimpleFormPageState();
}

class SimpleFormPageState extends State<SimpleFormPage> {
  // controller stores user input and provides access to it
  final redController = TextEditingController();
  final greenController = TextEditingController();

  late int userRed;
  late int userGreen;
  late Color userColor = Color.fromARGB(255, userRed, userGreen, 100);

  @override
  void initState() {
    userRed = defaultRed;
    userGreen = defaultGreen;
    userColor = defaultColor;
    super.initState();
  }

    colorChange(){
    //print (userColor);
    //print ("this is defaultRed: $defaultRed");
    //print ("this is user red : ~$userRed");
    //print("this is user green : ~$userGreen");
    //print (userGreen);
    defaultColor = userColor;
    setState(() {
      
    });
    
  }

  void onSavedRed(value){
    userRed = int.parse(value);
    _formKey.currentState!.setState(() {
    });
  }
    void onSavedGreen(String value) {
    userGreen = int.parse(value);
    _formKey.currentState!.save() ;

  }
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input Form'),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: ListView(padding: const EdgeInsets.all(16.0), children: [
          const SizedBox(height: 10),
          TextFormField(
            controller: redController,
            decoration: InputDecoration(
              labelText: 'Red',
              helperText: 'Value from 0 to 255',
              prefixIcon: const Icon(
                Icons.circle,
                color: Colors.redAccent,
              ),
              suffixIcon: GestureDetector(
                onLongPress: () {
                  redController.clear();
                },
                child: const Icon(
                  Icons.delete_outline,
                  color: Colors.red,
                ),
              ),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                borderSide: BorderSide(color: Colors.black, width: 2.0),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                borderSide: BorderSide(color: Colors.blue, width: 2.0),
              ),
            ),
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            onChanged: onSavedRed,
          ),
          const SizedBox(height: 10),
          //////////////////////////////////////////////////////////////////////7//////////////////
          /////////////////////G  R  E  E  N///////////////////////////////////////////////////////
          TextFormField(
            controller: greenController,
            decoration: InputDecoration(
              labelText: 'Green',
              helperText: 'Value from 0 to 255',
              prefixIcon: const Icon(Icons.circle, color: Colors.green),
              suffixIcon: GestureDetector(
                onLongPress: () {
                  greenController.clear();
                },
                child: const Icon(
                  Icons.delete_outline,
                  color: Colors.red,
                ),
              ),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                borderSide: BorderSide(color: Colors.black, width: 2.0),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                borderSide: BorderSide(color: Colors.blue, width: 2.0),
              ),
            ),
            keyboardType: TextInputType.number,
            //onSaved: (value) => userGreen = value as int,
            onSaved: (value){onSavedGreen; setState(() {});},
            
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: colorChange,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              textStyle: const TextStyle(color: Colors.white),
            ),
            child: const Text('Submit'),
            //color: Colors.green,
          ),
          const SizedBox(height: 15),
          ColorfulRectangle()
          
        ]),
      ),
    );
  }
}

class ColorfulRectangle extends StatefulWidget {
  const ColorfulRectangle({
    super.key,
  });

  @override
  State<ColorfulRectangle> createState() => _ColorfulRectangleState();
}

class _ColorfulRectangleState extends State<ColorfulRectangle> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: defaultColor,
      height: 100,
      width: 100,
    );
  }
}

