import 'package:rareview_app/src/shared/helper_functions/helper_functions.dart';
import 'package:rareview_app/src/shared/models/user.dart';
import 'package:riverpod/riverpod.dart';

final peopleProvider = StateNotifierProvider<PeopleController, List<User>>((ref) {
  return PeopleController([
    User(
      id: HelperFunctions.generateUniqueId(),
      name: 'Chike',
      email: 'chike@gmail.com',
    ),
  ]);
});

class PeopleController extends StateNotifier<List<User>> {
  PeopleController(List<User> state) : super(state);

  void add(User person) {
    state = [
      ...state,
      person,
    ];
  }

  void edit({
    required String id,
    required String name,
    required String email,
  }) {
    final List<User> people = [];
    for (final person in state) {
      if (person.id == id) {
        people.add(User(id: person.id, name: name, email: email));
      } else {
        person;
      }
    }
    state = people;
  }

  void delete(User person) {
    state = state.where((element) => element.id != person.id).toList();
  }
}
