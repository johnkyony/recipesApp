import 'package:flutter/material.dart';

import 'package:recipes_app/ui/widgets/googleSignInButton.dart';


class LoginScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    //private methods within build method help us to 
    //organize our code and recognize structure of widget 
    //that we're building

    
    Text _buildText(){
      return Text(
        'Recipes',
        style: Theme.of(context).textTheme.headline,
        textAlign: TextAlign.center,
      );
    }

    //New private method which includes the background image:
    BoxDecoration _buildBackground(){
      return BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/brooke-lark-385507-unsplash.jpg"),
          fit: BoxFit.cover)
      );
    }

    return Scaffold(
      // We do not use backgroundColor property anymore.
      // New Container widget wraps our Center widget:
      body: Container(
        decoration: _buildBackground(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildText(),
              SizedBox(height: 50.0),
              //passing function callback as constructor argument
              GoogleSignInButton(
                // we replace the current page. 
                //after navigating to the replacement , it's not possible
                //to go back to the previous screen:
                onPressed: () => Navigator.of(context).pushReplacementNamed('/'),
                )
              // MaterialButton(
              //   color: Colors.white,
              //   child: Text("Sign In with Google"),
              //   onPressed: () => print("Button pressed."),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}