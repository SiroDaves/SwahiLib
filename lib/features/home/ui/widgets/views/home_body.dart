part of '../../home_screen.dart';

class HomeBody extends StatelessWidget {
  final HomeScreenState parent;
  const HomeBody({super.key, required this.parent});

  @override
  Widget build(BuildContext context) {
    var filterLetters = SizedBox(
      width: 80,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: AppConstants.letters.length,
        itemBuilder: (context, index) => LetterItem(
          index: index,
          onTap: () {
            parent.onLetterTapped(AppConstants.letters[index]);
          },
        ),
      ),
    );

    return SafeArea(
      child: Row(
        children: <Widget>[
          filterLetters,
          IndexedStack(
            index: parent.setPage,
            children: <Widget>[
              WordsList(parent: parent),
              IdiomsList(parent: parent),
              SayingsList(parent: parent),
              ProverbsList(parent: parent),
            ],
          )
        ],
      ),
    );
  }
}

class LetterItem extends StatelessWidget {
  final int? index;
  final VoidCallback? onTap;

  const LetterItem({super.key, required this.index, this.onTap});

  @override
  Widget build(BuildContext context) {
    final letter = AppConstants.letters[index!];
    return Padding(
      padding: const EdgeInsets.all(5),
      child: FloatingActionButton(
        heroTag: 'herufi_$letter',
        onPressed: onTap,
        child: Text(
          AppConstants.letters[index!],
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: ThemeColors.bgColorPrimary3(context),
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
