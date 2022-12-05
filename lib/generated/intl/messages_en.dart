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

  static String m0(date, time) => "Date: ${date} Time: ${time}";

  static String m1(name) => "Welcome ${name}";

  static String m2(firstName, lastName) =>
      "My name is ${lastName}, ${firstName} ${lastName}";

  static String m3(howMany) =>
      "${Intl.plural(howMany, one: 'You have 1 message', other: 'You have ${howMany} messages')}";

  static String m4(total) => "Total: ${total}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "accouninvited": MessageLookupByLibrary.simpleMessage("Guest Account"),
        "acepttermsandconditions": MessageLookupByLibrary.simpleMessage(
            "I have read and agree to the terms and conditions"),
        "alreadyregistered":
            MessageLookupByLibrary.simpleMessage("Already registered?"),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "confirmpassword":
            MessageLookupByLibrary.simpleMessage("Confirm Password"),
        "continu": MessageLookupByLibrary.simpleMessage("Continue"),
        "fieldrequired": MessageLookupByLibrary.simpleMessage("Field required"),
        "forgotpass":
            MessageLookupByLibrary.simpleMessage("Forgot your password?"),
        "invalidmail": MessageLookupByLibrary.simpleMessage("Invalid email"),
        "lastnames": MessageLookupByLibrary.simpleMessage("lastName"),
        "login": MessageLookupByLibrary.simpleMessage("Log in"),
        "mail": MessageLookupByLibrary.simpleMessage("Email"),
        "minimumpassword":
            MessageLookupByLibrary.simpleMessage("8 characters minimum"),
        "names": MessageLookupByLibrary.simpleMessage("FirstName"),
        "next": MessageLookupByLibrary.simpleMessage("Next"),
        "notaccount":
            MessageLookupByLibrary.simpleMessage("You do not have an account?"),
        "or": MessageLookupByLibrary.simpleMessage("Or"),
        "pageHomeListTitle":
            MessageLookupByLibrary.simpleMessage("Some localized strings:"),
        "pageHomeSampleCurrentDateTime": m0,
        "pageHomeSamplePlaceholder": m1,
        "pageHomeSamplePlaceholdersOrdered": m2,
        "pageHomeSamplePlural": m3,
        "pageHomeSampleTotalAmount": m4,
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "passworddontmatch":
            MessageLookupByLibrary.simpleMessage("Passwords don\'t match"),
        "phone": MessageLookupByLibrary.simpleMessage("Contact"),
        "register": MessageLookupByLibrary.simpleMessage("Register"),
        "signup": MessageLookupByLibrary.simpleMessage("Sign up"),
        "singup": MessageLookupByLibrary.simpleMessage("Sign up"),
        "skip": MessageLookupByLibrary.simpleMessage("Skip"),
        "swipeterms": MessageLookupByLibrary.simpleMessage(
            "Swipe to review the terms and conditions"),
        "termconditions":
            MessageLookupByLibrary.simpleMessage("Terms and conditions"),
        "welcome": MessageLookupByLibrary.simpleMessage("Welcome")
      };
}
