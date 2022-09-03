import 'package:rareview_app/src/shared/helper_functions/helper_functions.dart';
import 'package:rareview_app/src/shared/models/user.dart';
import 'package:riverpod/riverpod.dart';

final peopleProvider = StateNotifierProvider<PeopleController, List<UserProfile>>((ref) {
  return PeopleController([
    UserProfile(
      id: HelperFunctions.generateUniqueId(),
      name: 'Chike',
      email: 'chike@gmail.com',
    ),
  ]);
});

class PeopleController extends StateNotifier<List<UserProfile>> {
  PeopleController(List<UserProfile> state) : super(state);

  void add(UserProfile person) {
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
    final List<UserProfile> people = [];
    for (final person in state) {
      if (person.id == id) {
        people.add(UserProfile(id: person.id, name: name, email: email));
      } else {
        person;
      }
    }
    state = people;
  }

  void delete(UserProfile person) {
    state = state.where((element) => element.id != person.id).toList();
  }
}
