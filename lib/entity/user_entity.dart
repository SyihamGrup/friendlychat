

class UserEntity {

  static final _defaultName = 'Guest';

  static final guest = new UserEntity(
      displayName: _defaultName
  );


  final String id;
  final String displayName;
  final String photoUrl;


  UserEntity({
    this.id,
    this.displayName,
    this.photoUrl
  });


  bool get isLogged {
    return id != null && displayName != _defaultName;
  }


//  @override
//  int get hashCode => id.hashCode ^ displayName.hashCode ^ photoUrl.hashCode;
//
//  @override
//  bool operator ==(Object other) =>
//      identical(this, other)
//          || other is UserEntity
//          && runtimeType == other.runtimeType
//          && id == other.id
//          && displayName == other.displayName
//          && photoUrl == other.photoUrl;

}
