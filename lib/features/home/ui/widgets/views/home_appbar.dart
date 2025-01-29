part of '../../home_screen.dart';

class HomeAppBar extends StatefulWidget implements PreferredSizeWidget {
  final HomeScreenState parent;
  const HomeAppBar({super.key, required this.parent});

  @override
  HomeAppBarState createState() => HomeAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(100);
}

class HomeAppBarState extends State<HomeAppBar> {
  late HomeScreenState parent;

  @override
  Widget build(BuildContext context) {
    parent = widget.parent;
    /*var leadingAction = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: InkWell(
        onTap: () async {},
        child: const Padding(
          padding: EdgeInsets.all(10),
          child: Icon(Icons.settings),
        ),
      ),
    );*/

    var actionButtons = <Widget>[
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: InkWell(
          onTap: () async {
            /*await showSearch(
                      context: context,
                      delegate: SearchList1(context, vm, size!.height),
                    );*/
          },
          child: const Padding(
            padding: EdgeInsets.all(10),
            child: Icon(Icons.search),
          ),
        ),
      ),
    ];

    var tabActions = PreferredSize(
      preferredSize: const Size.fromHeight(50),
      child: SizedBox(
        height: 50,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: AppConstants.filters.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: RawMaterialButton(
                fillColor: ThemeColors.primary,
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
                onPressed: () {},
                child: Text(
                  AppConstants.filters[index].toUpperCase(),
                  style:
                      TextStyles.buttonTextStyle.bold.textColor(Colors.white),
                ),
              ),
            );
          },
        ),
      ),
    );

    return AppBar(
      centerTitle: true,
      title: Text(
        '${AppConstants.appTitle} - ${AppConstants.appTitle1}',
        style: TextStyles.headingStyle1.bold.size(25),
      ),
      //leading: leadingAction,
      actions: actionButtons,
      bottom: tabActions,
    );
  }
}
