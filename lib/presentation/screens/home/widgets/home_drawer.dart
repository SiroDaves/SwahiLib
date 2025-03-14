part of '../home_screen.dart';

class HomeDrawer extends StatefulWidget {
  final HomeScreenState parent;
  const HomeDrawer({super.key, required this.parent});

  @override
  State<HomeDrawer> createState() => HomeDrawerState();
}

class HomeDrawerState extends State<HomeDrawer> {
  late ThemeBloc _themeBloc;
  late PrefRepository _prefRepo;
  String appTheme = '';

  @override
  void initState() {
    super.initState();
    _prefRepo = getIt<PrefRepository>();
    _themeBloc = context.read<ThemeBloc>();
    appTheme = AppTheme.currentTheme();
  }

  void onThemeChanged(ThemeMode themeMode) {
    _prefRepo.updateThemeMode(themeMode);
    _themeBloc.add(ThemeModeChanged(themeMode));
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          DrawerHeader(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(AppAssets.appIcon, height: 50, width: 50),
                const Text(
                  AppConstants.appTitle,
                  style: TextStyle(
                    fontSize: 25,
                    letterSpacing: 5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  AppConstants.appTagline,
                  style: TextStyle(
                    fontSize: 16,
                    letterSpacing: 3,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.color_lens),
            title: const Text('App Theme', style: TextStyle(fontSize: 18)),
            subtitle:
                Text('Theme: $appTheme', style: const TextStyle(fontSize: 14)),
            onTap: () => selectThemeDialog(context),
          ),
          const Divider(),
        ],
      ),
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
                  appTheme = AppTheme.currentTheme();
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
