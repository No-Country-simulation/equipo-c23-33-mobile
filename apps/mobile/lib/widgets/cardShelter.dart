// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ShelterCard extends StatelessWidget {
  final String address;
  final String createdAt;
  final String email;
  final String followers;
  final String idAdmin;
  final String idUser;
  final String name;
  final String photoUrl;
  final String petCapacity;
  final String phone;
  final String publications;

  const ShelterCard({
    super.key,
    required this.address,
    required this.createdAt,
    required this.email,
    required this.followers,
    required this.idAdmin,
    required this.idUser,
    required this.name,
    required this.petCapacity,
    required this.photoUrl,
    required this.phone,
    required this.publications,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.all(4.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              photoUrl,
              height: 93,
              width: double.infinity,
              fit: BoxFit.cover,
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                } else {
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              (loadingProgress.expectedTotalBytes ?? 1)
                          : null,
                    ),
                  );
                }
              },
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.error);
              },
            ),
          ),
          Container(
            padding:const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontFamily: 'Pally Variable',
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      height: 18.9 / 14,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    address,
                    style: TextStyle(
                      fontFamily: 'Pally Variable',
                      fontWeight: FontWeight.w400,
                      fontSize: 11.71,
                      height: 15.81 / 11,
                    ),
                  ),
                ],
              )
            )
          )
        ],
      ),
    );
  }
}
