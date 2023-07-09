import 'package:bp/providers/theme_mode_provider.dart';
import 'package:bp/theme/colors.dart';
import 'package:bp/theme/typography.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChapterDetailPage extends StatefulWidget {
  const ChapterDetailPage({super.key, required this.image, required this.title, required this.chapter});
  final String image;
  final String title;
  final int chapter;

  @override
  State<ChapterDetailPage> createState() => _ChapterDetailPageState();
}

class _ChapterDetailPageState extends State<ChapterDetailPage> {
  final chapterDesc = [
    'Introduction',
    'Function',
    'Positive Impact',
    'Negative Impact',
    'Application',
    'Documentation'
  ];

  @override
  Widget build(BuildContext context) {
    final setting = Provider.of<ThemeModeProvider>(context);

    return Scaffold(
      backgroundColor: setting.backgroundColor,
      appBar: AppBar(
        title: const Text('Detail Course'),
        centerTitle: true,
        backgroundColor: $primary500,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.title, style: $heading5Bold.copyWith(color: setting.textColor),),
              // const Padding(padding: EdgeInsets.only(bottom: )),
              Text("Chapter ${(widget.chapter + 1).toString()}: ${chapterDesc[widget.chapter]}", style: $body1Bold.copyWith(color: setting.textColor),),
              const Padding(padding: EdgeInsets.only(bottom: 25)),
              Image.asset('assets/images/${widget.image}', width: 1000,),
              const Padding(padding: EdgeInsets.only(bottom: 15)),
              Text(
                "Lorem ipsum, dolor sit amet consectetur adipisicing elit. Quae aperiam neque facilis ipsum ipsa ab soluta corrupti dolor, ipsam, aut est nobis nulla delectus exercitationem dicta illum hic facere provident omnis esse et! Expedita nihil eaque veniam beatae nobis quae porro. Magnam accusamus mollitia doloribus praesentium vero nisi esse quae ipsam facilis iusto quod ad, non suscipit laboriosam earum? \n\nLaboriosam illum adipisci nesciunt hic doloribus natus animi laudantium possimus doloremque sequi vitae porro nemo sed nulla accusantium voluptate quas nostrum ratione officia fuga necessitatibus, totam iure? Laudantium animi architecto deserunt eveniet harum, quos nostrum ad ex, hic at assumenda illum, id aspernatur magnam reprehenderit voluptatem praesentium tempora. \n\nRatione neque harum architecto voluptas exercitationem repellat praesentium officia illum sunt omnis impedit qui ad blanditiis incidunt pariatur quos accusamus minima, dicta nemo facilis necessitatibus reiciendis. Optio quas autem, consequatur ipsum modi doloremque molestiae, iusto blanditiis vero tenetur fugit quaerat sint praesentium aut perspiciatis ipsa possimus facilis necessitatibus reprehenderit. At rerum cumque vitae ex enim numquam, qui laboriosam hic esse neque non molestias deserunt? Impedit alias maxime ex eveniet quod iste ut officia pariatur et ad. Adipisci vitae nulla reprehenderit consequuntur architecto porro nam voluptatum pariatur deserunt distinctio facere labore id saepe exercitationem, corporis odio amet debitis? Quaerat at dolorem optio sequi repellendus necessitatibus porro veritatis quod asperiores omnis maiores dicta fugiat molestiae laborum debitis excepturi facilis beatae nobis explicabo obcaecati eveniet, quisquam, quam ipsum. Incidunt laboriosam, accusamus ipsa ratione optio aliquam corrupti, voluptate sint expedita adipisci tenetur voluptatibus maxime minima perspiciatis iure illo veritatis! \n\nLabore ratione in, magnam ea, cumque amet fugiat odit quam itaque ullam consequatur minima sint, ex dolorum tempora! Saepe odio vitae earum id dolorem nostrum, quaerat sit quasi porro deleniti repellat quia vero autem cupiditate magni doloribus maiores voluptas quis rem perferendis ratione reiciendis harum laborum dolor? In facere esse ipsum provident, illo nulla adipisci quod molestias consequuntur nobis delectus. Delectus ut molestias exercitationem corporis totam, est assumenda fugiat dignissimos! \n\nVoluptas, magni! Facilis veniam dolor corporis esse voluptas animi impedit quidem atque nobis libero commodi reiciendis dolorem tempora, ex recusandae ab labore! Eius, soluta! Asperiores, vel architecto distinctio dolores libero possimus pariatur quisquam quo reprehenderit ullam iste dolor neque velit, saepe accusamus, beatae dicta error ipsam quaerat aliquam quam. Obcaecati, odio! Inventore nulla a corrupti minus aut veniam accusamus, perferendis id vitae magni nostrum dicta dolores beatae ipsa recusandae quis. Quas temporibus nesciunt omnis! Tempore iure nesciunt id.",
                style: TextStyle(color: setting.textColor),
              )
            ],
          ),
        ),
      ),
    );
  }
}