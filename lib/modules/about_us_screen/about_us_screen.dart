import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:msp_ainshams/data/shared/constants/constants.dart';
import 'package:msp_ainshams/data/shared/network/web_view/web_view.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.29,
            width: double.infinity,
            child: Stack(
              children: [
                Positioned(
                  right: 0,
                  child: Image.asset('assets/images/cover.png'),
                ),
                Positioned(
                  top: 50,
                  left: 20,
                  child: Text(
                    'About Us',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.15,
                  left: 20,
                  child: Text(
                    'Follow Us',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.2,
                  left: 15,
                  child: Row(
                    children: [
                      buildSocialFollow(FontAwesomeIcons.youtube, Colors.red,
                          Colors.red.shade900, 2, context),
                      buildSocialFollow(FontAwesomeIcons.facebook, Colors.blue,
                          Colors.blue.shade900, 0, context),
                      buildSocialFollow(
                          FontAwesomeIcons.linkedin,
                          Colors.lightBlue,
                          Colors.lightBlue.shade700,
                          1,
                          context),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('MSP Tech Club _ Ain Shams University',style: Theme.of(context).textTheme.bodyText1,),
                SizedBox(height: MediaQuery.of(context).size.height*0.015,),
                Text('we are a student community program that promotes advanced technology through education, practice ,and innovation. It also provodes students with both technical and non-lives with high level of skills and supporting their careers with opportunities',
                  style: Theme.of(context).textTheme.headline2,),
                SizedBox(height: MediaQuery.of(context).size.height*0.02,),

                Text('OUR MISSION',style: Theme.of(context).textTheme.bodyText1,),
                SizedBox(height: MediaQuery.of(context).size.height*0.015,),
                Text('we have a clear mission is to help the students in the campus and to be there for any kind of support needed whether its technical and to help them find their most suitable career.',
                  style: Theme.of(context).textTheme.headline2,
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.02,),

                Text('PRODUCTS',style: Theme.of(context).textTheme.bodyText1,),
                SizedBox(height: MediaQuery.of(context).size.height*0.015,),
                Text('Technical Sessions, SoftSkills, Workshops, Courses and Competitions.',
                  style: Theme.of(context).textTheme.headline2,
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.02,),

                Text('OUR COMMUNITY',style: Theme.of(context).textTheme.bodyText1,),
                SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                Container(
                  height: size.height*0.15,
                  child: ListView.separated(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context,index)=>buildCommity(size,index),
                      separatorBuilder: (context,index)=> const SizedBox(width: 10,), itemCount: committeesName.length),
                ),


              ],
            ),
          ),
        ],
      ),
    );
  }

  Container buildCommity(Size size,int i) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      width: size.width*0.75,
      height: size.height*0.15,
      decoration: BoxDecoration(
        color: committeesColor[i],
        borderRadius: BorderRadius.circular(15),),
      child: Row(
        children: [
          Text(committeesName[i],style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20),),
          Spacer(),
          Container(
            width: 50,
            height: 50,
            child: Image.asset(committeesImages[i]),
          ),

        ],
      ),
    );
  }

  Widget buildSocialFollow(
      IconData icon, Color color1, Color color2, int index, context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => WebViewHelper(
                  url: socialMediaLinks[index],
                )));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        height: 40,
        width: 40,
        child: Icon(
          icon,
          color: Colors.white,
        ),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(colors: [
              color2,
              color1,
            ])),
      ),
    );
  }
}
 