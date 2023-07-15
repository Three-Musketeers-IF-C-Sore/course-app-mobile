import 'package:bp/providers/theme_mode_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    final setting = Provider.of<ThemeModeProvider>(context);
    final currentWidth = MediaQuery.of(context).size.width;

    return Padding(
          padding: const EdgeInsets.only(top: 24, right: 16, left: 16),
          child: Column(
            children: [
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
                  children: const [
                    Text(
                      'Learn anywhere, anytime from your fingertips',
                      style: TextStyle(
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
                      child: const Text(
                        'Recommended For You',
                        style: TextStyle(
                          color: Colors.black,
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
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          Widget item = Container(
                            margin: const EdgeInsets.only(right: 8),
                            width: 176,
                            height: 148,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    width: 176,
                                    height: 88,
                                    decoration: const BoxDecoration(color: Color(0xFFD9D9D9)),
                                  ),
                                Container(
                                  child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    SizedBox(
                                        width: 176,
                                        child: Padding(
                                          padding: EdgeInsets.only(top: 4),
                                          child: Text(
                                            'Data Structure and Algorithm',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontFamily: 'Plus Jakarta Sans',
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ),
                                    SizedBox(
                                        child: Padding(
                                          padding: EdgeInsets.only(top: 4),
                                          child: Text(
                                            'University of Waterloo',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12,
                                              fontFamily: 'Plus Jakarta Sans',
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ),

                                  ],
                                ),
                              ),
                            ],
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
                      child: const Text(
                        'Most Participants',
                        style: TextStyle(
                          color: Colors.black,
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
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          Widget item = Container(
                            margin: const EdgeInsets.only(right: 8),
                            width: 176,
                            height: 148,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    width: 176,
                                    height: 88,
                                    decoration: const BoxDecoration(color: Color(0xFFD9D9D9)),
                                  ),
                                Container(
                                  child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    SizedBox(
                                        width: 176,
                                        child: Padding(
                                          padding: EdgeInsets.only(top: 4),
                                          child: Text(
                                            'Data Structure and Algorithm',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontFamily: 'Plus Jakarta Sans',
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ),
                                    SizedBox(
                                        child: Padding(
                                          padding: EdgeInsets.only(top: 4),
                                          child: Text(
                                            'University of Waterloo',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12,
                                              fontFamily: 'Plus Jakarta Sans',
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ),

                                  ],
                                ),
                              ),
                            ],
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