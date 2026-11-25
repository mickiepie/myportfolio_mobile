import 'package:material_ui/material_ui.dart';
import 'package:myportfolio_mobile/widgets/left_drawer.dart';
import 'package:myportfolio_mobile/widgets/project_card.dart';
import 'package:myportfolio_mobile/theme/app_theme.dart';

// Widget Reusable: Kartu Profil
class InfoCard extends StatelessWidget {
  final String title;
  final String content;

  const InfoCard({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: Container(
        width: MediaQuery.of(context).size.width / 3.5,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8.0),
            Text(content),
          ],
        ),
      ),
    );
  }
}

// Halaman Utama Menu
class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final String npm = "2506543905";
  final String nama = "Ria Lavenia Kharissa";
  final String kelas = "PBP A";

  final List<ItemHomepage> items = [
    ItemHomepage("Lihat Proyek", Icons.folder, AppColors.pastelYellow),
    ItemHomepage("Tambah Proyek", Icons.add_circle, AppColors.pastelGreen),
    ItemHomepage("Tambah Pengalaman", Icons.work_outline, AppColors.pastelBlue),
    ItemHomepage("Logout", Icons.logout, AppColors.pastelCream),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MyPortfolio')),
      drawer: const LeftDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InfoCard(title: 'NPM', content: npm),
                  InfoCard(title: 'Name', content: nama),
                  InfoCard(title: 'Class', content: kelas),
                ],
              ),
              const SizedBox(height: 16.0),
              Center(
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 16.0),
                      child: Text(
                        'Selamat datang di MyPortfolio Mobile!',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                    GridView.count(
                      primary: false, // <-- Ubah jadi false
                      physics: const NeverScrollableScrollPhysics(), // <-- Tambahkan ini
                      padding: const EdgeInsets.all(20),
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 3,
                      shrinkWrap: true,
                      children: items.map((ItemHomepage item) {
                        return ItemCard(item);
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
