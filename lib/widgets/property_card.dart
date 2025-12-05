import 'package:flutter/material.dart';
import '../models/property.dart';
import '../screens/property_detail_screen.dart';

class PropertyCard extends StatelessWidget {
  final Property property;
  const PropertyCard({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => PropertyDetailScreen(property: property)),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                  child: Image.network(property.imageUrl, height: 200, width: double.infinity, fit: BoxFit.cover),
                ),
                if (property.isFeatured)
                  Positioned(
                    top: 12,
                    right: 12,
                    child: Chip(backgroundColor: Colors.amber[700], label: Text('TOP-ANGEBOT', style: TextStyle(color: Colors.white))),
                  ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(property.title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text('${property.price.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]}.')} €',
                      style: TextStyle(fontSize: 22, color: Colors.indigo[700], fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.location_on, size: 16, color: Colors.grey[600]),
                      Text(property.location, style: TextStyle(color: Colors.grey[600])),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _InfoChip(Icons.king_bed, '${property.bedrooms} SZ'),
                      _InfoChip(Icons.bathtub, '${property.bathrooms} Bad'),
                      _InfoChip(Icons.square_foot, '${property.area} m²'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoChip extends StatelessWidget {
  final IconData icon;
  final String label;
  const _InfoChip(this.icon, this.label);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 18, color: Colors.indigo),
        const SizedBox(width: 4),
        Text(label),
      ],
    );
  }
}