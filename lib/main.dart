import 'package:flutter/material.dart';
import 'config.dart';

void main() {
  runApp(const LaPaixDuCoeurApp());
}

class LaPaixDuCoeurApp extends StatelessWidget {
  const LaPaixDuCoeurApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'La Paix du Cœur - Client',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MainHomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({super.key});

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const TransportTab(),
    const MarketTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      app: AppBar(
        title: Text(_currentIndex == 0 ? 'Transport & VTC' : 'Marché & E-commerce'),
        backgroundColor: Colors.green[700],
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_car),
            label: 'Transport',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: 'Marché',
          ),
        ],
      ),
    );
  }
}

class TransportTab extends StatelessWidget {
  const TransportTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Serveur : ${Config.serveurUrl}', style: const TextStyle(fontSize: 12, color: Colors.grey)),
          const SizedBox(height: 10),
          const Text('Choisissez votre service :', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              children: const [
                ServiceTile(title: 'Taxi', icon: Icons.local_taxi, color: Colors.amber),
                ServiceTile(title: 'Course', icon: Icons.directions_run, color: Colors.blue),
                ServiceTile(title: 'Livraison', icon: Icons.local_shipping, color: Colors.orange),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MarketTab extends StatelessWidget {
  const MarketTab({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = ['Alimentaire', 'Vestimentaire', 'Téléphones', 'Accessoires', 'Location Sono'];

    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          child: ListTile(
            leading: const Icon(Icons.shopping_bag, color: Colors.green),
            title: Text(categories[index], style: const TextStyle(fontWeight: FontWeight.bold)),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {},
          ),
        );
      },
    );
  }
}

class ServiceTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;

  const ServiceTile({super.key, required this.title, required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 28,
              backgroundColor: color.withOpacity(0.2),
              child: Icon(icon, size: 28, color: color),
            ),
            const SizedBox(height: 10),
            Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
