import 'package:material_ui/material_ui.dart';
import 'package:myportfolio_mobile/models/project.dart';
import 'package:myportfolio_mobile/theme/app_theme.dart';

class ProjectDetailScreen extends StatelessWidget {
  const ProjectDetailScreen({required this.project, super.key});

  final Project project;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(project.title)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (project.thumbnail.isNotEmpty) ...[
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  project.thumbnail,
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 120,
                    color: AppColors.surface,
                    alignment: Alignment.center,
                    child: const Text('Gagal memuat gambar proyek'),
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
            Text(
              project.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            if (project.techStack.isNotEmpty) ...[
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: AppColors.pastelYellow,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'Tech Stack: ${project.techStack}',
                  style: const TextStyle(
                    color: AppColors.textDark,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
            const Text(
              'Deskripsi',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              project.description,
              style: const TextStyle(fontSize: 15, height: 1.5),
            ),
            const SizedBox(height: 16),
            if (project.link.isNotEmpty) ...[
              const Text(
                'Tautan Proyek',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              SelectableText(
                project.link,
                style: const TextStyle(
                  color: AppColors.pastelBlue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
