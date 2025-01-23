part of '../home_screen.dart';

class FilterLetters extends StatelessWidget {
  final List<Idiom> idioms;
  const FilterLetters({super.key, required this.idioms});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

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
              onPressed: () => vm.setLetter(letter),
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
