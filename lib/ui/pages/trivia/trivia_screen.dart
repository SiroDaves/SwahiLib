import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:anisi_controls/anisi_controls.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

import '../../../services/app_settings.dart';
import '../../../services/app_futures.dart';
import '../../../data/base/event_object.dart';
import '../../../data/models/trivia_cat.dart';
import '../../../utils/colors.dart';
import '../../../utils/app_utils.dart';
import '../../../utils/api_utils.dart';
import '../../widgets/trivia_options.dart';
import '../../widgets/trivia_list.dart';
import '../info/about_screen.dart';
import '../info/donate_screen.dart';
import '../info/help_desk_screen.dart';
import '../info/howto_use_screen.dart';

class TriviaScreen extends StatefulWidget {

  @override
  TriviaScreenState createState() => TriviaScreenState();
}

class TriviaScreenState extends State<TriviaScreen> {

  AsLoader loader = AsLoader.setUp(ColorUtils.primaryColor);
  AsInformer notice = AsInformer.setUp(3, AppStrings.nothing, Colors.red, Colors.transparent, ColorUtils.white, 10);
  List<TriviaCat> categories = List<TriviaCat>();
  
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => initBuild(context));
  }

  /// Method to run anything that needs to be run immediately after Widget build
  void initBuild(BuildContext context) async {
    requestData();
  }

  /// Method to request data either from the db or server
  void requestData() async {
    loader.showWidget();
    
    EventObject eventObject = await getCategories();

    switch (eventObject.id) {
      case EventConstants.requestSuccessful:
        {
          setState(() {
            loader.hideWidget();
            categories = TriviaCat.fromData(eventObject.object);
            if (categories.length == 0) notice.showWidget();
            else notice.hideWidget();
          });
        }
        break;

      case EventConstants.requestUnsuccessful:
        {
          setState(() {
            showDialog(
                context: context,
                builder: (context) => noInternetDialog());
            loader.hideWidget();
          });
        }
        break;

      case EventConstants.noInternetConnection:
        {
          setState(() {
            showDialog(
              context: context,
              builder: (context) => noInternetDialog()
            );
            loader.hideWidget();
          });
        }
        break;
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(AppStrings.triviaPage),
          elevation: 0,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                requestData();
              },
            ),
            menuPopup()
          ],
        ),
        body: Stack(
          children: <Widget>[
            mainBody(),
            TriviaList(),
          ],
        ),
      );
  }

  Widget mainBody() {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: WaveClipperTwo(),
          child: Container(
            decoration: BoxDecoration(color: Provider.of<AppSettings>(context).isDarkMode ? ColorUtils.black : ColorUtils.primaryColor),
            height: 200,
          ),
        ),
        CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5),
                child: Text(
                  AppStrings.triviaPageInstruction,
                  style: TextStyle(
                    color: ColorUtils.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 16
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(16.0),
              sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: MediaQuery.of(context).size.width > 1000 ? 7 : MediaQuery.of(context).size.width > 600 ? 5 : 3,
                  childAspectRatio: 1.2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0),
                delegate: SliverChildBuilderDelegate(
                  categoryItem,
                  childCount: categories.length,
                )
              ),
            ),
          ],
        ),
        Container(
          height: 200,
          child: notice,
        ),        
        Container(
          margin: EdgeInsets.only(top: 50),
          height: 200,
          child: Center(
            child: loader,
          ),
        ),
      ],
    );
  }

  Widget categoryItem(BuildContext context, int index) {
    TriviaCat category = categories[index];
    return MaterialButton(
      elevation: 1.0,
      highlightElevation: 1.0,
      onPressed: () => categoryPressed(context, category),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: Colors.grey.shade800,
      textColor: Colors.white70,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            decoration: new BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            /*child: FadeInImage(
              image: NetworkImage(ApiConstants.baseUrl + category.icon),
              placeholder: AssetImage(AppStrings.appIcon),
              height: 50.0,
              width: 50.0,
              fit: BoxFit.cover,
            ),*/
            child: Image.asset(AppStrings.appIcon, height: 50, width: 50)
          ),
          SizedBox(height: 5.0),
          AutoSizeText(
            category.title,
            minFontSize: 10.0,
            textAlign: TextAlign.center,
            maxLines: 3,
            wrapWords: false,
          ),
        ],
      ),
    );
  }

  categoryPressed(BuildContext context, TriviaCat category) {
    showModalBottomSheet(
      context: context,
      
      builder: (sheetContext) => BottomSheet(
        builder: (_) => TriviaOptions(
          category: category,
        ),
        onClosing: () {},
      ),
    );
  }
  
  Widget noInternetDialog() {
    return AlertDialog(
      title: Text(
        ApiStrings.noConnection,
        style: TextStyle(color: ColorUtils.primaryColor, fontSize: 25),
      ),
      content: Text(
        ApiStrings.noInternetConnection,
        style: TextStyle(fontSize: 20),
      ),
      actions: <Widget>[
        Container(
          margin: EdgeInsets.all(5),
          child: FlatButton(
            child:
                Text(AppStrings.okayGotIt, style: TextStyle(fontSize: 20)),
            color: ColorUtils.primaryColor,
            textColor: ColorUtils.white,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        Container(
          margin: EdgeInsets.all(5),
          child: FlatButton(
            child: Text(AppStrings.retry, style: TextStyle(fontSize: 20)),
            color: ColorUtils.primaryColor,
            textColor: ColorUtils.white,
            onPressed: () {
              Navigator.pop(context);
              categories = List<TriviaCat>();
              requestData();
            },
          ),
        ),
      ],
    );
  }

  Widget menuPopup() => PopupMenuButton<int>(
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 1,
          child: Consumer<AppSettings>(builder: (context, AppSettings settings, _) {
            return ListTile(
              onTap: () {},
              title: Text(AppStrings.darkMode),
              trailing: Switch(
                onChanged: (bool value) => settings.setDarkMode(value),
                value: settings.isDarkMode,
              ),
            );
          }),
        ),
        PopupMenuItem(
          value: 1,
          child: Text(AppStrings.donateTabPage),
        ),
        PopupMenuItem(
          value: 2,
          child: Text(AppStrings.helpTabPage),
        ),
        PopupMenuItem(
          value: 3,
          child: Text(AppStrings.howToUse),
        ),
        PopupMenuItem(
          value: 4,
          child: Text(AppStrings.aboutApp),
        ),
      ],
      onCanceled: () { },
      onSelected: (value) {
        selectedMenu(value, context);
      },
      icon: Icon(
        Theme.of(context).platform == TargetPlatform.iOS ? Icons.more_horiz : Icons.more_vert, color: ColorUtils.white
      ),
    );

  void selectedMenu(int menu, BuildContext context) {
    switch (menu) {
      case 1:
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return DonateScreen();
          })
        );
        break;

      case 2:
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return HelpDeskScreen();
          })
        );
        break;
      case 3:
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return HowtoUseScreen();
          })
        );
        break;
      case 4:
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return AboutScreen();
          })
        );
        break;
    }
  }

}
