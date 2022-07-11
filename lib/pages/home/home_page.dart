import "package:flutter/material.dart";
import 'package:my_portfolio/example/projects.dart';
import 'package:my_portfolio/responsive.dart';
import 'package:share_plus/share_plus.dart';
import '../../widgets/header/header.dart';
import "../../widgets/cards/project_card.dart";
//import '../../widgets/cards/intro_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  Widget mobileTabletBuilder(double height) {
    return SizedBox(
      height: height,
      child: ListView.builder(
      // ignore: prefer_const_literals_to_create_immutables
        scrollDirection: Axis.horizontal,
        itemCount: projects.length,
        itemBuilder: (context, index) {
          return ProjectCard(project: projects[index]);
        }
      ),
    );
  }

  Widget desktopBuilder() {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 5.0,
        mainAxisSpacing: 5.0,
        ),
        itemCount: projects.length,
        itemBuilder: (context, index) {
          return ProjectCard(project: projects[index]);
        });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          Share.share("Check out Matt's portfolio https://my-portfolio-1cde3.web.app");
        },
        child: const Icon(
          Icons.share,
        ),    
      ),
        
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Header(),
                  const SizedBox(height: 25),
                  const Text(
                    "Projects",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Responsive(
                    mobile: mobileTabletBuilder(350), 
                    tablet: mobileTabletBuilder(450), 
                    desktop: desktopBuilder()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
