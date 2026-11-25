import 'package:material_ui/material_ui.dart';
import 'package:myportfolio_mobile/models/project.dart';
import 'package:myportfolio_mobile/screens/project_list_screen.dart';
import 'package:myportfolio_mobile/services/api_client.dart';
import 'package:myportfolio_mobile/services/auth_state.dart';
import 'package:myportfolio_mobile/widgets/auth_guard.dart';
import 'package:myportfolio_mobile/widgets/left_drawer.dart';
import 'package:provider/provider.dart';

class ProjectFormPage extends StatefulWidget {
  const ProjectFormPage({super.key});

  @override
  State<ProjectFormPage> createState() => _ProjectFormPageState();
}

class _ProjectFormPageState extends State<ProjectFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _title = "";
  String _description = "";
  String _techStack = "";
  String _link = "";
  String _thumbnail = "";
  bool _isSubmitting = false;

  bool _isValidUrl(String value) {
    final uri = Uri.tryParse(value);
    return uri != null &&
        (uri.scheme == 'http' || uri.scheme == 'https') &&
        uri.host.isNotEmpty;
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    if (!await ensureLoggedIn(context)) return;
    if (!mounted) return;

    final token = context.read<AuthState>().token;
    if (token == null) return;

    setState(() {
      _isSubmitting = true;
    });

    final newProject = Project(
      title: _title.trim(),
      description: _description.trim(),
      techStack: _techStack.trim(),
      link: _link.trim(),
      thumbnail: _thumbnail.trim(),
    );

    try {
      final created = await context.read<ApiClient>().createProject(
        newProject,
        token: token,
      );
      if (!mounted) return;
      await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Proyek berhasil ditambahkan!'),
            content: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Judul: ${created.title}'),
                  Text('Deskripsi: ${created.description}'),
                  Text('Tech Stack: ${created.techStack}'),
                  if (created.link.isNotEmpty) Text('Tautan: ${created.link}'),
                ],
              ),
            ),
            actions: [
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ProjectListScreen()),
      );
    } on ApiException catch (e) {
      if (!mounted) return;
      if (e.statusCode == 401) {
        await context.read<AuthState>().logout();
        if (!mounted) return;
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            const SnackBar(
              content: Text('Sesi berakhir, silakan login ulang.'),
            ),
          );
      } else {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            SnackBar(
              content: Text(
                'Gagal menyimpan proyek (${e.statusCode}): ${e.message}',
              ),
            ),
          );
      }
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text('Terjadi kesalahan: $e')));
    } finally {
      if (mounted) {
        setState(() {
          _isSubmitting = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text('Add Project Form'))),
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Judul Proyek",
                    labelText: "Title",
                  ),
                  onChanged: (String? value) {
                    _title = value ?? "";
                  },
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Judul proyek tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  maxLines: 4,
                  decoration: const InputDecoration(
                    hintText: "Deskripsi Proyek",
                    labelText: "Description",
                  ),
                  onChanged: (String? value) {
                    _description = value ?? "";
                  },
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Deskripsi proyek tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Contoh: Flutter, Django, PostgreSQL",
                    labelText: "Tech Stack",
                  ),
                  onChanged: (String? value) {
                    _techStack = value ?? "";
                  },
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Tech stack tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: "https://github.com/...",
                    labelText: "Project URL (Link)",
                  ),
                  onChanged: (String? value) {
                    _link = value ?? "";
                  },
                  validator: (String? value) {
                    if (value != null &&
                        value.trim().isNotEmpty &&
                        !_isValidUrl(value.trim())) {
                      return "Masukkan URL valid (diawali http:// atau https://)";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: "https://... (opsional)",
                    labelText: "Project Image URL / Thumbnail (Optional)",
                  ),
                  onChanged: (String? value) {
                    _thumbnail = value ?? "";
                  },
                  validator: (String? value) {
                    if (value != null &&
                        value.trim().isNotEmpty &&
                        !_isValidUrl(value.trim())) {
                      return "Masukkan URL gambar yang valid (http:// atau https://)";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: _isSubmitting ? null : _submit,
                  child: _isSubmitting
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Text("Save"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
