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

  static String m0(total) => "${total}";

  static String m1(howMany) =>
      "${Intl.plural(howMany, one: 'Month', other: 'Months')}";

  static String m2(howMany) =>
      "${Intl.plural(howMany, one: 'Notification', other: 'Notifications')}";

  static String m3(date, time) => "Date: ${date} Time: ${time}";

  static String m4(name) => "Welcome ${name}";

  static String m5(firstName, lastName) =>
      "My name is ${lastName}, ${firstName} ${lastName}";

  static String m6(howMany) =>
      "${Intl.plural(howMany, one: 'You have 1 message', other: 'You have ${howMany} messages')}";

  static String m7(total) => " ${total}";

  static String m8(percent) => "${percent} %";

  static String m9(total) => "Remain ${total} ";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "accouninvited": MessageLookupByLibrary.simpleMessage("Guest Account"),
        "acepttermsandconditions": MessageLookupByLibrary.simpleMessage(
            "I have read and agree to the terms and conditions"),
        "alreadyregistered":
            MessageLookupByLibrary.simpleMessage("Already registered?"),
        "amount": MessageLookupByLibrary.simpleMessage("Amount"),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "collected": MessageLookupByLibrary.simpleMessage("Collected"),
        "confirmInvestment":
            MessageLookupByLibrary.simpleMessage("Confirm investment"),
        "confirmpassword":
            MessageLookupByLibrary.simpleMessage("Confirm Password"),
        "continu": MessageLookupByLibrary.simpleMessage("Continue"),
        "currency": m0,
        "fieldrequired": MessageLookupByLibrary.simpleMessage("Field required"),
        "forgotpass":
            MessageLookupByLibrary.simpleMessage("Forgot your password?"),
        "id": MessageLookupByLibrary.simpleMessage("ID"),
        "invalidmail": MessageLookupByLibrary.simpleMessage("Invalid email"),
        "invalidvalue": MessageLookupByLibrary.simpleMessage("Invalid value"),
        "invest": MessageLookupByLibrary.simpleMessage("Invest"),
        "investment": MessageLookupByLibrary.simpleMessage("Investment"),
        "lastnames": MessageLookupByLibrary.simpleMessage("lastName"),
        "login": MessageLookupByLibrary.simpleMessage("Log in"),
        "mail": MessageLookupByLibrary.simpleMessage("Email"),
        "minimumpassword":
            MessageLookupByLibrary.simpleMessage("8 characters minimum"),
        "monthSamplePlural": m1,
        "names": MessageLookupByLibrary.simpleMessage("FirstName"),
        "next": MessageLookupByLibrary.simpleMessage("Next"),
        "notaccount":
            MessageLookupByLibrary.simpleMessage("You do not have an account?"),
        "notificationSamplePlural": m2,
        "or": MessageLookupByLibrary.simpleMessage("Or"),
        "outofrange":
            MessageLookupByLibrary.simpleMessage("Value out of rangeo"),
        "pageHomeListTitle":
            MessageLookupByLibrary.simpleMessage("Some localized strings:"),
        "pageHomeSampleCurrentDateTime": m3,
        "pageHomeSamplePlaceholder": m4,
        "pageHomeSamplePlaceholdersOrdered": m5,
        "pageHomeSamplePlural": m6,
        "pageHomeSampleTotalAmount": m7,
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "passworddontmatch":
            MessageLookupByLibrary.simpleMessage("Passwords don\'t match"),
        "percentvalue": m8,
        "phone": MessageLookupByLibrary.simpleMessage("Contact"),
        "purpose": MessageLookupByLibrary.simpleMessage("Purpose"),
        "register": MessageLookupByLibrary.simpleMessage("Register"),
        "remain": m9,
        "signup": MessageLookupByLibrary.simpleMessage("Sign up"),
        "singup": MessageLookupByLibrary.simpleMessage("Sign up"),
        "skip": MessageLookupByLibrary.simpleMessage("Skip"),
        "swipeterms": MessageLookupByLibrary.simpleMessage(
            "Swipe to review the terms and conditions"),
        "termconditions":
            MessageLookupByLibrary.simpleMessage("Terms and conditions"),
        "tir": MessageLookupByLibrary.simpleMessage("% Interest"),
        "welcome": MessageLookupByLibrary.simpleMessage("Welcome"),
        "youllget": MessageLookupByLibrary.simpleMessage("You\'ll get")
      };
}
