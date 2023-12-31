import 'package:course_app/providers/theme_mode_provider.dart';
import 'package:course_app/theme/typography.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../theme/colors.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final setting = Provider.of<ThemeModeProvider>(context);

    return Scaffold(
      backgroundColor: setting.backgroundColor,
      appBar: AppBar(
        title: const Text("About Us"),
        centerTitle: true,
        backgroundColor: $primary500, // Replace with your desired color
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      'About Us',
                      style: $heading2Bold.copyWith(color: setting.textColor),
                    ),
                  ),
                ),
                const Padding(padding: EdgeInsets.all(10)),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      'Welcome!',
                      style: $body2Regular.copyWith(color: setting.textColor),
                    ),
                  ),
                ),
                const Padding(padding: EdgeInsets.all(5)),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      'We believe that education should be accessible to everyone, regardless of their location or schedule. We are an online learning platform dedicated to providing high-quality courses that empower individuals to acquire new skills, expand their knowledge, and achieve their personal and professional goals.',
                      style: $body2Regular.copyWith(color: setting.textColor),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
                const Padding(padding: EdgeInsets.all(10)),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                    ),
                    child: Text(
                      'Our Mission:',
                      style: $body2Regular.copyWith(color: setting.textColor),
                    ),
                  ),
                ),
                const Padding(padding: EdgeInsets.all(5)),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      'Our mission is to make learning engaging, flexible, and effective. We strive to create a diverse and inclusive learning community where learners can explore a wide range of subjects, connect with passionate instructors, and unleash their full potential.',
                      style: $body2Regular.copyWith(color: setting.textColor),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
                const Padding(padding: EdgeInsets.all(10)),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      'Our Course Offerings:',
                      style: $body2Regular.copyWith(color: setting.textColor),
                    ),
                  ),
                ),
                const Padding(padding: EdgeInsets.all(5)),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      'We offers a vast selection of courses across various disciplines. Whether you want to upgrade your technical skills, develop your creativity, or enhance your personal growth, we have a course for you.',
                      style: $body2Regular.copyWith(color: setting.textColor),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
                const Padding(padding: EdgeInsets.all(10)),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      'Expert Instructors:',
                      style: $body2Regular.copyWith(color: setting.textColor),
                    ),
                  ),
                ),
                const Padding(padding: EdgeInsets.all(10)),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      'We pride ourselves on collaborating with experienced instructors who are passionate about sharing their knowledge and expertise. Our instructors are industry professionals, subject matter experts, and educators who bring real-world insights into the virtual classroom. They are dedicated to creating engaging and interactive learning experiences that cater to different learning styles.',
                      style: $body2Regular.copyWith(color: setting.textColor),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
