import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);
  static const routeName = '/MainPage';

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool isClick = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/day6_10.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: Container(
              color: Colors.black45,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Center(
                          child: Image.asset(
                            'assets/images/logo.png',
                            width: 250.0,
                          ),
                        ),
                        Center(
                          child: Text(
                            'DAY6 STREAMING',
                              style: GoogleFonts.caveatBrush(
                                  textStyle: Theme.of(context).textTheme.headline1),
                          ),
                        ),

                      ],
                    ),
                  ),
                  Expanded(

                    child: Padding(
                      padding: const EdgeInsets.all(150.0),
                      child: InkWell(
                        child: Center(
                          child: Text(
                            'Tap',
                            style: Theme.of(context).textTheme.headline3,
                          ),
                        ),
                        onTap: _handleClickButton,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

        ),
      ),
    );
  }
  _handleClickButton(){
    isClick = true;
    if (isClick == true){
      Navigator.pushReplacementNamed(context, '/PlayList');
    }else{
      SizedBox.shrink();
    }

  }
}
