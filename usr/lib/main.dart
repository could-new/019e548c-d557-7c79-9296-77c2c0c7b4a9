import 'package:flutter/material.dart';

void main() {
  runApp(const PerovskiteApp());
}

class PerovskiteApp extends StatelessWidget {
  const PerovskiteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Résumé : Pérovskite',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.amber,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.amber,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const PerovskiteHomePage(),
      },
    );
  }
}

class PerovskiteHomePage extends StatelessWidget {
  const PerovskiteHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('La Pérovskite'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 800),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeaderCard(context),
                  const SizedBox(height: 24),
                  _buildSectionTitle(context, "Qu'est-ce que la Pérovskite ?"),
                  _buildParagraph(
                    "La pérovskite désigne initialement un minéral (le titanate de calcium, CaTiO3) découvert dans l'Oural en 1839 par Gustav Rose et nommé en l'honneur du minéralogiste russe Lev Perovski. Par extension, le terme \"pérovskite\" désigne toute classe de matériaux partageant la même structure cristalline (ABX3).",
                  ),
                  const SizedBox(height: 24),
                  _buildSectionTitle(context, 'Applications Principales'),
                  _buildFeatureCard(
                    context,
                    icon: Icons.solar_power,
                    title: 'Énergie Solaire',
                    description:
                        "Les cellules solaires à pérovskite sont considérées comme la plus grande percée technologique récente dans le domaine du photovoltaïque. Leur rendement de conversion énergétique a progressé de manière fulgurante (passant de ~3% en 2009 à plus de 26% aujourd'hui), rivalisant avec le silicium.",
                  ),
                  const SizedBox(height: 12),
                  _buildFeatureCard(
                    context,
                    icon: Icons.lightbulb_outline,
                    title: 'LEDs et Affichages',
                    description:
                        "Grâce à leurs excellentes propriétés optiques et à la possibilité de régler facilement leur couleur d'émission (bandgap accordable), les pérovskites sont très prometteuses pour la prochaine génération d'écrans et d'éclairages LED.",
                  ),
                  const SizedBox(height: 12),
                  _buildFeatureCard(
                    context,
                    icon: Icons.sensors,
                    title: 'Détecteurs et Lasers',
                    description:
                        'Les pérovskites sont également utilisées pour fabriquer des détecteurs de rayons X très sensibles, des photodétecteurs et des lasers, grâce à leur forte absorption de la lumière et à la grande mobilité de leurs porteurs de charge.',
                  ),
                  const SizedBox(height: 24),
                  _buildSectionTitle(context, 'Avantages et Promesses'),
                  _buildList([
                    'Fabrication à bas coût : Contrairement au silicium qui nécessite des températures extrêmement élevées, les pérovskites peuvent être traitées en solution à basse température.',
                    'Flexibilité et légèreté : Elles peuvent être imprimées sur des substrats flexibles (plastique, feuilles métalliques), ouvrant la voie à des panneaux solaires portables ou intégrés aux bâtiments.',
                    "Haut rendement : Leur capacité d'absorption lumineuse est exceptionnelle.",
                  ]),
                  const SizedBox(height: 24),
                  _buildSectionTitle(context, 'Défis Actuels'),
                  _buildList([
                    "Stabilité : Les cellules à pérovskite se dégradent rapidement face à l'humidité, la chaleur et la lumière intense. L'amélioration de leur durée de vie est le principal défi actuel.",
                    'Toxicité : Les pérovskites les plus performantes contiennent actuellement du plomb, ce qui soulève des préoccupations environnementales et de recyclage.',
                    "Mise à l'échelle : Passer de petites cellules en laboratoire à de grands modules commerciaux sans perte significative de rendement reste complexe.",
                  ]),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderCard(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(24.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.primaryContainer,
              Theme.of(context).colorScheme.secondaryContainer,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            Icon(
              Icons.science,
              size: 64,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 16),
            Text(
              'Le matériau du futur',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              'Une révolution dans les énergies renouvelables et l\\'optoélectronique.',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary,
            ),
      ),
    );
  }

  Widget _buildParagraph(String text) {
    return Text(
      text,
      style: const TextStyle(fontSize: 16, height: 1.5),
      textAlign: TextAlign.justify,
    );
  }

  Widget _buildFeatureCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Card(
      margin: EdgeInsets.zero,
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: const TextStyle(height: 1.4),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildList(List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items.map((item) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('• ', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Expanded(
                child: Text(
                  item,
                  style: const TextStyle(fontSize: 16, height: 1.5),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
