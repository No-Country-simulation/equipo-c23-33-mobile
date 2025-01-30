import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: const Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text(
              "Perfil",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          leading: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: IconButton(
                icon: const Icon(Icons.notifications_outlined,
                    color: Colors.black),
                onPressed: () {},
              ),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1),
            child: Container(
              color: Colors.grey[300],
              height: 1,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 5,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage("assets/images/logo_perfil.png"),
                  backgroundColor: Colors.transparent,
                ),
                const SizedBox(height: 10),
                const Text(
                  "El Campito refugio",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: const [
                        Text(
                          "Seguidores",
                          style: TextStyle(color: Colors.black54),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "4.5k",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 30),
                      height: 30,
                      width: 1,
                      color: Colors.grey,
                    ),
                    Column(
                      children: const [
                        Text(
                          "Publicaciones",
                          style: TextStyle(color: Colors.black54),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "15",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // TAB BAR (Menú deslizable)
          Expanded(
            child: DefaultTabController(
              length: 2, // Número de pestañas
              child: Column(
                children: [
                  // Barra de pestañas
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[100], // Fondo gris claro
                      borderRadius: BorderRadius.circular(15),
                    ),
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: TabBar(
                      indicator: BoxDecoration(
                        color: Colors
                            .white, // Fondo blanco de la pestaña seleccionada
                        borderRadius: BorderRadius.circular(15),
                      ),

                      indicatorPadding: const EdgeInsets.symmetric(
                          horizontal: -40, vertical: 5), // Ajusta ancho y alto
                      labelColor: Colors.red, // Color del texto seleccionado
                      unselectedLabelColor:
                          Colors.black54, // Color del texto no seleccionado
                      labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                      tabs: const [
                        Tab(text: "Publicaciones"),
                        Tab(text: "Perfil"),
                      ],
                    ),
                  ),

                  // Contenido de cada pestaña
                  Expanded(
                    child: TabBarView(
                      children: [
                        // Contenido de "Publicaciones"
                        Center(child: Text("Aquí irán las publicaciones")),

                        // Contenido de "Perfil"
                        Center(
                            child: Text("Aquí irá la información del perfil")),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
