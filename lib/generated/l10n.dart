// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Not valid input`
  String get notValideText {
    return Intl.message(
      'Not valid input',
      name: 'notValideText',
      desc: '',
      args: [],
    );
  }

  /// `Passwords doesn't match`
  String get passwordsError {
    return Intl.message(
      'Passwords doesn\'t match',
      name: 'passwordsError',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get userEmail {
    return Intl.message(
      'Email',
      name: 'userEmail',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get userPassword {
    return Intl.message(
      'Password',
      name: 'userPassword',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get userPhone {
    return Intl.message(
      'Phone',
      name: 'userPhone',
      desc: '',
      args: [],
    );
  }

  /// `Confirm the password`
  String get user2Password {
    return Intl.message(
      'Confirm the password',
      name: 'user2Password',
      desc: '',
      args: [],
    );
  }

  /// `Signup`
  String get signup {
    return Intl.message(
      'Signup',
      name: 'signup',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Please login first`
  String get loginTitle {
    return Intl.message(
      'Please login first',
      name: 'loginTitle',
      desc: '',
      args: [],
    );
  }

  /// `Please fill in the form`
  String get signupTitle {
    return Intl.message(
      'Please fill in the form',
      name: 'signupTitle',
      desc: '',
      args: [],
    );
  }

  /// `Please enter mobile number`
  String get phoneValidEnter {
    return Intl.message(
      'Please enter mobile number',
      name: 'phoneValidEnter',
      desc: '',
      args: [],
    );
  }

  /// `Please enter valid mobile number`
  String get phoneValid {
    return Intl.message(
      'Please enter valid mobile number',
      name: 'phoneValid',
      desc: '',
      args: [],
    );
  }

  /// `Message`
  String get defeultMessegeTitle {
    return Intl.message(
      'Message',
      name: 'defeultMessegeTitle',
      desc: '',
      args: [],
    );
  }

  /// `User been created`
  String get messageUserBeenCreated {
    return Intl.message(
      'User been created',
      name: 'messageUserBeenCreated',
      desc: '',
      args: [],
    );
  }

  /// `Error while creating the user`
  String get messageUserNotBeenCreated {
    return Intl.message(
      'Error while creating the user',
      name: 'messageUserNotBeenCreated',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `city`
  String get city {
    return Intl.message(
      'city',
      name: 'city',
      desc: '',
      args: [],
    );
  }

  /// `street`
  String get street {
    return Intl.message(
      'street',
      name: 'street',
      desc: '',
      args: [],
    );
  }

  /// `Store name`
  String get storeName {
    return Intl.message(
      'Store name',
      name: 'storeName',
      desc: '',
      args: [],
    );
  }

  /// `First name`
  String get firstName {
    return Intl.message(
      'First name',
      name: 'firstName',
      desc: '',
      args: [],
    );
  }

  /// `Last name`
  String get lastName {
    return Intl.message(
      'Last name',
      name: 'lastName',
      desc: '',
      args: [],
    );
  }

  /// `Code postal`
  String get codePostal {
    return Intl.message(
      'Code postal',
      name: 'codePostal',
      desc: '',
      args: [],
    );
  }

  /// `Sorry, The user already in, Please try to login or forget password`
  String get userAlreadyInDB {
    return Intl.message(
      'Sorry, The user already in, Please try to login or forget password',
      name: 'userAlreadyInDB',
      desc: '',
      args: [],
    );
  }

  /// `Sorry, The store name already taken, Please try to change your store name`
  String get storeNameAlreadyInDB {
    return Intl.message(
      'Sorry, The store name already taken, Please try to change your store name',
      name: 'storeNameAlreadyInDB',
      desc: '',
      args: [],
    );
  }

  /// `Choose your store type`
  String get storeType {
    return Intl.message(
      'Choose your store type',
      name: 'storeType',
      desc: '',
      args: [],
    );
  }

  /// `Error while creating the user, Please try again`
  String get errorWhileCreatingAuth {
    return Intl.message(
      'Error while creating the user, Please try again',
      name: 'errorWhileCreatingAuth',
      desc: '',
      args: [],
    );
  }

  /// `Error while creating the store, Please try again`
  String get errorWhileCreatingStore {
    return Intl.message(
      'Error while creating the store, Please try again',
      name: 'errorWhileCreatingStore',
      desc: '',
      args: [],
    );
  }

  /// `Error while updating the store, Please try again`
  String get errorWhileuploadingTheStoresData {
    return Intl.message(
      'Error while updating the store, Please try again',
      name: 'errorWhileuploadingTheStoresData',
      desc: '',
      args: [],
    );
  }

  /// `Store been created, please login when we valid it`
  String get storeBeenCreatedWaitToValid {
    return Intl.message(
      'Store been created, please login when we valid it',
      name: 'storeBeenCreatedWaitToValid',
      desc: '',
      args: [],
    );
  }

  /// `User's email or password is incorrect`
  String get errorWithLogin {
    return Intl.message(
      'User\'s email or password is incorrect',
      name: 'errorWithLogin',
      desc: '',
      args: [],
    );
  }

  /// `Your accepted not yet been accepted`
  String get errorUserNotValid {
    return Intl.message(
      'Your accepted not yet been accepted',
      name: 'errorUserNotValid',
      desc: '',
      args: [],
    );
  }

  /// `Only Numbers`
  String get onlyNumber {
    return Intl.message(
      'Only Numbers',
      name: 'onlyNumber',
      desc: '',
      args: [],
    );
  }

  /// `submint`
  String get defButtonFormTitle {
    return Intl.message(
      'submint',
      name: 'defButtonFormTitle',
      desc: '',
      args: [],
    );
  }

  /// `Sort name`
  String get addingSortTitle {
    return Intl.message(
      'Sort name',
      name: 'addingSortTitle',
      desc: '',
      args: [],
    );
  }

  /// `event sorts`
  String get sorts {
    return Intl.message(
      'event sorts',
      name: 'sorts',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure about removing this sort`
  String get removingSort {
    return Intl.message(
      'Are you sure about removing this sort',
      name: 'removingSort',
      desc: '',
      args: [],
    );
  }

  /// `Choose your color`
  String get colorChoiseTitle {
    return Intl.message(
      'Choose your color',
      name: 'colorChoiseTitle',
      desc: '',
      args: [],
    );
  }

  /// `Add a event color`
  String get colorChoiseAdd {
    return Intl.message(
      'Add a event color',
      name: 'colorChoiseAdd',
      desc: '',
      args: [],
    );
  }

  /// `Vistor name`
  String get addNewVistorName {
    return Intl.message(
      'Vistor name',
      name: 'addNewVistorName',
      desc: '',
      args: [],
    );
  }

  /// `Category title`
  String get categoryName {
    return Intl.message(
      'Category title',
      name: 'categoryName',
      desc: '',
      args: [],
    );
  }

  /// `Categories`
  String get categories {
    return Intl.message(
      'Categories',
      name: 'categories',
      desc: '',
      args: [],
    );
  }

  /// `Done creating the category`
  String get doneCreatingTheCategory {
    return Intl.message(
      'Done creating the category',
      name: 'doneCreatingTheCategory',
      desc: '',
      args: [],
    );
  }

  /// `Adding category`
  String get creatingCategoryTitle {
    return Intl.message(
      'Adding category',
      name: 'creatingCategoryTitle',
      desc: '',
      args: [],
    );
  }

  /// `Add new Category`
  String get addNewCategory {
    return Intl.message(
      'Add new Category',
      name: 'addNewCategory',
      desc: '',
      args: [],
    );
  }

  /// `Update category`
  String get titleUpdateCategory {
    return Intl.message(
      'Update category',
      name: 'titleUpdateCategory',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get editCat {
    return Intl.message(
      'Save',
      name: 'editCat',
      desc: '',
      args: [],
    );
  }

  /// `Forget my password`
  String get forgetPassword {
    return Intl.message(
      'Forget my password',
      name: 'forgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `I dont have an account`
  String get dontHaveAccount {
    return Intl.message(
      'I dont have an account',
      name: 'dontHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `I do have an account`
  String get doHaveAccount {
    return Intl.message(
      'I do have an account',
      name: 'doHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Please check your email/password`
  String get errorInLogin {
    return Intl.message(
      'Please check your email/password',
      name: 'errorInLogin',
      desc: '',
      args: [],
    );
  }

  /// `Please check your email or its already used`
  String get errorInSignup {
    return Intl.message(
      'Please check your email or its already used',
      name: 'errorInSignup',
      desc: '',
      args: [],
    );
  }

  /// `Please check your inbox to continue`
  String get checkYourEmailInbox {
    return Intl.message(
      'Please check your inbox to continue',
      name: 'checkYourEmailInbox',
      desc: '',
      args: [],
    );
  }

  /// `Reset password email been sent`
  String get resetPasswordMessage {
    return Intl.message(
      'Reset password email been sent',
      name: 'resetPasswordMessage',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get loginout {
    return Intl.message(
      'Logout',
      name: 'loginout',
      desc: '',
      args: [],
    );
  }

  /// `My pofile`
  String get profileTitle {
    return Intl.message(
      'My pofile',
      name: 'profileTitle',
      desc: '',
      args: [],
    );
  }

  /// `Save Changes`
  String get saveChanges {
    return Intl.message(
      'Save Changes',
      name: 'saveChanges',
      desc: '',
      args: [],
    );
  }

  /// `About me`
  String get userInformationTitle {
    return Intl.message(
      'About me',
      name: 'userInformationTitle',
      desc: '',
      args: [],
    );
  }

  /// `Cover image`
  String get coverImage {
    return Intl.message(
      'Cover image',
      name: 'coverImage',
      desc: '',
      args: [],
    );
  }

  /// `About me`
  String get aboutMe {
    return Intl.message(
      'About me',
      name: 'aboutMe',
      desc: '',
      args: [],
    );
  }

  /// `Change password`
  String get restPasswordTitle {
    return Intl.message(
      'Change password',
      name: 'restPasswordTitle',
      desc: '',
      args: [],
    );
  }

  /// `Menu`
  String get menu {
    return Intl.message(
      'Menu',
      name: 'menu',
      desc: '',
      args: [],
    );
  }

  /// `Cuisines`
  String get cuisines {
    return Intl.message(
      'Cuisines',
      name: 'cuisines',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Add new element`
  String get addNewElement {
    return Intl.message(
      'Add new element',
      name: 'addNewElement',
      desc: '',
      args: [],
    );
  }

  /// `Title`
  String get title {
    return Intl.message(
      'Title',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get address {
    return Intl.message(
      'Address',
      name: 'address',
      desc: '',
      args: [],
    );
  }

  /// `Possible addresses`
  String get pAddress {
    return Intl.message(
      'Possible addresses',
      name: 'pAddress',
      desc: '',
      args: [],
    );
  }

  /// `Adresses`
  String get addresses {
    return Intl.message(
      'Adresses',
      name: 'addresses',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure about deleting this object`
  String get deletingMessage {
    return Intl.message(
      'Are you sure about deleting this object',
      name: 'deletingMessage',
      desc: '',
      args: [],
    );
  }

  /// `Restaurents`
  String get restaurents {
    return Intl.message(
      'Restaurents',
      name: 'restaurents',
      desc: '',
      args: [],
    );
  }

  /// `Please full this information`
  String get pleaseFullThisInfo {
    return Intl.message(
      'Please full this information',
      name: 'pleaseFullThisInfo',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Free places`
  String get freePlaces {
    return Intl.message(
      'Free places',
      name: 'freePlaces',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get phone {
    return Intl.message(
      'Phone',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `Rate`
  String get rate {
    return Intl.message(
      'Rate',
      name: 'rate',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get description {
    return Intl.message(
      'Description',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `Fax`
  String get fax {
    return Intl.message(
      'Fax',
      name: 'fax',
      desc: '',
      args: [],
    );
  }

  /// `Manager`
  String get userManager {
    return Intl.message(
      'Manager',
      name: 'userManager',
      desc: '',
      args: [],
    );
  }

  /// `Closed`
  String get closed {
    return Intl.message(
      'Closed',
      name: 'closed',
      desc: '',
      args: [],
    );
  }

  /// `Mobile`
  String get mobile {
    return Intl.message(
      'Mobile',
      name: 'mobile',
      desc: '',
      args: [],
    );
  }

  /// `Click to change`
  String get clickToChange {
    return Intl.message(
      'Click to change',
      name: 'clickToChange',
      desc: '',
      args: [],
    );
  }

  /// `Formula`
  String get fromula {
    return Intl.message(
      'Formula',
      name: 'fromula',
      desc: '',
      args: [],
    );
  }

  /// `Food`
  String get food {
    return Intl.message(
      'Food',
      name: 'food',
      desc: '',
      args: [],
    );
  }

  /// `Extra groups`
  String get extraGroups {
    return Intl.message(
      'Extra groups',
      name: 'extraGroups',
      desc: '',
      args: [],
    );
  }

  /// `Extra`
  String get extra {
    return Intl.message(
      'Extra',
      name: 'extra',
      desc: '',
      args: [],
    );
  }

  /// `Price`
  String get price {
    return Intl.message(
      'Price',
      name: 'price',
      desc: '',
      args: [],
    );
  }

  /// `Dicount price`
  String get dicountPrice {
    return Intl.message(
      'Dicount price',
      name: 'dicountPrice',
      desc: '',
      args: [],
    );
  }

  /// `Manage users`
  String get manageUsers {
    return Intl.message(
      'Manage users',
      name: 'manageUsers',
      desc: '',
      args: [],
    );
  }

  /// `Number of resturent`
  String get numberOfResturent {
    return Intl.message(
      'Number of resturent',
      name: 'numberOfResturent',
      desc: '',
      args: [],
    );
  }

  /// `Number of formula`
  String get numberOfFormula {
    return Intl.message(
      'Number of formula',
      name: 'numberOfFormula',
      desc: '',
      args: [],
    );
  }

  /// `Number of food`
  String get numberOfFood {
    return Intl.message(
      'Number of food',
      name: 'numberOfFood',
      desc: '',
      args: [],
    );
  }

  /// `Active`
  String get active {
    return Intl.message(
      'Active',
      name: 'active',
      desc: '',
      args: [],
    );
  }

  /// `Is admin`
  String get isAdmin {
    return Intl.message(
      'Is admin',
      name: 'isAdmin',
      desc: '',
      args: [],
    );
  }

  /// `Can edit food`
  String get canEditFood {
    return Intl.message(
      'Can edit food',
      name: 'canEditFood',
      desc: '',
      args: [],
    );
  }

  /// `Can edit resturent`
  String get canEditResturent {
    return Intl.message(
      'Can edit resturent',
      name: 'canEditResturent',
      desc: '',
      args: [],
    );
  }

  /// `Can edit formula`
  String get canEditFormula {
    return Intl.message(
      'Can edit formula',
      name: 'canEditFormula',
      desc: '',
      args: [],
    );
  }

  /// `Can edit resturents`
  String get canEditResturents {
    return Intl.message(
      'Can edit resturents',
      name: 'canEditResturents',
      desc: '',
      args: [],
    );
  }

  /// `Category`
  String get category {
    return Intl.message(
      'Category',
      name: 'category',
      desc: '',
      args: [],
    );
  }

  /// `Is avilable`
  String get isAvilable {
    return Intl.message(
      'Is avilable',
      name: 'isAvilable',
      desc: '',
      args: [],
    );
  }

  /// `When close`
  String get whenToClose {
    return Intl.message(
      'When close',
      name: 'whenToClose',
      desc: '',
      args: [],
    );
  }

  /// `When open`
  String get whenOpen {
    return Intl.message(
      'When open',
      name: 'whenOpen',
      desc: '',
      args: [],
    );
  }

  /// `Order declared`
  String get orderDate {
    return Intl.message(
      'Order declared',
      name: 'orderDate',
      desc: '',
      args: [],
    );
  }

  /// `Selected food`
  String get orderFood {
    return Intl.message(
      'Selected food',
      name: 'orderFood',
      desc: '',
      args: [],
    );
  }

  /// `Selected extra`
  String get selectedExtra {
    return Intl.message(
      'Selected extra',
      name: 'selectedExtra',
      desc: '',
      args: [],
    );
  }

  /// `Status`
  String get status {
    return Intl.message(
      'Status',
      name: 'status',
      desc: '',
      args: [],
    );
  }

  /// `Total price`
  String get totalPrice {
    return Intl.message(
      'Total price',
      name: 'totalPrice',
      desc: '',
      args: [],
    );
  }

  /// `Archive`
  String get archive {
    return Intl.message(
      'Archive',
      name: 'archive',
      desc: '',
      args: [],
    );
  }

  /// `Number of people`
  String get numberOfPeople {
    return Intl.message(
      'Number of people',
      name: 'numberOfPeople',
      desc: '',
      args: [],
    );
  }

  /// `Orders`
  String get orders {
    return Intl.message(
      'Orders',
      name: 'orders',
      desc: '',
      args: [],
    );
  }

  /// `You are about to archive this order`
  String get archiveOrder {
    return Intl.message(
      'You are about to archive this order',
      name: 'archiveOrder',
      desc: '',
      args: [],
    );
  }

  /// `Order ID`
  String get orderID {
    return Intl.message(
      'Order ID',
      name: 'orderID',
      desc: '',
      args: [],
    );
  }

  /// `Payment ID`
  String get paymentID {
    return Intl.message(
      'Payment ID',
      name: 'paymentID',
      desc: '',
      args: [],
    );
  }

  /// `When the order will be ready`
  String get whenTheOrderNeedToBeReady {
    return Intl.message(
      'When the order will be ready',
      name: 'whenTheOrderNeedToBeReady',
      desc: '',
      args: [],
    );
  }

  /// `Quantity`
  String get quantity {
    return Intl.message(
      'Quantity',
      name: 'quantity',
      desc: '',
      args: [],
    );
  }

  /// `When the order will be picked up`
  String get whenTheOrderWillBePickedUp {
    return Intl.message(
      'When the order will be picked up',
      name: 'whenTheOrderWillBePickedUp',
      desc: '',
      args: [],
    );
  }

  /// `In place`
  String get inPlace {
    return Intl.message(
      'In place',
      name: 'inPlace',
      desc: '',
      args: [],
    );
  }

  /// `Pickup`
  String get pickup {
    return Intl.message(
      'Pickup',
      name: 'pickup',
      desc: '',
      args: [],
    );
  }

  /// `Order received`
  String get orderReceived {
    return Intl.message(
      'Order received',
      name: 'orderReceived',
      desc: '',
      args: [],
    );
  }

  /// `Order accepted`
  String get orderAccepted {
    return Intl.message(
      'Order accepted',
      name: 'orderAccepted',
      desc: '',
      args: [],
    );
  }

  /// `Order rejected`
  String get orderRejected {
    return Intl.message(
      'Order rejected',
      name: 'orderRejected',
      desc: '',
      args: [],
    );
  }

  /// `Order paid`
  String get orderPaid {
    return Intl.message(
      'Order paid',
      name: 'orderPaid',
      desc: '',
      args: [],
    );
  }

  /// `Order preparing`
  String get orderPreparing {
    return Intl.message(
      'Order preparing',
      name: 'orderPreparing',
      desc: '',
      args: [],
    );
  }

  /// `Order delayed`
  String get orderDelayed {
    return Intl.message(
      'Order delayed',
      name: 'orderDelayed',
      desc: '',
      args: [],
    );
  }

  /// `Order Ready`
  String get orderReady {
    return Intl.message(
      'Order Ready',
      name: 'orderReady',
      desc: '',
      args: [],
    );
  }

  /// `Order delivered`
  String get orderDelivered {
    return Intl.message(
      'Order delivered',
      name: 'orderDelivered',
      desc: '',
      args: [],
    );
  }

  /// `Order canceled`
  String get orderCanceled {
    return Intl.message(
      'Order canceled',
      name: 'orderCanceled',
      desc: '',
      args: [],
    );
  }

  /// `Morning shift`
  String get morningShift {
    return Intl.message(
      'Morning shift',
      name: 'morningShift',
      desc: '',
      args: [],
    );
  }

  /// `Night shift`
  String get nightShift {
    return Intl.message(
      'Night shift',
      name: 'nightShift',
      desc: '',
      args: [],
    );
  }

  /// `Version`
  String get version {
    return Intl.message(
      'Version',
      name: 'version',
      desc: '',
      args: [],
    );
  }

  /// `Reserved places`
  String get reservedPlaces {
    return Intl.message(
      'Reserved places',
      name: 'reservedPlaces',
      desc: '',
      args: [],
    );
  }

  /// `id`
  String get id {
    return Intl.message(
      'id',
      name: 'id',
      desc: '',
      args: [],
    );
  }

  /// `Limit title`
  String get myLimitTitle {
    return Intl.message(
      'Limit title',
      name: 'myLimitTitle',
      desc: '',
      args: [],
    );
  }

  /// `Can add users`
  String get canAddUsers {
    return Intl.message(
      'Can add users',
      name: 'canAddUsers',
      desc: '',
      args: [],
    );
  }

  /// `Can add food`
  String get canAddFood {
    return Intl.message(
      'Can add food',
      name: 'canAddFood',
      desc: '',
      args: [],
    );
  }

  /// `Can have order`
  String get canHaveOrder {
    return Intl.message(
      'Can have order',
      name: 'canHaveOrder',
      desc: '',
      args: [],
    );
  }

  /// `Can add formula`
  String get canAddFormula {
    return Intl.message(
      'Can add formula',
      name: 'canAddFormula',
      desc: '',
      args: [],
    );
  }

  /// `Can have reservation`
  String get canHaveReservation {
    return Intl.message(
      'Can have reservation',
      name: 'canHaveReservation',
      desc: '',
      args: [],
    );
  }

  /// `Can talk to users`
  String get canTalkToUser {
    return Intl.message(
      'Can talk to users',
      name: 'canTalkToUser',
      desc: '',
      args: [],
    );
  }

  /// `Can have statistic`
  String get canHaveStatistic {
    return Intl.message(
      'Can have statistic',
      name: 'canHaveStatistic',
      desc: '',
      args: [],
    );
  }

  /// `Can have extra`
  String get canHaveExtra {
    return Intl.message(
      'Can have extra',
      name: 'canHaveExtra',
      desc: '',
      args: [],
    );
  }

  /// `Can add restaurants`
  String get canAddRestaurants {
    return Intl.message(
      'Can add restaurants',
      name: 'canAddRestaurants',
      desc: '',
      args: [],
    );
  }

  /// `Can have in place`
  String get canHaveInPlace {
    return Intl.message(
      'Can have in place',
      name: 'canHaveInPlace',
      desc: '',
      args: [],
    );
  }

  /// `Can reviews`
  String get canReviews {
    return Intl.message(
      'Can reviews',
      name: 'canReviews',
      desc: '',
      args: [],
    );
  }

  /// `Can have payment`
  String get canHavePayment {
    return Intl.message(
      'Can have payment',
      name: 'canHavePayment',
      desc: '',
      args: [],
    );
  }

  /// `Number of users`
  String get numberOfUsers {
    return Intl.message(
      'Number of users',
      name: 'numberOfUsers',
      desc: '',
      args: [],
    );
  }

  /// `Number of restaurants`
  String get numberOfRestaurants {
    return Intl.message(
      'Number of restaurants',
      name: 'numberOfRestaurants',
      desc: '',
      args: [],
    );
  }

  /// `Number of extra`
  String get numberOfExtra {
    return Intl.message(
      'Number of extra',
      name: 'numberOfExtra',
      desc: '',
      args: [],
    );
  }

  /// `Manage offers`
  String get manageOffers {
    return Intl.message(
      'Manage offers',
      name: 'manageOffers',
      desc: '',
      args: [],
    );
  }

  /// `Creator ID`
  String get creatorID {
    return Intl.message(
      'Creator ID',
      name: 'creatorID',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Reset`
  String get reset {
    return Intl.message(
      'Reset',
      name: 'reset',
      desc: '',
      args: [],
    );
  }

  /// `When offer expire`
  String get whenOfferExpire {
    return Intl.message(
      'When offer expire',
      name: 'whenOfferExpire',
      desc: '',
      args: [],
    );
  }

  /// `When offer discount expire`
  String get whenOfferDiscountExpire {
    return Intl.message(
      'When offer discount expire',
      name: 'whenOfferDiscountExpire',
      desc: '',
      args: [],
    );
  }

  /// `When been created`
  String get whenBeenCreated {
    return Intl.message(
      'When been created',
      name: 'whenBeenCreated',
      desc: '',
      args: [],
    );
  }

  /// `Limits`
  String get limits {
    return Intl.message(
      'Limits',
      name: 'limits',
      desc: '',
      args: [],
    );
  }

  /// `Create limits`
  String get createLimits {
    return Intl.message(
      'Create limits',
      name: 'createLimits',
      desc: '',
      args: [],
    );
  }

  /// `Unlimited`
  String get Unlimited {
    return Intl.message(
      'Unlimited',
      name: 'Unlimited',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to remove the limit with it`
  String get deletingLimitMessage {
    return Intl.message(
      'Do you want to remove the limit with it',
      name: 'deletingLimitMessage',
      desc: '',
      args: [],
    );
  }

  /// `disabled`
  String get disActive {
    return Intl.message(
      'disabled',
      name: 'disActive',
      desc: '',
      args: [],
    );
  }

  /// `Can't add due to your Plan limits`
  String get cantAddDueToYourOfferLimits {
    return Intl.message(
      'Can\'t add due to your Plan limits',
      name: 'cantAddDueToYourOfferLimits',
      desc: '',
      args: [],
    );
  }

  /// `Please pick an offer`
  String get pleasePickAnOffer {
    return Intl.message(
      'Please pick an offer',
      name: 'pleasePickAnOffer',
      desc: '',
      args: [],
    );
  }

  /// `Your Plan been expired`
  String get youOfferBeenExpired {
    return Intl.message(
      'Your Plan been expired',
      name: 'youOfferBeenExpired',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `No plan been effected to this user`
  String get noPlanBeenEffected {
    return Intl.message(
      'No plan been effected to this user',
      name: 'noPlanBeenEffected',
      desc: '',
      args: [],
    );
  }

  /// `Apply for this plan`
  String get applyForThisPlan {
    return Intl.message(
      'Apply for this plan',
      name: 'applyForThisPlan',
      desc: '',
      args: [],
    );
  }

  /// `Available until`
  String get availableUntil {
    return Intl.message(
      'Available until',
      name: 'availableUntil',
      desc: '',
      args: [],
    );
  }

  /// `Select limits`
  String get selectLimits {
    return Intl.message(
      'Select limits',
      name: 'selectLimits',
      desc: '',
      args: [],
    );
  }

  /// `Untitled`
  String get unTitled {
    return Intl.message(
      'Untitled',
      name: 'unTitled',
      desc: '',
      args: [],
    );
  }

  /// `My plan`
  String get myPlan {
    return Intl.message(
      'My plan',
      name: 'myPlan',
      desc: '',
      args: [],
    );
  }

  /// `You can't do this action in this plan, Please change your plan`
  String get youCantDoThisActionInThisPlan {
    return Intl.message(
      'You can\'t do this action in this plan, Please change your plan',
      name: 'youCantDoThisActionInThisPlan',
      desc: '',
      args: [],
    );
  }

  /// `Change my plan`
  String get changeMyPlan {
    return Intl.message(
      'Change my plan',
      name: 'changeMyPlan',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get Ok {
    return Intl.message(
      'Ok',
      name: 'Ok',
      desc: '',
      args: [],
    );
  }

  /// `Please add food, to be able to make any formula`
  String get pleaseAddFood {
    return Intl.message(
      'Please add food, to be able to make any formula',
      name: 'pleaseAddFood',
      desc: '',
      args: [],
    );
  }

  /// `Address already exist`
  String get addressAlreadyExist {
    return Intl.message(
      'Address already exist',
      name: 'addressAlreadyExist',
      desc: '',
      args: [],
    );
  }

  /// `Image is missing, can't add item`
  String get imageMissingError {
    return Intl.message(
      'Image is missing, can\'t add item',
      name: 'imageMissingError',
      desc: '',
      args: [],
    );
  }

  /// `Please check the missing fields`
  String get pleaseCheckTheMissingFields {
    return Intl.message(
      'Please check the missing fields',
      name: 'pleaseCheckTheMissingFields',
      desc: '',
      args: [],
    );
  }

  /// `Can't do action`
  String get cantDoAction {
    return Intl.message(
      'Can\'t do action',
      name: 'cantDoAction',
      desc: '',
      args: [],
    );
  }

  /// `Max number of Customers`
  String get maxNumberOfCustomers {
    return Intl.message(
      'Max number of Customers',
      name: 'maxNumberOfCustomers',
      desc: '',
      args: [],
    );
  }

  /// `This price for selling this coupon,If zero it will not be on sell!`
  String get tipThisPriceIsForSellingThisCoupon {
    return Intl.message(
      'This price for selling this coupon,If zero it will not be on sell!',
      name: 'tipThisPriceIsForSellingThisCoupon',
      desc: '',
      args: [],
    );
  }

  /// `Tip this the price that the user will use to get reductions on the food`
  String get tipThisThePriceThatTheUserWillUseToGetReductionsOnTheFood {
    return Intl.message(
      'Tip this the price that the user will use to get reductions on the food',
      name: 'tipThisThePriceThatTheUserWillUseToGetReductionsOnTheFood',
      desc: '',
      args: [],
    );
  }

  /// `This is the max number of customers that can get this coupons`
  String get thisIsTheMaxNumberOfCustomersThatCanGetThisCoupon {
    return Intl.message(
      'This is the max number of customers that can get this coupons',
      name: 'thisIsTheMaxNumberOfCustomersThatCanGetThisCoupon',
      desc: '',
      args: [],
    );
  }

  /// `When will be expire`
  String get whenWillBeExpire {
    return Intl.message(
      'When will be expire',
      name: 'whenWillBeExpire',
      desc: '',
      args: [],
    );
  }

  /// `Coupons`
  String get coupons {
    return Intl.message(
      'Coupons',
      name: 'coupons',
      desc: '',
      args: [],
    );
  }

  /// `Coupons code`
  String get couponsCode {
    return Intl.message(
      'Coupons code',
      name: 'couponsCode',
      desc: '',
      args: [],
    );
  }

  /// `Generate code`
  String get generateCode {
    return Intl.message(
      'Generate code',
      name: 'generateCode',
      desc: '',
      args: [],
    );
  }

  /// `Reset password`
  String get resetPassword {
    return Intl.message(
      'Reset password',
      name: 'resetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get submit {
    return Intl.message(
      'Submit',
      name: 'submit',
      desc: '',
      args: [],
    );
  }

  /// `Action been done successfully`
  String get actionBeenDone {
    return Intl.message(
      'Action been done successfully',
      name: 'actionBeenDone',
      desc: '',
      args: [],
    );
  }

  /// `Item been added successfully`
  String get itemAdded {
    return Intl.message(
      'Item been added successfully',
      name: 'itemAdded',
      desc: '',
      args: [],
    );
  }

  /// `Uploading image`
  String get uploadingImage {
    return Intl.message(
      'Uploading image',
      name: 'uploadingImage',
      desc: '',
      args: [],
    );
  }

  /// `Done uploading image`
  String get doneUploadingImage {
    return Intl.message(
      'Done uploading image',
      name: 'doneUploadingImage',
      desc: '',
      args: [],
    );
  }

  /// `Done uploading image`
  String get errorWhileUploadingImage {
    return Intl.message(
      'Done uploading image',
      name: 'errorWhileUploadingImage',
      desc: '',
      args: [],
    );
  }

  /// `Stickers`
  String get stickers {
    return Intl.message(
      'Stickers',
      name: 'stickers',
      desc: '',
      args: [],
    );
  }

  /// `Manage stickers`
  String get manageStickers {
    return Intl.message(
      'Manage stickers',
      name: 'manageStickers',
      desc: '',
      args: [],
    );
  }

  /// `Keep the same icon`
  String get keepTheSameIcon {
    return Intl.message(
      'Keep the same icon',
      name: 'keepTheSameIcon',
      desc: '',
      args: [],
    );
  }

  /// `Keep the same color`
  String get keepTheSameColor {
    return Intl.message(
      'Keep the same color',
      name: 'keepTheSameColor',
      desc: '',
      args: [],
    );
  }

  /// `Sticker color`
  String get stickerColor {
    return Intl.message(
      'Sticker color',
      name: 'stickerColor',
      desc: '',
      args: [],
    );
  }

  /// `Sticker icon`
  String get stickerIcon {
    return Intl.message(
      'Sticker icon',
      name: 'stickerIcon',
      desc: '',
      args: [],
    );
  }

  /// `Chose sticker`
  String get choseStickers {
    return Intl.message(
      'Chose sticker',
      name: 'choseStickers',
      desc: '',
      args: [],
    );
  }

  /// `Sticker`
  String get Sticker {
    return Intl.message(
      'Sticker',
      name: 'Sticker',
      desc: '',
      args: [],
    );
  }

  /// `Tap to select`
  String get tapToSelect {
    return Intl.message(
      'Tap to select',
      name: 'tapToSelect',
      desc: '',
      args: [],
    );
  }

  /// `Waiting`
  String get waiting {
    return Intl.message(
      'Waiting',
      name: 'waiting',
      desc: '',
      args: [],
    );
  }

  /// `Order`
  String get order {
    return Intl.message(
      'Order',
      name: 'order',
      desc: '',
      args: [],
    );
  }

  /// `No orders to show`
  String get noOrdersToShow {
    return Intl.message(
      'No orders to show',
      name: 'noOrdersToShow',
      desc: '',
      args: [],
    );
  }

  /// `Public`
  String get public {
    return Intl.message(
      'Public',
      name: 'public',
      desc: '',
      args: [],
    );
  }

  /// `No element to show`
  String get noElementToShow {
    return Intl.message(
      'No element to show',
      name: 'noElementToShow',
      desc: '',
      args: [],
    );
  }

  /// `Ingredients`
  String get Ingredients {
    return Intl.message(
      'Ingredients',
      name: 'Ingredients',
      desc: '',
      args: [],
    );
  }

  /// `All free ingredients`
  String get allFreeIngredients {
    return Intl.message(
      'All free ingredients',
      name: 'allFreeIngredients',
      desc: '',
      args: [],
    );
  }

  /// `Extras`
  String get extras {
    return Intl.message(
      'Extras',
      name: 'extras',
      desc: '',
      args: [],
    );
  }

  /// `Filter`
  String get filter {
    return Intl.message(
      'Filter',
      name: 'filter',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get all {
    return Intl.message(
      'All',
      name: 'all',
      desc: '',
      args: [],
    );
  }

  /// `Any day`
  String get anyDay {
    return Intl.message(
      'Any day',
      name: 'anyDay',
      desc: '',
      args: [],
    );
  }

  /// `Get uploads`
  String get getUploads {
    return Intl.message(
      'Get uploads',
      name: 'getUploads',
      desc: '',
      args: [],
    );
  }

  /// `Send notifications`
  String get sendNotifications {
    return Intl.message(
      'Send notifications',
      name: 'sendNotifications',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}