// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(howMany) =>
      "${Intl.plural(howMany, one: 'Notification', other: 'Notifications')}";

  static String m1(date, time) => "Date: ${date} Time: ${time}";

  static String m2(name) => "Welcome ${name}";

  static String m3(firstName, lastName) =>
      "My name is ${lastName}, ${firstName} ${lastName}";

  static String m4(howMany) =>
      "${Intl.plural(howMany, one: 'You have 1 message', other: 'You have ${howMany} messages')}";

  static String m5(total) => " ${total}";

  static String m6(percent) => "${percent} %";

  static String m7(total) => "Remain ${total} ";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "accouninvited": MessageLookupByLibrary.simpleMessage("Guest Account"),
        "acepttermsandconditions": MessageLookupByLibrary.simpleMessage(
            "I have read and agree to the terms and conditions"),
        "alreadyregistered":
            MessageLookupByLibrary.simpleMessage("Already registered?"),
        "amount": MessageLookupByLibrary.simpleMessage("Amount"),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "confirmpassword":
            MessageLookupByLibrary.simpleMessage("Confirm Password"),
        "continu": MessageLookupByLibrary.simpleMessage("Continue"),
        "fieldrequired": MessageLookupByLibrary.simpleMessage("Field required"),
        "forgotpass":
            MessageLookupByLibrary.simpleMessage("Forgot your password?"),
        "id": MessageLookupByLibrary.simpleMessage("ID"),
        "invalidmail": MessageLookupByLibrary.simpleMessage("Invalid email"),
        "invest": MessageLookupByLibrary.simpleMessage("Invest"),
        "lastnames": MessageLookupByLibrary.simpleMessage("lastName"),
        "login": MessageLookupByLibrary.simpleMessage("Log in"),
        "mail": MessageLookupByLibrary.simpleMessage("Email"),
        "minimumpassword":
            MessageLookupByLibrary.simpleMessage("8 characters minimum"),
        "names": MessageLookupByLibrary.simpleMessage("FirstName"),
        "next": MessageLookupByLibrary.simpleMessage("Next"),
        "notaccount":
            MessageLookupByLibrary.simpleMessage("You do not have an account?"),
        "notificationSamplePlural": m0,
        "or": MessageLookupByLibrary.simpleMessage("Or"),
        "pageHomeListTitle":
            MessageLookupByLibrary.simpleMessage("Some localized strings:"),
        "pageHomeSampleCurrentDateTime": m1,
        "pageHomeSamplePlaceholder": m2,
        "pageHomeSamplePlaceholdersOrdered": m3,
        "pageHomeSamplePlural": m4,
        "pageHomeSampleTotalAmount": m5,
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "passworddontmatch":
            MessageLookupByLibrary.simpleMessage("Passwords don\'t match"),
        "percentvalue": m6,
        "phone": MessageLookupByLibrary.simpleMessage("Contact"),
        "register": MessageLookupByLibrary.simpleMessage("Register"),
        "remain": m7,
        "signup": MessageLookupByLibrary.simpleMessage("Sign up"),
        "singup": MessageLookupByLibrary.simpleMessage("Sign up"),
        "skip": MessageLookupByLibrary.simpleMessage("Skip"),
        "swipeterms": MessageLookupByLibrary.simpleMessage(
            "Swipe to review the terms and conditions"),
        "termconditions":
            MessageLookupByLibrary.simpleMessage("Terms and conditions"),
        "tir": MessageLookupByLibrary.simpleMessage("% Interest"),
        "welcome": MessageLookupByLibrary.simpleMessage("Welcome")
      };
}
