
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:sqflite/sqflite.dart';
import 'package:anisi_controls/anisi_controls.dart';

import 'package:kamusi/helpers/app_search_delegate.dart';
import 'package:kamusi/views/any_item.dart';
import 'package:kamusi/views/word_item.dart';
import 'package:kamusi/helpers/app_settings.dart';
import 'package:kamusi/helpers/sqlite_helper.dart';
import 'package:kamusi/models/item.dart';
import 'package:kamusi/models/word.dart';
import 'package:kamusi/utils/colors.dart';
import 'package:kamusi/utils/constants.dart';
import 'package:kamusi/screens/about_screen.dart';
import 'package:kamusi/screens/donate_screen.dart';
import 'package:kamusi/screens/help_desk_screen.dart';
import 'package:kamusi/screens/howto_use_screen.dart';

final filters = [ LangStrings.words, LangStrings.idioms, LangStrings.sayings, LangStrings.proverbs ];
final filtersTable = [ LangStrings.wordsTable, LangStrings.idiomsTable, LangStrings.sayingsTable, LangStrings.proverbsTable ];
final List<String> letters = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'R', 'S', 'T', 'U', 'V', 'W', 'Y', 'Z' ];

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => SearchScreenState();
}

class SearchScreenState extends State<SearchScreen> {
  SqliteHelper db = SqliteHelper();
  AsLoader loader = AsLoader.setUp(ColorUtils.primaryColor);
  AsInformer notice = AsInformer.setUp(3, LangStrings.nothing, Colors.red, Colors.transparent, Colors.white, 10);
  final ScrollController myScrollController = ScrollController();

  Future<Database> dbFuture;
  List<Word> searchList = List<Word>();
  List<Word> words = List<Word>();
  List<Item> items = List<Item>();
  String letterSearch;
  
  List toggles = List.generate(filters.length, (index) => false);
  String activeFilter = filters[0], activeTable = filtersTable[0];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => initBuild(context));
  }

  /// Run anything that needs to be run immediately after Widget build
  void initBuild(BuildContext context) async {
    loadListView();
  }
  
  /// Filter list based on what is active on the filter bar
  void onFilterFocus(bool focus, String filter) {
    setState(() {
      toggles[filters.indexOf(filter)] = focus;
      loadListView();
    });
  }

  /// Show a list view of the content: words, proverbs, sayings or idioms
  void loadListView() async {
    words.clear();
    items.clear();
    loader.showWidget();
    dbFuture = db.initializeDatabase();
    
    if (activeTable == filtersTable[0])
    {
      dbFuture.then((database) {
        Future<List<Word>> wordsListFuture = db.getWordList();
        wordsListFuture.then((resultList) {
          setState(() {
            if (searchList.isEmpty) searchList = words = resultList;
            else words = resultList;
            loader.hideWidget();
            if (words.length == 0) notice.showWidget();
            else notice.hideWidget();
          });
        });
      });
    }
    else {
      dbFuture.then((database) {    
        Future<List<Item>> itemListFuture = db.getItemList(activeTable);
        itemListFuture.then((resultList) {
          setState(() {
            items = resultList;
            loader.hideWidget();
            if (items.length == 0) notice.showWidget();
            else notice.hideWidget();
          });
        });
      });
    }
    
  }

  /// Show content based on the tapped letter
  void setSearchingLetter(String _letter) async {
    words.clear();
    loader.showWidget();
    letterSearch = _letter;
    dbFuture = db.initializeDatabase();

    if (activeTable == filtersTable[0])
    {
      dbFuture.then((database) {
        Future<List<Word>> wordListFuture = db.getWordSearch(_letter, true);
        wordListFuture.then((resultList) {
          setState(() {
            words = resultList;
            loader.hideWidget();
            if (words.length == 0) notice.showWidget();
            else notice.hideWidget();
          });
        });
      });
    }
    else {
      dbFuture.then((database) {
        Future<List<Item>> itemListFuture = db.getItemSearch(_letter, activeTable, true);
        itemListFuture.then((resultList) {
          setState(() {
            items = resultList;
            loader.hideWidget();
            if (items.length == 0) notice.showWidget();
            else notice.hideWidget();
          });
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {    
    return Scaffold(
      body: Container(
        decoration: Provider.of<AppSettings>(context).isDarkMode ? BoxDecoration()
            : BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [ 0.1, 0.5, 0.9 ],
            colors: [ ColorUtils.primaryColor, ColorUtils.baseColor, Colors.black ]),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: SafeArea(
          child: mainBody(),
        ),
      ),
    );
  }

  /// The whole widget making up the screen area
  Widget mainBody()
  {
    return Column(
      children: <Widget>[         
        headerBar(),
        filterBar(),
        Container(
          height: MediaQuery.of(context).size.height - 170,
          margin: EdgeInsets.only(top: 8),
          child: contentView(), 
        ),
      ],
    );
  }
  
  /// Custom Appbar: App name, Search button, Menu button 
  Widget headerBar()
  {
    return Row(
      children: <Widget>[
        Text(LangStrings.appName,
          style: TextStyle( fontSize: 25, color: Colors.white, fontWeight: FontWeight.w700 ),
        ),
        Flexible(child: Container()),
        InkWell(
          child: Icon(Icons.search, color: Colors.white),
          onTap: () async {
            final List selected = await showSearch(
              context: context,
              delegate: AppSearchDelegate(context, searchList),
            );
          },
        ),
        menuPopup(),
      ],
    );
  }
  
  /// Filter Bar: animated menu to switch between content
  Widget filterBar()
  {
    return Container(
      width: MediaQuery.of(context).size.width,
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width,
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
          ),
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: filters.map(
              (filter) {
                final isActive = filter == this.activeFilter;
                return InkWell(
                  hoverColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onHover: (focus) => onFilterFocus(focus, filter),
                  onFocusChange: (focus) => onFilterFocus(focus, filter),
                  onTap: () {
                    setState(() {
                      this.activeTable = this.activeFilter = filter;
                    });
                  },
                  child: CustomAnimation(
                    startPosition: 0.0,
                    control: toggles[filters.indexOf(filter)] ? CustomAnimationControl.PLAY : CustomAnimationControl.PLAY_REVERSE,
                    duration: Duration(milliseconds: 280),
                    tween: ColorTween( begin: Colors.transparent, end: Colors.black.withOpacity(0.08)),
                    builder: (ctx, child, animation) => Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: isActive ? Colors.white : animation,
                        boxShadow: [
                          BoxShadow(
                            color: isActive ? Colors.black.withOpacity(0.25) : Colors.transparent,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(filter.toUpperCase(),
                        style: TextStyle(
                          color: isActive ? ColorUtils.primaryColor : Colors.white,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                );
              },
            ).toList(),
          ),
        ),
      ),
    );
  }

  /// The rest of the content: sidebar with letters and the main list view of content
  Widget contentView()
  {
    return Row(
      children: <Widget>[
        Container(
          width: 60,
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: letters.length,
            itemBuilder: lettersView,
          ),
        ),
        Container(          
          width: MediaQuery.of(context).size.width - 70,
          child: Stack(
            children: <Widget>[
              listView(),
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
          ),
        ),
      ],
    );

  }
  
  Widget lettersView(BuildContext context, int index) {
    return Container(
      height: 60,
      child: GestureDetector(
        onTap: () {
          setSearchingLetter(letters[index]);
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),      
          elevation: 5,
          child: Hero(
            tag: letters[index],
            child: Container(
              padding: const EdgeInsets.all(2),
              child: Center(
                child: Text(
                  letters[index],
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget listView()
  {
    return Container(
      width: MediaQuery.of(context).size.width - 70,
      child: ListView.builder(
        controller: myScrollController,
        padding: EdgeInsets.zero,
        itemCount: activeTable == filtersTable[0] ? words.length : items.length,
        itemBuilder: (BuildContext context, int index) {
          return activeTable == filtersTable[0] ? 
            WordItem('WordIndex_' + words[index].id.toString(), words[index], context) :
            AnyItem('ItemIndex_' + items[index].id.toString(), items[index], context);
        },
      ),
    );  
  }

  Widget menuPopup() => PopupMenuButton<int>(
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 1,
          child: Consumer<AppSettings>(builder: (context, AppSettings settings, _) {
            return ListTile(
              onTap: () {},
              title: Text(LangStrings.darkMode),
              trailing: Switch(
                onChanged: (bool value) => settings.setDarkMode(value),
                value: settings.isDarkMode,
              ),
            );
          }),
        ),
        PopupMenuItem(
          value: 1,
          child: Text(LangStrings.donateTabPage),
        ),
        PopupMenuItem(
          value: 2,
          child: Text(LangStrings.helpTabPage),
        ),
        PopupMenuItem(
          value: 3,
          child: Text(LangStrings.howToUse),
        ),
        /*PopupMenuItem(
          value: 4,
          child: Text(LangStrings.aboutApp),
        ),*/
      ],
      onCanceled: () { },
      onSelected: (value) {
        selectedMenu(value, context);
      },
      icon: Icon(
        Theme.of(context).platform == TargetPlatform.iOS ? Icons.more_horiz : Icons.more_vert, color: Colors.white
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
