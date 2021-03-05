class MyAPIUtil {
  static const String MyHost =
      "https://us-central1-chrooker-ba554.cloudfunctions.net/app";
  static const GetAddresses = MyHost + '/api/lookForAPlaceViaAddress';
  static const GetAllUsers = MyHost + '/api/getAllUsers';
  static const DeleteThisUser = MyHost + '/api/deleteUserFromAuth';
  static const CreateUser = MyHost + '/api/createUser';
  static const GetTokenForUser = MyHost + '/api/getCustomToken';
  static const GetUserOffers = MyHost + '/api/gettingUserOffer';
}
