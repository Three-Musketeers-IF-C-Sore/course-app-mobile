import 'package:course_app/providers/enrolled_course_provider.dart';
import 'package:course_app/providers/theme_mode_provider.dart';
import 'package:course_app/screens/chapter_detail_screen.dart';
import 'package:course_app/theme/colors.dart';
import 'package:course_app/theme/typography.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CourseDetailPage extends StatefulWidget {
  const CourseDetailPage({super.key, required this.id, required this.image, required this.title, required this.university, required this.instructor, required this.description, required this.chapter, required this.rating});
  final int id;
  final String image;
  final String title;
  final String university;
  final String instructor;
  final String description;
  final int chapter;
  final double rating;

  @override
  State<CourseDetailPage> createState() => _CourseDetailPageState();
}

class _CourseDetailPageState extends State<CourseDetailPage> {
  @override
  Widget build(BuildContext context) {
    final setting = Provider.of<ThemeModeProvider>(context);
    final enrolledCourseProvider = Provider.of<EnrolledCourseProvider>(context);

    return Scaffold(
      backgroundColor: setting.backgroundColor,
      appBar: AppBar(
        title: const Text('Detail Course'),
        backgroundColor: $primary500,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 25, bottom: 60, left: 15, right: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.title, style: $heading5Bold.copyWith(color: setting.textColor),),
              Text(widget.university, style: const TextStyle(color: Colors.grey, fontSize: 15, fontWeight: FontWeight.w400),),
              Text(widget.instructor, style: const TextStyle(color: Colors.grey, fontSize: 15, fontWeight: FontWeight.w400),),
              Row(children: [
                if((widget.rating).round() == widget.rating)...[
                  for(int i=0; i<widget.rating; i++) ...[
                    const Icon(Icons.star_rate_rounded, color: Colors.yellow,)
                  ],
                  for(int i=0; i<5-widget.rating; i++) ...[
                    const Icon(Icons.star_outline_rounded, color: Colors.yellow,)
                  ],
                ] else if((widget.rating).round() > widget.rating) ... [
                  for(int i=0; i<widget.rating.floor(); i++) ...[
                    const Icon(Icons.star_rate_rounded, color: Colors.yellow,)
                  ],
                  const Icon(Icons.star_half_rounded, color: Colors.yellow,),
                  for(int i=0; i<5-widget.rating.round(); i++) ...[
                    const Icon(Icons.star_outline_rounded, color: Colors.yellow,)
                  ],
                ] else if((widget.rating).round() < widget.rating)...[
                  for(int i=0; i<widget.rating.floor(); i++) ...[
                    const Icon(Icons.star_rate_rounded, color: Colors.yellow,)
                  ],
                  for(int i=0; i<5-widget.rating.floor(); i++) ...[
                    const Icon(Icons.star_outline_rounded, color: Colors.yellow,)
                  ],
                ],                  
                Text("(${widget.rating})", style: TextStyle(color: setting.textColor),),
              ],),
              const Padding(padding: EdgeInsets.only(bottom: 15)),
              Image.asset('assets/images/${widget.image}', width: 1000,),
              const Padding(padding: EdgeInsets.only(bottom: 30)),
              Text(widget.description, style: TextStyle(fontSize: 12, color: setting.textColor),),
              const Padding(padding: EdgeInsets.only(bottom: 30)),
              Text(
                'Contents',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: setting.textColor),
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: widget.chapter-1,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Container(
                      alignment: Alignment.center,
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: $primary300,
                      ),
                      child: Text((index+1).toString(), style: const TextStyle(color: $black),),
                    ),
                    title: Text("Chapter ${index+1}", style: TextStyle(color: setting.textColor),),
                    trailing: IconButton(
                      onPressed: enrolledCourseProvider.isEnrolled(widget.id) ? () => Navigator.push(context, MaterialPageRoute(builder: (context) => ChapterDetailPage(image: widget.image, title: widget.title, chapter: index)))
                      : () {ScaffoldMessenger.of(context).showMaterialBanner(
                            MaterialBanner(
                            backgroundColor: setting.textColor,
                            content: Text('You need to enroll first!', style: TextStyle(color: setting.isDarkMode ? $black : $white),),
                            actions: [
                              IconButton(
                                icon: Icon(Icons.close, color: setting.isDarkMode ? $black : $white,),
                                onPressed: () {
                                  ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
                                }
                              ),
                            ],
                          ));
                        },
                      icon: Icon(Icons.arrow_right, color: setting.textColor,),
                    ),
                  );
                }
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
      onPressed: !enrolledCourseProvider.isEnrolled(widget.id)
      ? () {
        enrolledCourseProvider.enrolledCourse(widget.id);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                  child: Text(
                    'Successfully enrolled!',
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close, color: $white,),
                  onPressed: () {
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  }
                ),
              ]
            ),
          )
        );
      }
      : null, 
      label: Text(enrolledCourseProvider.isEnrolled(widget.id)? ' Enrolled' : ' Enroll', style: const TextStyle(color: $black),),
      icon: Icon(enrolledCourseProvider.isEnrolled(widget.id)? Icons.check : Icons.edit, color: $black,),
      backgroundColor: enrolledCourseProvider.isEnrolled(widget.id)? const Color.fromRGBO(236, 230, 240, 1.0) : $primary300,
      )
    );
  }
}