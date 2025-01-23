part of '../home_screen.dart';

class FilterContainer extends StatefulWidget {
  final HomeScreenState parent;
  const FilterContainer({super.key, required this.parent});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class FilterContainerState extends State<FilterContainer> {
  late HomeScreenState parent;

  @override
  Widget build(BuildContext context) {
    parent = widget.parent;

    return SizedBox(
      height: 50,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: AppConstants.filters.length,
        itemBuilder: (context, index) {
          final bool isSelected =
              false; //parent.selectedPage == AppConstants.homeLists[index];
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
                //vm.setPage = AppConstants.homeLists[index];
              }),
              child: Text(
                AppConstants.filters[index].toUpperCase(),
                style: TextStyles.buttonTextStyle.bold
                    .textColor(isSelected ? ThemeColors.primary : Colors.white),
              ),
            ),
          );
        },
      ),
    );
  }
}

class FilterLetters extends StatelessWidget {
  final HomeScreenState parent;
  const FilterLetters({super.key, required this.parent});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: AppConstants.letters.length,
        itemBuilder: (context, index) {
          final letter = AppConstants.letters[index];
          return Padding(
            padding: const EdgeInsets.all(5),
            child: FloatingActionButton(
              heroTag: 'herufi_$letter',
              onPressed: () {},
              child: Text(
                AppConstants.letters[index],
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          );
        },
      ),
    );
  }
}
