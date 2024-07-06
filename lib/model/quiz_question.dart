class QuizQuestion {
  const QuizQuestion(this.text, this.answers);
  final String text;
  final List<String> answers;
  List<String> shuffleOptions() {
    // a copy is created and stored in shuffled
    final shuffled = List.of(answers);
    // elements in shuffled are now shuffled
    //(inplace that is why no conflict with final)
    shuffled.shuffle();
    // we return new shuffled list
    return shuffled;
  }
}
