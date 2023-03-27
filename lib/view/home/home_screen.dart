import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:textstyle_extensions/textstyle_extensions.dart';

import '../../model/base/idiom.dart';
import '../../model/base/proverb.dart';
import '../../model/base/saying.dart';
import '../../model/base/word.dart';
import '../../navigator/main_navigator.dart';
import '../../navigator/route_names.dart';
import '../../theme/theme_colors.dart';
import '../../theme/theme_styles.dart';
import '../../util/constants/app_constants.dart';
import '../../vm/home/home_vm.dart';
import '../../widget/action/list_items.dart';
import '../../widget/general/labels.dart';
import '../../widget/progress/circular_progress.dart';
import '../../widget/provider/provider_widget.dart';
import '../search/search_list1.dart';

part 'home_list1.dart';
part 'home_list2.dart';
part 'home_list3.dart';
part 'home_list4.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = RouteNames.homeScreen;
  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> implements HomeNavigator {
  Size? size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return ProviderWidget<HomeVm>(
      create: () => GetIt.I()..init(this),
      consumerWithThemeAndLocalization:
          (context, vm, child, theme, localization) {
        var filterContainer = SizedBox(
          height: 50,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: AppConstants.filters.length,
            itemBuilder: (context, index) {
              final bool isSelected =
                  vm.setPage == AppConstants.homeLists[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: RawMaterialButton(
                  fillColor: isSelected ? Colors.white : ThemeColors.primary,
                  highlightColor: Colors.white,
                  focusElevation: 0,
                  hoverColor: ThemeColors.primaryDark,
                  hoverElevation: 1,
                  highlightElevation: 0,
                  elevation: 0,
                  padding: EdgeInsets.zero,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      topLeft: Radius.circular(10),
                    ),
                  ),
                  onPressed: () => setState(() {
                    vm.setPage = AppConstants.homeLists[index];
                  }),
                  child: Text(
                    AppConstants.filters[index].toUpperCase(),
                    style: TextStyles.Btn.bold.textColor(
                        isSelected ? ThemeColors.primary : Colors.white),
                  ),
                ),
              );
            },
          ),
        );
        return Scaffold(
          backgroundColor: Colors.white.withOpacity(0.8),
          appBar: AppBar(
            centerTitle: true,
            title: Text(AppConstants.appTitle,
                style: TextStyles.Callout.bold.size(25)),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(50),
              child: filterContainer,
            ),
            /*leading: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: InkWell(
                onTap: () async {},
                child: const Padding(
                  padding: EdgeInsets.all(10),
                  child: Icon(Icons.settings),
                ),
              ),
            ),*/
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: InkWell(
                  onTap: () async {
                    await showSearch(
                      context: context,
                      delegate: SearchList1(context, vm, size!.height),
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(10),
                    child: Icon(Icons.search),
                  ),
                ),
              ),
            ],
          ),
          body: SafeArea(
            child: vm.isLoading
                ? const CircularProgress()
                : Row(
                    children: <Widget>[
                      SizedBox(
                        width: 80,
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: AppConstants.letters.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(5),
                              child: FloatingActionButton(
                                heroTag: AppConstants.letters[index],
                                onPressed: () {},
                                child: Text(
                                  AppConstants.letters[index],
                                  style: const TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      IndexedStack(
                        index: AppConstants.homeLists.indexOf(vm.setPage),
                        children: <Widget>[
                          HomeList1(vm),
                          HomeList2(vm),
                          HomeList3(vm),
                          HomeList4(vm),
                        ],
                      )
                    ],
                  ),
          ),
        );
      },
    );
  }

  @override
  void goToWord() => MainNavigator.of(context).goToWord();

  @override
  void goToIdiom() => MainNavigator.of(context).goToIdiom();

  @override
  void goToSaying() => MainNavigator.of(context).goToSaying();

  @override
  void goToProverb() => MainNavigator.of(context).goToProverb();

  @override
  void goToListView() => MainNavigator.of(context).goToListView();

  @override
  void goToHelpDesk() => MainNavigator.of(context).goToHelpDesk();

  @override
  void goToDonation() => MainNavigator.of(context).goToDonation();

  @override
  void goToSettings() => MainNavigator.of(context).goToSettings();
}
