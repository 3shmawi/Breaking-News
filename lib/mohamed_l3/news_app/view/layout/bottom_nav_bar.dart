part of "view.dart";

class DeNavBar extends StatelessWidget {
  const DeNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppController, AppStates>(
      buildWhen: (previous, current) =>
          current is ChangeCurrentIndexState || current is ChangeDarkModeState,
      builder: (context, state) {
        final cubit = context.read<AppController>();
        return BottomNavigationBar(
          currentIndex: cubit.currentIndex,
          onTap: (index) {
            cubit.changeIndex(index);
          },
          items: List.generate(
            AppConsts.categories.length,
            (index) => BottomNavigationBarItem(
              icon: Image.asset(
                AppConsts.icons[index],
                color: cubit.currentIndex == index
                    ? cubit.darkMode
                        ? Colors.white
                        : NewsColors.primary
                    : Colors.grey,
                height: 24,
                width: 24,
              ),
              label: AppConsts.categories[index],
            ),
          ),
        );
      },
    );
  }
}
