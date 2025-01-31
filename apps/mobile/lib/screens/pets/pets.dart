import 'package:flutter/material.dart';
import 'package:mobile/screens/pets/pets_nav_bar.dart';

class Pets extends StatefulWidget {
  final int selectedIndex; // Índice seleccionado
  final Function(int) onItemTapped; // Función para actualizar el índice

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
  bool hasPublications = false; //  para simular si hay publicaciones

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
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          // Título de la sección
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              "Publicaciones y solicitudes",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // TabBar
          TabBar(
            controller: _tabController,
            onTap: (index) {
              widget.onItemTapped(index);
            },
            indicatorColor: const Color.fromRGBO(
                231, 139, 136, 1), // Color del indicador de la pestaña
            labelColor: const Color.fromRGBO(
                45, 52, 85, 1), // Color del texto de la pestaña seleccionada
            unselectedLabelColor: const Color.fromRGBO(
                155, 149, 149, 1), // Color del texto no seleccionado
            labelStyle: const TextStyle(
              fontWeight: FontWeight
                  .bold, // Texto en negrita para pestañas seleccionadas
            ),
            unselectedLabelStyle: const TextStyle(
              fontWeight: FontWeight
                  .bold, // Texto en negrita para pestañas no seleccionadas
            ),
            tabs: const [
              Tab(text: "Mis publicaciones"),
              Tab(text: "Mis solicitudes"),
            ],
          ),

          // Contenido de las pestañas
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // Contenido para "Mis publicaciones"
                _buildPublicationsContent(),

                // Contenido para "Mis solicitudes"
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

  // Método para construir el contenido de "Mis publicaciones"
  Widget _buildPublicationsContent() {
    return Column(
      children: [
        Expanded(
          child: hasPublications
              ? ListView(
                  padding: const EdgeInsets.all(16),
                  children: const [
                    // Aquí van la lista de publicaciones
                    Text("Publicación 1"),
                    Text("Publicación 2"),
                    Text("Publicación 3"),
                  ],
                )
              : const Center(
                  child: Text(
                    "No tenés publicaciones pendientes",
                    style: TextStyle(
                      fontSize: 16,
                      color: Color.fromRGBO(31, 31, 31, 1),
                    ),
                  ),
                ),
        ),
        // Botón "Publicar nueva mascota"
        Padding(
          padding: const EdgeInsets.all(16),
          child: ElevatedButton(
            onPressed: () {
              // Acción para "Publicar nueva mascota"
              print("Publicar nueva mascota");
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromRGBO(246, 51, 94, 1),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              minimumSize: const Size(double.infinity, 50),
            ),
            child: const Text(
              "Publicar nueva mascota",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Método para construir el contenido de "Mis solicitudes"
  Widget _buildRequestsContent() {
    return const Center(
      child: Text(
        "No tenés solicitudes pendientes",
        style: TextStyle(
          fontSize: 16,
          color: Color.fromRGBO(31, 31, 31, 1),
        ),
      ),
    );
  }
}
