import 'dart:convert';
import 'dart:math';
import 'package:bp/providers/theme_mode_provider.dart';
import 'package:bp/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _textFieldFocus = FocusNode();
  Color _color = $primary200;

  List allcourses = [];
  List courses = [];
  List related = [];
  List recommend = [];
  String key = "";

  Future<void> readJson() async {
    final String response = await rootBundle.loadString("assets/json/course.json");
    final data = json.decode(response) as List;
    setState(() {
      allcourses = data;
      courses = allcourses;
      List tempShuffle = allcourses.toList()..shuffle(Random());
      related = tempShuffle.sublist(0,2);
      List shuffled = allcourses.toList()..shuffle(Random());
      recommend = shuffled.sublist(0,4);
    });
  }

  @override
  void initState() {
    _textFieldFocus.addListener(() {
      if(_textFieldFocus.hasFocus) {
        setState(() {
          _color = $white;
        });
      } else {
        setState(() {
          _color = $primary200;
        });
      }
    });
    readJson();
    super.initState();
  }

  void updateDataByKeyword(String keyword) {
    setState(() {
      courses = allcourses.where((element) => element["title"].toLowerCase().contains(keyword.toLowerCase()) || element["university"].toLowerCase().contains(keyword.toLowerCase()) || element["instructor"].toLowerCase().contains(keyword.toLowerCase())).toList();
      key = keyword;
    });
  }

  @override
  Widget build(BuildContext context) {
    final setting = Provider.of<ThemeModeProvider>(context);
    final currentWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: setting.backgroundColor,
      appBar: AppBar(
        title: const Text('Setting'),
        centerTitle: true,
        backgroundColor: $primary500,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _searchController,
                onChanged: (keyword) {
                  updateDataByKeyword(_searchController.text);
                },
                style: TextStyle(color: setting.textColor),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: setting.isDarkMode ? $primary300 : _color,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: setting.textColor
                    ),
                  ),
                  hintText: "Search courses, instructor, or keyword",
                  labelText: "Search courses, instructor, or keyword",
                  hintStyle: TextStyle(color: setting.textColor),
                  labelStyle: TextStyle(color: setting.textColor),
                  prefixIcon: Icon(Icons.search, size: 30, color: setting.textColor,),
                  suffixIcon: IconButton(
                    icon: FaIcon(FontAwesomeIcons.circleXmark, color: setting.textColor,),
                    onPressed: () {
                      _searchController.clear();
                      setState(() {
                        key = "";
                      });
                    },
                  ),
                ),
                focusNode: _textFieldFocus,
              ),
              const Padding(padding: EdgeInsets.only(bottom: 10)),
              if(key == '') ...[
                Text(
                  'Recommended Courses',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: setting.textColor ),
                ),
                const Padding(padding: EdgeInsets.only(bottom: 10)),
                ListView.separated(
                  shrinkWrap: true,
                  itemCount: recommend.length,
                  separatorBuilder: (context, index) {
                    return const Padding(padding: EdgeInsets.only(top: 10));
                  },
                  itemBuilder: (context, index) {
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset('assets/images/${recommend[index]["image"]}', width: 100,),
                        const Padding(padding: EdgeInsets.only(left: 10)),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              width: currentWidth*0.5,
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(recommend[index]["title"], style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: setting.textColor),))
                            ),
                            Text(recommend[index]["university"], style: const TextStyle(color: Colors.grey, fontSize: 15, fontWeight: FontWeight.w400),),
                            Text(recommend[index]["instructor"], style: const TextStyle(color: Colors.grey, fontSize: 15, fontWeight: FontWeight.w400),),
                            Row(children: [
                              if((recommend[index]["rating"]).round() == recommend[index]["rating"])...[
                                for(int i=0; i<recommend[index]["rating"]; i++) ...[
                                  const Icon(Icons.star_rate_rounded, color: Colors.yellow,)
                                ],
                                for(int i=0; i<5-recommend[index]["rating"]; i++) ...[
                                  const Icon(Icons.star_outline_rounded, color: Colors.yellow,)
                                ],
                              ] else if((recommend[index]["rating"]).round() > (recommend[index]["rating"])) ... [
                                for(int i=0; i<(recommend[index]["rating"]).floor(); i++) ...[
                                  const Icon(Icons.star_rate_rounded, color: Colors.yellow,)
                                ],
                                const Icon(Icons.star_half_rounded, color: Colors.yellow,),
                                for(int i=0; i<5-(recommend[index]["rating"]).round(); i++) ...[
                                  const Icon(Icons.star_outline_rounded, color: Colors.yellow,)
                                ],
                              ] else if((recommend[index]["rating"]).round() < (recommend[index]["rating"]))...[
                                for(int i=0; i<(recommend[index]["rating"]).floor(); i++) ...[
                                  const Icon(Icons.star_rate_rounded, color: Colors.yellow,)
                                ],
                                for(int i=0; i<5-(recommend[index]["rating"]).floor(); i++) ...[
                                  const Icon(Icons.star_outline_rounded, color: Colors.yellow,)
                                ],
                              ],                  
                              Text("(${recommend[index]['rating']})", style: TextStyle(color: setting.textColor),),
                            ],),
                          ],
                        )
                      ],
                    );
                  },
                )
              ] else if(courses.isNotEmpty) ...[
                Text(
                  "Search Results for '$key'",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: setting.textColor),
                ),
                const Padding(padding: EdgeInsets.only(bottom: 10)),
                ListView.separated(
                  shrinkWrap: true,
                  itemCount: courses.length,
                  separatorBuilder: (context, index) {
                    return const Padding(padding: EdgeInsets.only(top: 10));
                  },
                  itemBuilder: (context, index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset('assets/images/${courses[index]["image"]}', width: 100,),
                        const Padding(padding: EdgeInsets.only(left: 10)),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: currentWidth*0.5,
                              child: FittedBox(child: Text(courses[index]["title"], style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: setting.textColor),),)
                            ),  
                            Text(courses[index]["university"], style: const TextStyle(color: Colors.grey, fontSize: 15, fontWeight: FontWeight.w400),),
                            Text(courses[index]["instructor"], style: const TextStyle(color: Colors.grey, fontSize: 15, fontWeight: FontWeight.w400),),
                            Row(children: [
                              if((courses[index]["rating"]).round() == courses[index]["rating"])...[
                                for(int i=0; i<courses[index]["rating"]; i++) ...[
                                  const Icon(Icons.star_rate_rounded, color: Colors.yellow,)
                                ],
                                for(int i=0; i<5-courses[index]["rating"]; i++) ...[
                                  const Icon(Icons.star_outline_rounded, color: Colors.yellow,)
                                ],
                              ] else if((courses[index]["rating"]).round() > (courses[index]["rating"])) ... [
                                for(int i=0; i<(courses[index]["rating"]).floor(); i++) ...[
                                  const Icon(Icons.star_rate_rounded, color: Colors.yellow,)
                                ],
                                const Icon(Icons.star_half_rounded, color: Colors.yellow,),
                                for(int i=0; i<5-(courses[index]["rating"]).round(); i++) ...[
                                  const Icon(Icons.star_outline_rounded, color: Colors.yellow,)
                                ],
                              ] else if((courses[index]["rating"]).round() < (courses[index]["rating"]))...[
                                for(int i=0; i<(courses[index]["rating"]).floor(); i++) ...[
                                  const Icon(Icons.star_rate_rounded, color: Colors.yellow,)
                                ],
                                for(int i=0; i<5-(courses[index]["rating"]).floor(); i++) ...[
                                  const Icon(Icons.star_outline_rounded, color: Colors.yellow,)
                                ],
                              ],                  
                              Text("(${courses[index]['rating']})", style: TextStyle(color: setting.textColor),),
                            ],),
                          ],
                        )
                      ],
                    );
                  },
                )
              ] else if (courses.isEmpty) ... [
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("No Result for '$key'", style: TextStyle(fontSize: 18, color: setting.textColor)),
                      const Padding(padding: EdgeInsets.only(bottom: 5)),
                      Image.asset('assets/images/undraw_Empty.png'),
                      const Padding(padding: EdgeInsets.only(bottom: 75)),
                    ],
                  ),
                ),
              ],

              if(key != '') ...[
                const Padding(padding: EdgeInsets.only(top: 25)),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                    'Related Courses',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: setting.textColor),
                    ),
                    const Padding(padding: EdgeInsets.only(top: 10)),
                    ListView.separated(
                      shrinkWrap: true,
                      itemCount: related.length,
                      separatorBuilder: (context, index) {
                        return const Padding(padding: EdgeInsets.only(top: 10));
                      },
                      itemBuilder: (context, index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset('assets/images/${related[index]["image"]}', width: 100,),
                            const Padding(padding: EdgeInsets.only(left: 10)),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: currentWidth*0.5,
                                  child: FittedBox(child: Text(related[index]["title"], style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: setting.textColor),),)
                                ), 
                                Text(related[index]["university"], style: const TextStyle(color: Colors.grey, fontSize: 15, fontWeight: FontWeight.w400),),
                                Text(related[index]["instructor"], style: const TextStyle(color: Colors.grey, fontSize: 15, fontWeight: FontWeight.w400),),
                                Row(children: [
                                  if((related[index]["rating"]).round() == related[index]["rating"])...[
                                    for(int i=0; i<related[index]["rating"]; i++) ...[
                                      const Icon(Icons.star_rate_rounded, color: Colors.yellow,)
                                    ],
                                    for(int i=0; i<5-related[index]["rating"]; i++) ...[
                                      const Icon(Icons.star_outline_rounded, color: Colors.yellow,)
                                    ],
                                  ] else if((related[index]["rating"]).round() > (related[index]["rating"])) ... [
                                    for(int i=0; i<(related[index]["rating"]).floor(); i++) ...[
                                      const Icon(Icons.star_rate_rounded, color: Colors.yellow,)
                                    ],
                                    const Icon(Icons.star_half_rounded, color: Colors.yellow,),
                                    for(int i=0; i<5-(related[index]["rating"]).round(); i++) ...[
                                      const Icon(Icons.star_outline_rounded, color: Colors.yellow,)
                                    ],
                                  ] else if((related[index]["rating"]).round() < (related[index]["rating"]))...[
                                    for(int i=0; i<(related[index]["rating"]).floor(); i++) ...[
                                      const Icon(Icons.star_rate_rounded, color: Colors.yellow,)
                                    ],
                                    for(int i=0; i<5-(related[index]["rating"]).floor(); i++) ...[
                                      const Icon(Icons.star_outline_rounded, color: Colors.yellow,)
                                    ],
                                  ],                  
                                  Text("(${related[index]['rating']})", style: TextStyle(color: setting.textColor),),
                                ],),
                              ],
                            )
                          ],
                        );
                      },
                    )
                ],),
              ],
            ],
          ),
        ),
      ),
    );
  }
}