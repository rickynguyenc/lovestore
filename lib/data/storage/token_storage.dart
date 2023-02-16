// import 'package:hive/hive.dart';

// part 'token_storage.g.dart';

// @HiveType(typeId: 1)
// class TokenStorage extends HiveObject {
//   UserStorage({required this.email, required this.token});

//   @HiveField(0)
//   String email;

//   @HiveField(1)
//   int token;

//   @override
//   String toString() {
//     return '$email: $token';
//   }

//   static UserStorage load() {
//     final box = Hive.box(
//       'testBox',
//     );

//     var data = box.get('testBox');
//     if (data == null) {
//       data = UserStorage(email: '', token: 0);
//       box.put('testBox', data);
//     }
//     return data;
//   }
// }
