import 'package:flutter/material.dart';
import 'package:mobile/screens/pets/PetRequestCard.dart';
import 'package:mobile/screens/pets/pets_nav_bar.dart';

class Pets extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const Pets({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  State<Pets> createState() => _PetsState();
}

class _PetsState extends State<Pets> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool hasPublications = false;

  @override
  void initState() {
    super.initState();
    final initialIndex = widget.selectedIndex.clamp(0, 1);
    _tabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: initialIndex,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Mis mascotas",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              "Publicaciones y solicitudes",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          TabBar(
            controller: _tabController,
            onTap: (index) {
              widget.onItemTapped(index);
            },
            indicatorColor: const Color.fromRGBO(231, 139, 136, 1),
            labelColor: const Color.fromRGBO(45, 52, 85, 1),
            unselectedLabelColor: const Color.fromRGBO(155, 149, 149, 1),
            labelStyle: const TextStyle(fontWeight: FontWeight.bold),
            unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
            tabs: const [
              Tab(text: "Mis publicaciones"),
              Tab(text: "Mis solicitudes"),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildPublicationsContent(),
                _buildRequestsContent(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavBar(
        selectedIndex: widget.selectedIndex,
        onItemTapped: widget.onItemTapped,
      ),
    );
  }

  Widget _buildPublicationsContent() {
    return Column(
      children: [
        Expanded(
          child: hasPublications
              ? ListView(
                  padding: const EdgeInsets.all(16),
                  children: const [
                    Text("Publicación 1"),
                    Text("Publicación 2"),
                    Text("Publicación 3"),
                  ],
                )
              : const Center(
                  child: Text(
                    "No tenés publicaciones pendientes",
                    style: TextStyle(
                        fontSize: 16, color: Color.fromRGBO(31, 31, 31, 1)),
                  ),
                ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: ElevatedButton(
            onPressed: () {
              print("Publicar nueva mascota");
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromRGBO(246, 51, 94, 1),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              minimumSize: const Size(double.infinity, 50),
            ),
            child: const Text(
              "Publicar nueva mascota",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRequestsContent() {
    final List<Map<String, String>> petRequests = [
      {
        "imageUrl": "https://ibb.co/4n2H6Fv1",
        "name": "Lola",
        "timeAgo": "Hace 2 días",
        "requestType": "Adopción",
        "gender": "Hembra",
        "age": "9 meses",
        "status": "En revisión",
      },
      {
        "imageUrl": "https://ibb.co/4n2H6Fv1",
        "name": "Bobby",
        "timeAgo": "Hace 1 semana",
        "requestType": "Adopción",
        "gender": "Macho",
        "age": "1 año",
        "status": "Aprobado",
      }
    ];

    return petRequests.isNotEmpty
        ? ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: petRequests.length,
            itemBuilder: (context, index) {
              final pet = petRequests[index];
              return PetRequestCard(
                imageUrl: pet["imageUrl"]!,
                name: pet["name"]!,
                timeAgo: pet["timeAgo"]!,
                requestType: pet["requestType"]!,
                gender: pet["gender"]!,
                age: pet["age"]!,
                status: pet["status"]!,
              );
            },
          )
        : const Center(
            child: Text(
              "No tenés solicitudes pendientes",
              style:
                  TextStyle(fontSize: 16, color: Color.fromRGBO(31, 31, 31, 1)),
            ),
          );
  }
}
