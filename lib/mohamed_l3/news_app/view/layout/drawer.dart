part of 'view.dart';

class DeDrawer extends StatelessWidget {
  const DeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppController, AppStates>(
      buildWhen: (previous, current) =>
          current is GetAppInfoState ||
          current is ChangeDarkModeState ||
          current is ChangeCountryState,
      builder: (context, state) {
        final cubit = context.read<AppController>();
        return Drawer(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.horizontal(
              right: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              DrawerHeader(
                margin: EdgeInsets.zero,
                padding: EdgeInsets.zero,
                decoration: BoxDecoration(color: NewsColors.primary),
                child: Center(
                  child: Column(
                    children: [
                      const Spacer(),
                      const Spacer(),
                      const Spacer(),
                      Image.asset(
                        AppAssets.logo,
                        height: 100,
                        width: 100,
                        color: Colors.white,
                      ),
                      const Spacer(),
                      Text(
                        cubit.version,
                        style: const TextStyle(
                          color: NewsColors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              _darkModeBtn(cubit),
              const Divider(),
              _countryBtn(cubit),
              const Divider(),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  "@powered by Mohamed Wa2el",
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _darkModeBtn(cubit) => ListTile(
        leading: const Icon(Icons.light_mode),
        title: const Text('Dark mode'),
        trailing: Switch(
          value: cubit.darkMode,
          onChanged: (value) {
            cubit.changeDarkMode();
          },
        ),
      );

  Widget _countryBtn(AppController cubit) => ListTile(
        leading: Text(
          cubit.flag,
          style: const TextStyle(fontSize: 30),
        ),
        title: Text(cubit.defaultCountry),
        trailing: _popUpCountryBtn(cubit),
      );

  _popUpCountryBtn(AppController cubit) {
    return PopupMenuButton<String>(
      icon: const Icon(Icons.arrow_drop_down_circle_outlined),
      onSelected: (value) {
        cubit.changeCountry(value);
      },
      itemBuilder: (context) {
        return AppConsts.countryCodes.keys.map((e) {
          return PopupMenuItem<String>(
            value: e,
            child: Text(e),
          );
        }).toList();
      },
    );
  }
}
