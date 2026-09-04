import 'package:flutter/material.dart';
import 'config.dart';

void main() {
  runApp(const LaPaixDuCoeurClientApp());
}

class LaPaixDuCoeurClientApp extends StatelessWidget {
  const LaPaixDuCoeurClientApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'La Paix du Cœur - Client',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const TransportHomeTab(),
    const MarketHomeTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      app: AppBar(
        title: Text(_currentIndex == 0 ? 'VTC & Transport' : 'Marché & E-commerce'),
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

class TransportHomeTab extends StatelessWidget {
  const TransportHomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Où souhaitez-vous aller ?', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              children: const [
                ServiceCard(title: 'Taxi', icon: Icons.local_taxi, color: Colors.amber),
                ServiceCard(title: 'Course', icon: Icons.directions_run, color: Colors.blue),
                ServiceCard(title: 'Livraison', icon: Icons.local_shipping, color: Colors.orange),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MarketHomeTab extends StatelessWidget {
  const MarketHomeTab({super.key});

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

class ServiceCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;

  const ServiceCard({super.key, required this.title, required this.icon, required this.color});

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
              radius: 30,
              backgroundColor: color.withOpacity(0.2),
              child: Icon(icon, size: 30, color: color),
            ),
            const SizedBox(height: 12),
            Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
