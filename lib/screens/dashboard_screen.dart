import 'dart:convert';

import 'package:bp/screens/course_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:provider/provider.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  List courses = [];

  Future<void> readJson() async {
    final String response = await rootBundle.loadString("assets/json/course.json");
    final data = json.decode(response) as List;
    setState(() {
      courses = data;
    });
  }

  @override
  void initState() {
    readJson();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final setting = Provider.of<ThemeModeProvider>(context);
    final currentWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(top: 24, right: 16, left: 16),
      child: Column(
        children: [
          SizedBox(
            width: currentWidth,
            child: const Text(
              'My Courses',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),

          const SizedBox(height: 16),

          SingleChildScrollView(
            child: Column(
              children: courses.map((i) {
                return Card(
                  margin: const EdgeInsets.only(bottom: 16),
                  color: const Color.fromRGBO(254, 247, 255, 1),
                  elevation: 0,
                  shape: const RoundedRectangleBorder(
                    side: BorderSide(
                      color: Color.fromRGBO(161, 161, 161, 1),
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    children: [
                      ListTile(
                        leading: Image.asset('assets/images/home/course-icon.png'),
                        title: Text(i['title']),
                        subtitle: Text(
                          i['chapter'].toString(),
                          style: TextStyle(color: Colors.black.withOpacity(0.6)),
                        ),
                      ),
                      SizedBox(
                        width: currentWidth,
                        child: Image.asset('assets/images/home/course-image.png'),
                      ),

                      ListTile(
                        title: Text(i['title']),
                        subtitle: Text(
                          i['chapter'].toString(),
                          style: TextStyle(color: Colors.black.withOpacity(0.6)),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: const [
                            LinearProgressIndicator(
                              value: 0.75,
                              semanticsLabel: 'Linear progress indicator',
                            ),
                            SizedBox(height: 8),
                            Text(
                              "75%",
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text(i['description']),
                      ),

                      Container(
                        width: currentWidth,
                        padding: const EdgeInsets.only(right: 16, bottom: 16),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ElevatedButton(
                              onPressed: () => {}, 
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(const Color.fromRGBO(103, 80, 164, 1)),
                                padding: MaterialStateProperty.all<EdgeInsets>(
                                  const EdgeInsets.only(top: 0, bottom: 0, left: 24, right: 24)
                                ),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                  )
                                )
                              ),
                              child: TextButton(
                                onPressed: () => {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => CourseDetailPage(
                                        id: i['id'], 
                                        image: i['image'], 
                                        title: i['title'], 
                                        university: i['university'], 
                                        instructor: i['instructor'], 
                                        description: i['description'], 
                                        chapter: i['chapter'], 
                                        rating: i['rating']
                                      )
                                    )
                                  ),
                                }, 
                                child: const Text(
                                  'Resume',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}