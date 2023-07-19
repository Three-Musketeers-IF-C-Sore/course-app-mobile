import 'dart:convert';
import 'dart:math';

import 'package:course_app/providers/theme_mode_provider.dart';
import 'package:course_app/screens/course_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List allcourses = [];
  List courses = [];
  List recommend = [];

  Future<void> readJson() async {
    final String response = await rootBundle.loadString("assets/json/course.json");
    final data = json.decode(response) as List;
    setState(() {
      allcourses = data;
      List shuffled = allcourses.toList()..shuffle(Random());
      recommend = shuffled.sublist(0,4);
    });
  }

  @override
  void initState() {
   readJson();
   super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final setting = Provider.of<ThemeModeProvider>(context);
    final currentWidth = MediaQuery.of(context).size.width;


    return Padding(
          padding: const EdgeInsets.only(top: 24, right: 16, left: 16),
          child: Column(
            children: [
              ListTile(
                leading: SizedBox(
                  width: 48,
                  height: 48,
                  child: Icon(
                    Icons.account_circle_rounded,
                    size: 48,
                    color: setting.textColor,
                  ),
                ),
                title: Text(
                  'Welcome, Peter',
                  style: TextStyle(
                    color: setting.textColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                subtitle: Text(
                  'What do you wanna learn today?',
                  style: TextStyle(
                    color: setting.textColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              Container(
                margin: const EdgeInsets.only(top: 8),
                height: 160,
                child: ListView.separated(
                  physics: const PageScrollPhysics(),
                  separatorBuilder: (context, index) => 
                    const Divider(
                      indent: 1.0,
                    ),
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    Widget item = Container(
                      margin: const EdgeInsets.only(right: 12),
                      width: 200,
                      height: 180,
                      child: Image.asset('assets/images/home/Item-1.png'),
                    );
                    if (index == 0) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 4),
                        child: item,
                      );
                    } else if (index == 4) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 4),
                        child: item,
                      );
                    }
                    return item;
                  }
                ),
              ),

              Container(
                margin: const EdgeInsets.only(top: 16.0),
                child: Column(
                  children: [
                    Text(
                      'Learn anywhere, anytime from your fingertips',
                      style: TextStyle(
                        color: setting.textColor,
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Playfair Display'
                      ),
                    ),
                    Text(
                      'Find 500+ courses from 200+ instructors around the world        ',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: setting.textColor,
                      ),
                    ),
                  ],
                ),
              ),

              // section 1
              Container(
                margin: const EdgeInsets.only(top: 24.0),
                child: Column(
                  children: [
                    SizedBox(
                      width: currentWidth,
                      child: Text(
                        'Recommended For You',
                        style: TextStyle(
                          color: setting.textColor,
                          fontSize: 22,
                          fontFamily: 'Plus Jakarta Sans',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),

                    Container(
                      margin: const EdgeInsets.only(top: 8),
                      height: 160,
                      child: ListView.separated(
                        physics: const PageScrollPhysics(),
                        separatorBuilder: (context, index) => const Divider(
                          indent: 1.0,
                        ),
                        scrollDirection: Axis.horizontal,
                        itemCount: recommend.length,
                        itemBuilder: (context, index) {
                          Widget item = GestureDetector(
                            onTap: () {
                              Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => CourseDetailPage(
                                        id: recommend[index]['id'], 
                                        image: recommend[index]['image'], 
                                        title: recommend[index]['title'], 
                                        university: recommend[index]['university'], 
                                        instructor: recommend[index]['instructor'], 
                                        description: recommend[index]['description'], 
                                        chapter: recommend[index]['chapter'], 
                                        rating: recommend[index]['rating']
                                      )
                                    )
                                  );
                            },
                            child: Container(
                            margin: const EdgeInsets.only(right: 8),
                            width: 176,
                            height: 148,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                    width: 176,
                                    height: 88,
                                    child: Image.asset('assets/images/${recommend[index]["image"]}', width: 100,),
                                  ),
                                Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                      width: 176,
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 4),
                                        child: Text(
                                          recommend[index]['title'],
                                          style: TextStyle(
                                            color: setting.textColor,
                                            fontSize: 14,
                                            fontFamily: 'Plus Jakarta Sans',
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  SizedBox(
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 4),
                                        child: Text(
                                          recommend[index]['university'],
                                          style: TextStyle(
                                            color: setting.textColor,
                                            fontSize: 12,
                                            fontFamily: 'Plus Jakarta Sans',
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),

                                ],
                                ),
                            ],
                           ),
                        ),
                          );
                          
                        if (index == 0) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 4),
                            child: item,
                          );
                        } else if (index == 4) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 4),
                            child: item,
                          );
                        }
                        return item;
                      }),
                    )
                  ],
                ),
              ),

              // section 2
              Container(
                margin: const EdgeInsets.only(top: 24.0),
                child: Column(
                  children: [
                    SizedBox(
                      width: currentWidth,
                      child: Text(
                        'Most Participants',
                        style: TextStyle(
                          color: setting.textColor,
                          fontSize: 22,
                          fontFamily: 'Plus Jakarta Sans',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),

                    Container(
                      margin: const EdgeInsets.only(top: 8),
                      height: 160,
                      child: ListView.separated(
                        physics: const PageScrollPhysics(),
                        separatorBuilder: (context, index) => const Divider(
                          indent: 1.0,
                        ),
                        scrollDirection: Axis.horizontal,
                        itemCount: allcourses.length,
                        itemBuilder: (context, index) {
                          Widget item = 
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => CourseDetailPage(
                                        id: allcourses[index]['id'], 
                                        image: allcourses[index]['image'], 
                                        title: allcourses[index]['title'], 
                                        university: allcourses[index]['university'], 
                                        instructor: allcourses[index]['instructor'], 
                                        description: allcourses[index]['description'], 
                                        chapter: allcourses[index]['chapter'], 
                                        rating: allcourses[index]['rating']
                                      )
                                    )
                                  );
                              },
                              child: Container(
                            margin: const EdgeInsets.only(right: 8),
                            width: 176,
                            height: 148,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                    width: 176,
                                    height: 88,
                                    child: Image.asset('assets/images/${allcourses[index]["image"]}', width: 100,),
                                  ),
                                Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                      width: 176,
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 4),
                                        child: Text(
                                          allcourses[index]['title'],
                                          style: TextStyle(
                                            color: setting.textColor,
                                            fontSize: 14,
                                            fontFamily: 'Plus Jakarta Sans',
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  SizedBox(
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 4),
                                        child: Text(
                                          allcourses[index]['university'],
                                          style: TextStyle(
                                            color: setting.textColor,
                                            fontSize: 12,
                                            fontFamily: 'Plus Jakarta Sans',
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),

                                ],
                                ),
                            ],
                           ),
                        ),
                        );
                            
                        if (index == 0) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 4),
                            child: item,
                          );
                        } else if (index == 4) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 4),
                            child: item,
                          );
                        }
                        return item;
                      }),
                    )
                  ],
                ),
              ),

              const SizedBox(
                height: 24,
              ),
            ],            
          ),
        );
  }
}