/// Page class for tab items
class AsPage {
  
  AsPage
  (
    {
      this.title, // for the tab name being displayed
      this.content, // for the db table being loaded a particular tab
      this.category // for the icon if am going to show any icons on the tabs
    }
  );

  final String title;
  final String content;
  final String category;
}
