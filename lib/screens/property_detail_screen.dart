import 'package:flutter/material.dart';
import '../models/property.dart';

class PropertyDetailScreen extends StatelessWidget {
  final Property property;

  const PropertyDetailScreen({
    super.key,
    required this.property,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(property.title), // Убрали ??
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Заголовок
            Text(
              property.title, // Убрали ??
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 8),
            
            // Цена
            Text(
              'Цена: €${property.price.toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            
            // Местоположение
            Row(
              children: [
                const Icon(Icons.location_on, size: 16),
                const SizedBox(width: 4),
                Text(property.location),
              ],
            ),
            const SizedBox(height: 16),
            
            // Характеристики
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildFeature('Спальни', property.bedrooms.toString(), Icons.bed),
                _buildFeature('Ванные', property.bathrooms.toString(), Icons.bathtub),
                _buildFeature('Площадь', '${property.area} м²', Icons.square_foot),
              ],
            ),
            const SizedBox(height: 24),
            
            // Описание
            Text(
              'Описание:',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(property.description),
          ],
        ),
      ),
    );
  }

  Widget _buildFeature(String label, String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, size: 32),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(
          label,
          style: const TextStyle(fontSize: 14, color: Colors.grey),
        ),
      ],
    );
  }
}