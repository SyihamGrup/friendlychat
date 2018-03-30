import 'dart:async';
import 'package:friendlychat/entity/user_entity.dart';

abstract class UserRepository {
  Future<UserEntity> login();
}