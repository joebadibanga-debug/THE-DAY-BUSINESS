import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(const TheDayBusinessApp());

class TheDayBusinessApp extends StatelessWidget {
  const TheDayBusinessApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'THE DAY BUSINESS RDC',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.red, scaffoldBackgroundColor: const Color(0xfff7f7f7)),
      home: const HomePage(),
    );
  }
}

Future<void> openWhatsApp() async {
  final uri = Uri.parse('https://wa.me/243996822203?text=Bonjour%20THE%20DAY%20BUSINESS%20RDC,%20je%20souhaite%20avoir%20des%20informations.');
  await launchUrl(uri, mode: LaunchMode.externalApplication);
}
Future<void> callNumber(String n) async {
  await launchUrl(Uri.parse('tel:$n'), mode: LaunchMode.externalApplication);
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static const listings = [
    ('Appartement — Ngaliema Mimosa', '700 USD', '3 chambres • double salon • 3 salles de bain'),
    ('Villa — Ma Campagne', '2 700 USD', '5 chambres • 3 salons • 4 salles de bain'),
    ('Parcelle — GB Maman Sofa', '65 000 USD', 'Morcellement • 6 m × 18 m'),
    ('Appartement — Mont-Ngafula', '350 USD', '2 chambres • grand salon • cuisine • salle de bain'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('THE DAY BUSINESS RDC', style: TextStyle(fontWeight: FontWeight.bold)), centerTitle: true),
      drawer: Drawer(child: ListView(children: [DrawerHeader(decoration: const BoxDecoration(color: Colors.white), child: Image.asset('assets/logo.png')), const ListTile(leading: Icon(Icons.home), title: Text('Accueil')), const ListTile(leading: Icon(Icons.favorite_border), title: Text('Favoris')), const ListTile(leading: Icon(Icons.add_business), title: Text('Publier un bien'))])),
      body: ListView(padding: const EdgeInsets.all(16), children: [
        ClipRRect(borderRadius: BorderRadius.circular(18), child: Image.asset('assets/logo.png', height: 220, fit: BoxFit.contain, color: null)),
        const SizedBox(height: 12),
        const Text('Achetez, louez et investissez avec THE DAY BUSINESS RDC', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
        const SizedBox(height: 18),
        TextField(decoration: InputDecoration(prefixIcon: const Icon(Icons.search), hintText: 'Rechercher une commune, un quartier...', filled: true, fillColor: Colors.white, border: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide.none))),
        const SizedBox(height: 20),
        const Text('Biens disponibles', style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        ...listings.map((x) => Card(margin: const EdgeInsets.only(bottom: 12), child: ListTile(contentPadding: const EdgeInsets.all(14), leading: const CircleAvatar(backgroundColor: Colors.red, child: Icon(Icons.home_work, color: Colors.white)), title: Text(x.$1, style: const TextStyle(fontWeight: FontWeight.bold)), subtitle: Text(x.$3), trailing: Text(x.$2, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.red))))),
        const SizedBox(height: 12),
        Row(children: [Expanded(child: FilledButton.icon(onPressed: openWhatsApp, icon: const Icon(Icons.chat), label: const Text('WhatsApp'))), const SizedBox(width: 10), Expanded(child: OutlinedButton.icon(onPressed: () => callNumber('+243829325793'), icon: const Icon(Icons.phone), label: const Text('Appeler')))]),
        const SizedBox(height: 16),
        const Text('Contact : immotheday@gmail.com\nVodacom : +243 829 325 793\nOrange : +243 850 765 454\nWhatsApp : +243 996 822 203', textAlign: TextAlign.center),
      ]),
    );
  }
}
