import 'package:bp/providers/theme_mode_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {

  @override
  Widget build(BuildContext context) {
    final setting = Provider.of<ThemeModeProvider>(context);
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

          SizedBox(height: 16),

          SingleChildScrollView(
            child: Column(
              children: [1,2,3,4,5].map((i) {
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
                        title: const Text('Course 1'),
                        subtitle: Text(
                          'Subhead',
                          style: TextStyle(color: Colors.black.withOpacity(0.6)),
                        ),
                      ),
                      SizedBox(
                        width: currentWidth,
                        child: Image.asset('assets/images/home/course-image.png'),
                      ),

                      ListTile(
                        title: const Text('Course 1'),
                        subtitle: Text(
                          'Subhead',
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

                      const Padding(
                        padding: EdgeInsets.all(16),
                        child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor'),
                      ),

                      Container(
                        width: currentWidth,
                        padding: EdgeInsets.only(right: 16, bottom: 16),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ElevatedButton(
                              onPressed: () => {}, 
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(Color.fromRGBO(103, 80, 164, 1)),
                                padding: MaterialStateProperty.all<EdgeInsets>(
                                  const EdgeInsets.only(top: 10, bottom: 10, left: 24, right: 24)
                                ),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                  )
                                )
                              ),
                              child: const Text(
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                                'Resume',
                              ),
                            ),
                          ],
                        ),
                      )
                      
                    ],
                  ),
                );
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
}