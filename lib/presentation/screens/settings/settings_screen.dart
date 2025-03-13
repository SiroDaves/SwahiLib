import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/app_util.dart';
import '../../../data/repository/pref_repository.dart';
import '../../widgets/inputs/radio_input.dart';
import '../../../core/di/injectable.dart';
import '../../theme/bloc/theme_bloc.dart';
import '../../theme/theme_colors.dart';
import '../../theme/theme_styles.dart';
import '../../blocs/settings/settings_bloc.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => SettingsScreenState();
}

class SettingsScreenState extends State<SettingsScreen> {
  late ThemeBloc _themeBloc;
  late SettingsScreenState parent;
  late PrefRepository _prefRepo;

  bool updateFound = false;
  bool isTabletOrIpad = false;

  String appTheme = '';

  @override
  void initState() {
    super.initState();
    _prefRepo = getIt<PrefRepository>();
    _themeBloc = context.read<ThemeBloc>();
    appTheme = getThemeModeString(_prefRepo.getThemeMode());
  }

  void onThemeChanged(ThemeMode themeMode) {
    _prefRepo.updateThemeMode(themeMode);
    _themeBloc.add(ThemeModeChanged(themeMode));
  }

  @override
  Widget build(BuildContext context) {
    var bodyWidget = BlocProvider(
      create: (context) => SettingsBloc()..add(const SettingsInit()),
      child: BlocConsumer<SettingsBloc, SettingsState>(
        listener: (context, state) {},
        builder: (context, state) {
          return ListView(
            children: [
              Card(
                margin: const EdgeInsets.all(Sizes.xs),
                color: ThemeColors.bgColorBW(context),
                child: ListTile(
                  leading: const Icon(Icons.color_lens),
                  title: const Text('App Theme'),
                  subtitle: Text(appTheme),
                  onTap: () => selectThemeDialog(context),
                ),
              ),
            ],
          );
        },
      ),
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: bodyWidget,
    );
  }

  Future<void> selectThemeDialog(BuildContext context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Choose Theme'),
          content: SizedBox(
            height: 135,
            child: RadioInput(
              initValue: appTheme,
              options: const ['System Theme', 'Light', 'Dark'],
              vertical: true,
              onChanged: (String? newValue) {
                setState(() {
                  switch (newValue) {
                    case 'Light':
                      onThemeChanged(ThemeMode.light);
                      break;
                    case 'Dark':
                      onThemeChanged(ThemeMode.dark);
                      break;
                    default:
                      onThemeChanged(ThemeMode.system);
                      break;
                  }
                  Navigator.of(context).pop();
                });
              },
            ),
          ),
        );
      },
    );
  }
}
