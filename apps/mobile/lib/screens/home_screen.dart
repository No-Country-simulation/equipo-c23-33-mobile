import 'package:flutter/material.dart';
import 'package:mobile/screens/categoria/allMascotas.dart';
import 'package:mobile/widgets/home/appbar_home.dart';
import 'package:mobile/widgets/cards.dart';
import 'package:mobile/widgets/navBar.dart';
import 'package:mobile/widgets/home/welcome_card.dart';
import 'package:mobile/widgets/home/categories_section.dart';
import 'package:mobile/widgets/buildRefugeCarg.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          appBar: AppBarHome(),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const WelcomeCard(),
                CategoriesSection(),
                _buildSection(
                  title: "Mascotas en adopción",
                  cards: [
                    AnimalCard(
                      name: "Milo",
                      type: "Macho",
                      breed: "1.5 años",
                      size: "Gral. Rodríguez",
                      age: "2.7 km",
                      sex: "2.7 km",
                      shelter: "2.7 km",
                      photoUrl:
                          "https://s3-alpha-sig.figma.com/img/7831/601f/e9d6ffa77c6b8a2f7fb5b6e0467a78c3?Expires=1739145600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=C7leqU8BDCmQLszn4V1101pn5MsD39hUS5pvMPLn5s-sYngjt4GcgZdJGVcXmEknpHYIcJN6pfZNhFcIIIqG4jwtazKWV4IHNLMeK940HX3S0VJfPRa~3uQ7Us4HkaCc-ypyPOrCLzFLNBdK2VN1x8nhkCzqjrxVtb8qMnnhZzQ0rzEH~o55w8t42KkchZrUeEWVItYP987NTK9tskoIgKgpvD-4mUjxylkLKU8aL8jmTGNUFq16Q7kFKj6Z78tUrYd3yJCnpWZpPZvFVHrBX53DING23a9bnRf2cpnEjKut5CAtbDR7vIyLXCK59zHNH2v3bV~uMyAJDSp3KOr~jQ__",
                      healthStatus: "2.7 km",
                      status: "2.7 km",
                      idShelter: "2.7 km",
                      createdAt: "2.7 km",
                    ),
                    AnimalCard(
                      name: "Milo",
                      type: "Macho",
                      breed: "1.5 años",
                      size: "Gral. Rodríguez",
                      age: "2.7 km",
                      sex: "2.7 km",
                      shelter: "2.7 km",
                      photoUrl:
                          "https://s3-alpha-sig.figma.com/img/44b8/30aa/a5592f6e4890d93ab529a48254527b64?Expires=1739145600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=mmkXP117MEtnL~W3~VBiFM9BGjRSaZ95b7Ovywmx8p9lt2RPBaIP2drP7gjiLPonjcnZc0gzDjT61jIfhXq6sCUf19tfr9t6HNQeyIoMagoJ~Uto9uCROIaw7-5eXntmMjxSs57-~xA9~1cVWlltiVX52uYiIkMlxiJeJRsy7Cjt~FulkhCcHCHoRPd1xbJH8kjqiGkDRVO36YhiQJ0vDR-UhCSlalZQ8bU4RL9m9efo8~2vZZh8SXWM2IhDOaXIpaS53MBnMA7EPfv8XmUTJG9BDwmQiXP3DTung7vvn9yM31MEM2bNE7JzoCrR17b6Hz0WsK6HbT8Cp8g3U4jL3Q__",
                      healthStatus: "2.7 km",
                      status: "2.7 km",
                      idShelter: "2.7 km",
                      createdAt: "2.7 km",
                    ),
                  ],
                ),
                _buildSection(
                  title: "Refugios cercanos",
                  cards: [
                    RefugeCard(
                      name: "Refugio feliz",
                      location: "Gral. Rodríguez",
                      distance: "2.7 km",
                      imageUrl:
                          "https://s3-alpha-sig.figma.com/img/cdbe/ca63/b199aea121ed5b9abefa4910bfb8f027?Expires=1739145600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=nt05U7wQk1dX-FlF1-Z6bUD1bvy3l7NPyROXmmZB~vE2RHGwmeCeWljJ7j5RjEwihHId6qA0l4MAN1~KBmVBER7a1sHDEEcun3xaHzCbJme3IjdsGedy1qdCA9vhG2k0by6Q~5nQSVy8R-TXo7nKmziWxFLVDsA3tIz0xSQPMF-uprqnxubxsdjF~x8Yv10LUnN6wDYvl4hjdr9WtFLRfw-tK7bvb-xsdecDP2iWLX5BzDJ1~yXpmQe2eXrB9WSd5YCzFKZSOql7eo3kn8-qi8BmOaFD1Q0jIXKD5ImUyxFYq0GtiXyjqn4ALR5VAIczjz2ytHq2oOEGTe28XGDMwA__",
                    ),
                    RefugeCard(
                      name: "El Campito refugio",
                      location: "Gral. Rodríguez",
                      distance: "2.7 km",
                      imageUrl:
                          "https://s3-alpha-sig.figma.com/img/45e4/2683/910c44f84c3991f2968835f41725879c?Expires=1739145600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=bMmgMm1oqEHTLdDFY44BLFsOefmUmZnZ3hwCV~dWRTFrtT0P9ET6gauE5Ek7Za9CnLPMN-3vlmDiuijyzPR~FG93pMVh73eLVUdMMXXaWSJMqcUuxmnFFtlN5Criz-1EXoMCviWHYI9S~TZ3GzvnCtqAce~Wgq4HG~JvHULkcUW1nxvsxFEGlOjvL4iqgBOBL-87877IJD8run5VeVU98~np5w0J-SZs8QUmma8YQyVR9Z0GrQrnG5~yR1OvSMAWJRb6u5Jo-PRRCSdITu6jfcyN~~NV8VonWMt5BjCKydBDkeMO1f~Mno428VGSc6Jo9usUnFBGYOHzlCEJ~qajXA__",
                    ),
                  ],
                ),
              ],
            ),
          ),
          bottomNavigationBar: const NavBar(),
        );
      },
    );
  }

  Widget _buildSection({required String title, required List<Widget> cards}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Allmascotas()),
                  );
                },
                child: const Text("Ver todo"),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 260,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.8,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            itemCount: cards.length,
            itemBuilder: (context, index) {
              return cards[index];
            },
          ),
        ),
      ],
    );
  }
}

// bottom overflowd bt 31 pixels
//
