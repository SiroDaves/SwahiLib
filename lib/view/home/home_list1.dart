part of 'home_screen.dart';

class HomeList1 extends StatelessWidget {
  final HomeVm vm;

  const HomeList1(this.vm, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width - 85,
      padding: const EdgeInsets.only(top: 10),
      child: ListView.builder(
        padding: const EdgeInsets.only(right: 15),
        itemCount: vm.words!.length,
        itemBuilder: (BuildContext context, int index) {
          final Word word = vm.words![index];
          return WordItem(
            word: word,
            onTap: () => vm.openWord(word),
          );
        },
      ),
    );
  }
}
