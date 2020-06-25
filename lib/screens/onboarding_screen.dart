import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_onboarding_2/utilities/styles.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage =0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }
  Widget _indicator(bool isActive){
    return AnimatedContainer(duration: Duration(microseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8),
      height: 8,
      width: isActive?24:16,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Color(0xFF7851D3),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            stops: [0.1,0.4,0.7,0.9],
            colors: [
              Color(0xFF3594DD),
              Color(0xFF4563DB),
              Color(0xFF5036D5),
              Color(0xFF5B16D0),
            ],
          ),
        ),
          child: Padding(
            padding:  EdgeInsets.symmetric(vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children:<Widget>[
                Container(
                  alignment: Alignment.centerRight,
                  child: FlatButton(
                      onPressed: () => print('Skip'),
                    child: Text(
                      "Skip",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                    ),
                    ),
                ),
                ),
                    Container(
                      height: 600,
                      child: PageView(
                        physics: ClampingScrollPhysics(),
                          controller: _pageController,
                          onPageChanged: (int page){
                          setState(() {
                            _currentPage = page;
                          });
                          },
                        children:<Widget>[
                          Padding(
                            padding:  EdgeInsets.all(40),
                            child: Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                              children:<Widget>[
                                Center(
                                  child:Image(
                                    image: AssetImage(
                                      "assets/images/onboarding0.png",
                                    ),
                                    height: 300,
                                    width: 300,
                                  ),
                                ),
                                SizedBox(height: 30,),
                                Text(
                                  "Connect people\naround the world",
                                  style: kTitleStyle,
                                ),
                                SizedBox(height: 15,),
                                Text(
                                  "Lorem ipsum dolor sit amet, consect adipiscing elit, sed do eiusmod tempor incididunt ut labore et.",
                                  style: kSubtitleStyle,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:  EdgeInsets.all(40),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:<Widget>[
                                Center(
                                  child:Image(
                                    image: AssetImage(
                                      "assets/images/onboarding1.png",
                                    ),
                                    height: 300,
                                    width: 300,
                                  ),
                                ),
                                SizedBox(height: 30,),
                                Text(
                                  "Live your life master\nwith us!",
                                  style: kTitleStyle,
                                ),
                                SizedBox(height: 15,),
                                Text(
                                  "Lorem ipsum dolor sit amet, consect adipiscing elit, sed do eiusmod tempor incididunt ut labore et.",
                                  style: kSubtitleStyle,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:  EdgeInsets.all(40),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:<Widget>[
                                Center(
                                  child:Image(
                                    image: AssetImage(
                                      "assets/images/onboarding2.png",
                                    ),
                                    height: 300,
                                    width: 300,
                                  ),
                                ),
                                SizedBox(height: 30,),
                                Text(
                                  "Get a new experience\nof inagination",
                                  style: kTitleStyle,
                                ),
                                SizedBox(height: 15,),
                                Text(
                                  "Lorem ipsum dolor sit amet, consect adipiscing elit, sed do eiusmod tempor incididunt ut labore et.",
                                  style: kSubtitleStyle,
                                ),
                              ],
                            ),
                          ),
                          ],
                    ),
                    ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                children:_buildPageIndicator(),
                ),
                _currentPage !=  _numPages - 1
                ?Expanded(
                    child: Align(
                      alignment: FractionalOffset.bottomRight,
                      child: FlatButton(onPressed:(){
                        _pageController.nextPage(
                          duration: Duration(microseconds: 500),
                          curve: Curves.ease,
                        );
                      },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children:<Widget>[
                            Text(
                                "Next",
                            style: TextStyle(
                              fontSize: 22,
                            color: Colors.white,
                            ),
                            ),
                            SizedBox(width: 10,),
                            Icon(Icons.arrow_forward,color: Colors.white,size: 30,)
                          ],
                        ),
                      ),
                    ),
                )
                :Text(""),
              ],
          ),
        ),
      ),
      ),

      bottomSheet: _currentPage == _numPages -1? Container(
        height:  90,
        width: double.infinity,
        color: Colors.white,
        child: GestureDetector(
          onTap: ()=>print("Get Started"),
          child: Center(
            child: Padding(
                padding: EdgeInsets.only(bottom: 20),
            child: Text(
              "Get started",
              style: TextStyle(
                  color: Color(0xFF5B16D0),
              fontSize: 20,
              fontWeight:FontWeight.bold,
              ),
            ),
            ),
          ),
        ),
      ):Text(""),
    );
  }
}
