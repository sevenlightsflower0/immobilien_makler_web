import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../widgets/navigation_bar.dart';
import '../widgets/property_card.dart';
import '../models/property.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Property> featuredProperties = [
    Property(
      id: '1',
      title: 'Moderne Stadtvilla in Bogenhausen',
      price: 1890000,
      location: 'München-Bogenhausen',
      bedrooms: 5,
      bathrooms: 3,
      area: 220,
      imageUrl: 'https://images.unsplash.com/photo-1613490493576-7fde63acd811?w=800',
      description: 'Exklusive Villa mit Garten und Dachterrasse...',
      isFeatured: true,
    ),
    // weitere Objekte...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          children: [
            Icon(Icons.home_work, color: Colors.indigo[700]),
            const SizedBox(width: 12),
            Text('Immobilien Müller', style: TextStyle(color: Colors.indigo[900], fontWeight: FontWeight.bold)),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pushNamed(context, '/kontakt'), child: const Text('Beratungstermin')),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Hero Section
            Stack(
              children: [
                CarouselSlider(
                  options: CarouselOptions(height: 600, autoPlay: true, viewportFraction: 1),
                  items: featuredProperties.map((p) {
                    return Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.network(p.imageUrl, fit: BoxFit.cover),
                        Container(color: Colors.black45),
                        Padding(
                          padding: const EdgeInsets.all(60),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Ihr Traumhaus wartet bereits', style: TextStyle(fontSize: 48, color: Colors.white, fontWeight: FontWeight.bold)),
                              const SizedBox(height: 20),
                              Text('Exklusive Immobilien in und um München', style: TextStyle(fontSize: 24, color: Colors.white)),
                              const SizedBox(height: 40),
                              ElevatedButton(
                                onPressed: () => Navigator.pushNamed(context, '/immobilien'),
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 18),
                                  backgroundColor: Colors.amber[700],
                                ),
                                child: const Text('Aktuelle Angebote ansehen', style: TextStyle(fontSize: 18)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ],
            ),

            // Suchleiste
            Container(
              padding: const EdgeInsets.all(40),
              color: Colors.indigo[900],
              child: Column(
                children: [
                  const Text('Finden Sie Ihr neues Zuhause', style: TextStyle(fontSize: 32, color: Colors.white)),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 300,
                        child: TextField(decoration: InputDecoration(fillColor: Colors.white, filled: true, hintText: 'Stadt, PLZ oder Stadtteil')),
                      ),
                      const SizedBox(width: 20),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                        ),
                        child: const Text('Suchen'),
                      )
                    ],
                  ),
                ],
              ),
            ),

            // Highlight-Immobilien
            Padding(
              padding: const EdgeInsets.all(60),
              child: Column(
                children: [
                  const Text('Unsere Top-Immobilien', style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 40),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 400,
                      childAspectRatio: 1.1,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                    ),
                    itemCount: featuredProperties.length,
                    itemBuilder: (ctx, i) => PropertyCard(property: featuredProperties[i]),
                  ),
                ],
              ),
            ),

            // Über uns Teaser
            Container(
              padding: const EdgeInsets.all(80),
              color: Colors.grey[100],
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Seit 20 Jahren Ihr vertrauensvoller Partner', style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 20),
                        const Text('Wir kennen den Münchner Immobilienmarkt wie unsere Westentasche...'),
                        const SizedBox(height: 30),
                        ElevatedButton(onPressed: () => Navigator.pushNamed(context, '/ueber-uns'), child: const Text('Mehr über uns erfahren')),
                      ],
                    ),
                  ),
                  Image.network('https://images.unsplash.com/photo-1560472354-b33ff0c44a43?w=600', width: 400),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomNavigationBar(currentIndex: 0),
    );
  }
}