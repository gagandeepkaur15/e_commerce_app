class UserModel {
  String userName;
  String userEmail;
  String userImage;
  String userUid;

  UserModel({
    required this.userEmail,
    required this.userImage,
    this.userName='https://png.pngtree.com/png-vector/20191110/ourmid/pngtree-avatar-icon-profile-icon-member-login-vector-isolated-png-image_1978396.jpg',
    required this.userUid,
  });
}
