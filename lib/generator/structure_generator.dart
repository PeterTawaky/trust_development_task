import 'dart:developer';
import 'dart:io';

import 'templates.dart';

class StructureGenerator {
  const StructureGenerator._();
  static Future<void> coreFolders() async {
    final structure = {
      'lib/core/utils': [
        'app_assets.dart',
        'app_colors.dart',
        'app_constants.dart',
        'app_strings.dart',
        'app_functions.dart',
        'app_logger.dart',
        'app_shadows.dart',
        'app_enums.dart',
        'app_durations.dart',
        'app_dimensions.dart',
      ],
      'lib/core/utils/extensions': ['context_extensions.dart'],
      'lib/core/observers': ['app_bloc_observer.dart'],
    };

    for (var entry in structure.entries) {
      final folder = entry.key;
      final files = entry.value;

      await Directory(folder).create(recursive: true);
      log('Created folder: $folder');

      for (var file in files) {
        final filePath = '$folder/$file';

        final fileRef = File(filePath);
        if (await fileRef.exists()) {
          log('Skipped existing file: $filePath');
        } else {
          final content = templates[file] ?? '';
          await fileRef.writeAsString(content);
          log('Created file: $filePath');
        }
      }
    }

    log('All folders and files created successfully!');
  }

  static Future<void> assetsFolders() async {
    final structure = <String, List<String>>{
      'assets/animations': [],
      'assets/fonts': [],
      'assets/icons': [],
      'assets/images': [],
      'assets/sounds': [],
      'assets/videos': [],
    };

    for (final entry in structure.entries) {
      final folder = entry.key;
      final files = entry.value;

      await Directory(folder).create(recursive: true);
      log('Created folder: $folder');

      for (final file in files) {
        final filePath = '$folder/$file';
        final fileRef = File(filePath);

        if (await fileRef.exists()) {
          log('Skipped existing file: $filePath');
          continue;
        }

        // If you already have a `templates` map like in coreFolders(),
        // we'll use it. Otherwise, create a minimal placeholder.
        final lower = file.toLowerCase();
        if (lower.endsWith('.png')) {
          // Placeholder empty PNG file (0 bytes is fine as a placeholder to be replaced later)
          await fileRef.writeAsBytes(const <int>[]);
        } else if (lower.endsWith('.json')) {
          final content = templates[file] ?? '{}'; // minimal valid JSON
          await fileRef.writeAsString(content);
        } else {
          // .gitkeep or any other text placeholder
          final content = templates[file] ?? '';
          await fileRef.writeAsString(content);
        }

        log('Created file: $filePath');
      }
    }

    log('Assets folders and files created successfully!');
  }

  static Future<void> mvvmArch(List<String> features) async {
    coreFolders();
    assetsFolders();
    //for architecture
    for (int index = 0; index < features.length; index++) {
      // Define the Architecture structure
      final structure = {
        //!-------------------------------------
        //!      Data Layer
        //!-------------------------------------
        'lib/features/${features[index]}/data/models': [],
        'lib/features/${features[index]}/data/repositories': [
          '${features[index]}_repo.dart',
          '${features[index]}_repo_impl.dart',
        ],

        //!-------------------------------------
        //!      Presentation Layer
        //!-------------------------------------
        'lib/features/${features[index]}/presentation/managers': [],
        'lib/features/${features[index]}/presentation/views/widgets': [
          '${features[index]}_view_body.dart',
        ],
        'lib/features/${features[index]}/presentation/views/': [
          '${features[index]}_view.dart',
        ],
      };

      for (var entry in structure.entries) {
        final folder = entry.key;
        final files = entry.value;

        await Directory(folder).create(recursive: true);
        log('Created folder: $folder');

        for (var file in files) {
          final filePath = '$folder/$file';

          final fileRef = File(filePath);
          if (await fileRef.exists()) {
            log('Skipped existing file: $filePath');
          } else {
            final content = templates[file] ?? '';
            await fileRef.writeAsString(content);
            log('Created file: $filePath');
          }
        }
      }

      log('All folders and files created successfully!');
    }
  }
}
