import 'package:flutter/material.dart';
import 'package:mobile/screens/categoria/allPets.dart';
import 'package:mobile/screens/categoria/allShelters.dart';
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
  int _selectedIndex = 0; // Estado para manejar el índice seleccionado

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
                  entidad: "pets",
                  cards: [
                    AnimalCard(
                      name: "Milo",
                      type: "Macho",
                      breed: "1.5 años",
                      size: "Gral. Rodríguez",
                      age: "2.7 km",
                      sex: "2.7 km",
                      shelter: "2.7 km",
                      photoUrl:"https://s3-alpha-sig.figma.com/img/7831/601f/e9d6ffa77c6b8a2f7fb5b6e0467a78c3?Expires=1740355200&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=mTYtHPYMbnSxeG7SgQmk1HQCAMI4-fq6IN~Qxpue-yI-JFAJn~MCQtpUigb9FjPvQyIIp3R7-P6WTn47Z8lzUKHUTZgzrNOSa8GdRNO3pDdoYvzIIgNzlUCQuEivauBaVVs2CA-kl335osupaeaBxL-bHx7KkDxYhHEagvuPmgKIKMwCJqOIyRINDSrYNfHxnqVp2XdKWga12UMB4qIRmaYYZMtc7~nYODiuoN9VIFFBpznmxoxGGG5~EEFzpaGtgdu7x80K-Tx~y12oO~fbCfcJ8sH4WfWHVWdhS8~dgRYMAjQhvDRZGcVQnKpFAk-FlY2OqExN0Y7NPSdBAjwcow__",
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
                      photoUrl:"https://s3-alpha-sig.figma.com/img/44b8/30aa/a5592f6e4890d93ab529a48254527b64?Expires=1740355200&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=mvZm5qJrzIYzQVUqq8pqkRePD7iZCQWKjjA9T0hYxrjEs-cTbluQtCxjpLOpdCz5-Kan-7R~39130NvN-~AM9KCUnZkh61cJ5yZD1UarLHy~EWr0Rj853gl5-rpZ0RNoNAsKnLvOL4XJOgEekQLnT0eSKg2SeZCk8uQbFiH5KXDPj87HMbmdSvVLgTLAwP2fN1Nhtzw3gcp42uD055wO45FtSz3Xf4wyNH5boxDvbgQriq9EzGfqmcPl1BQHC~MVBIxGrcOX6w77mJ4J7uOuzvgGx8ilvmOw6u30FcNWKX0sOzpNe0iG1Dv46Fg8Ah1BK7whP8uV5Sq6Ps5tE8X24g__",
                      healthStatus: "2.7 km",
                      status: "2.7 km",
                      idShelter: "2.7 km",
                      createdAt: "2.7 km",
                    ),
                  ],
                ),
                _buildSection(
                  title: "Refugios cercanos",
                  entidad: "shelters",
                  cards: [
                    RefugeCard(
                      name: "Refugio feliz",
                      location: "Gral. Rodríguez",
                      distance: "2.7 km",
                      imageUrl:
                          "https://s3-alpha-sig.figma.com/img/cdbe/ca63/b199aea121ed5b9abefa4910bfb8f027?Expires=1740355200&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=PdPuAODJgQFHe~-raVJQwwo-WxnGHOOB8LPHmwaIoY3L9ODK57sT3lNCxbc3hV5hakhD7dbEQphlKE~Y8DyW~l7CNzxvJ6f5BFnd2R-IqI-mS~eYLsO6UP3jqCyyX5f1HRTI30PPGJItdZd-JoQdAiJ7Xm9ZnnEnajKslNEyMnF8iGAst-A0id-4WbRydF4Ml-gh5nlVDPxK9aWDdGAYgiYTW~rTusrFtzqAqPbPxDG8GnVvCMmFi-Sr9MwyEPZR5avWJSss0cXLzKOx2ZIyal0EUFOJBrN~A5tRKXRa96rClikd5NDPix-~THZk5extsmoIShnVAYwjFj-OkXuUXA__",
                    ),
                    RefugeCard(
                      name: "El Campito refugio",
                      location: "Gral. Rodríguez",
                      distance: "2.7 km",
                      imageUrl:
                          "https://s3-alpha-sig.figma.com/img/45e4/2683/910c44f84c3991f2968835f41725879c?Expires=1740355200&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=rJtJVExTBiES2W~7vZo78tuLLVaeGKKiSm9PoCBRV46OQYpDFL83jzf0pyuBHIb8u0AMq4A1gFAaU8m~fiQYc1ZEzUdcYNjJoRjmEEKn87By5w48HQXPK1eeUORg4VlC6X8hiFmjaWG~ht9PLrtlwxhkGSAGBUpWDZ0VjHGm4vUJXf6-9LTj4FRsvwh7Mq5Q48aTbBYYXvf67udQtP2JxRWbBLvRJU2jPFN4HjJ1whrjK3Q~i~Iuw4acaJtARkY8Q3xJG15Qkv3D53-9j6sFc8DBUvLitiiaq3uHrf4RN18An~cVT3k8EHjmbUW-FKeA~Hd4NzdKVonezAM3PBEdOQ__",
                    ),
                  ],
                ),
              ],
            ),
          ),
          bottomNavigationBar: NavBar(
            selectedIndex: _selectedIndex, // Pasar el índice seleccionado
            onItemTapped: _onItemTapped, // Pasar la función de actualización
          ),
        );
      },
    );
  }

  Widget _buildSection({required String title, required String entidad, required List<Widget> cards}) {
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
                    MaterialPageRoute(builder: (context,) => entidad == "shelters" ? AllShelters() :  AllPets()),
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