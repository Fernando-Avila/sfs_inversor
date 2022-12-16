// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a es locale. All the
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
  String get localeName => 'es';

  static String m0(howMany) =>
      "${Intl.plural(howMany, one: 'Notificación', other: 'Notificaciones')}";

  static String m1(date, time) => "Date: ${date} Time: ${time}";

  static String m2(name) => "Welcome ${name}";

  static String m3(firstName, lastName) =>
      "My name is ${lastName}, ${firstName} ${lastName}";

  static String m4(howMany) =>
      "${Intl.plural(howMany, one: 'You have 1 message', other: 'You have ${howMany} messages')}";

  static String m5(total) => " ${total}";

  static String m6(percent) => "${percent} %";

  static String m7(total) => "Quedán ${total} ";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "accouninvited":
            MessageLookupByLibrary.simpleMessage("Cuenta Invitado"),
        "acepttermsandconditions": MessageLookupByLibrary.simpleMessage(
            "He leído y estoy de acuerdo con los términos y condiciones"),
        "alreadyregistered":
            MessageLookupByLibrary.simpleMessage("¿Ya estás registrado?"),
        "amount": MessageLookupByLibrary.simpleMessage("Monto"),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancelar"),
        "confirmpassword":
            MessageLookupByLibrary.simpleMessage("Confirmar Contraseña"),
        "continu": MessageLookupByLibrary.simpleMessage("Continuar"),
        "fieldrequired":
            MessageLookupByLibrary.simpleMessage("Campo Requerido"),
        "forgotpass":
            MessageLookupByLibrary.simpleMessage("¿Olvido su contraseña?"),
        "id": MessageLookupByLibrary.simpleMessage("ID"),
        "invalidmail": MessageLookupByLibrary.simpleMessage("Correo inválido"),
        "invest": MessageLookupByLibrary.simpleMessage("Invertir"),
        "lastnames": MessageLookupByLibrary.simpleMessage("Apellidos"),
        "login": MessageLookupByLibrary.simpleMessage("Inicia sesión"),
        "mail": MessageLookupByLibrary.simpleMessage("Correo electrónico"),
        "minimumpassword":
            MessageLookupByLibrary.simpleMessage("8 caracteres mínimo"),
        "names": MessageLookupByLibrary.simpleMessage("Nombres"),
        "next": MessageLookupByLibrary.simpleMessage("Siguiente"),
        "notaccount":
            MessageLookupByLibrary.simpleMessage("¿No tienes cuenta?"),
        "notificationSamplePlural": m0,
        "or": MessageLookupByLibrary.simpleMessage("O"),
        "pageHomeListTitle":
            MessageLookupByLibrary.simpleMessage("Some localized strings:"),
        "pageHomeSampleCurrentDateTime": m1,
        "pageHomeSamplePlaceholder": m2,
        "pageHomeSamplePlaceholdersOrdered": m3,
        "pageHomeSamplePlural": m4,
        "pageHomeSampleTotalAmount": m5,
        "password": MessageLookupByLibrary.simpleMessage("Contraseña"),
        "passworddontmatch": MessageLookupByLibrary.simpleMessage(
            "Las contraseñas no coinciden"),
        "percentvalue": m6,
        "phone": MessageLookupByLibrary.simpleMessage("Contacto"),
        "register": MessageLookupByLibrary.simpleMessage("Registro"),
        "remain": m7,
        "signup": MessageLookupByLibrary.simpleMessage("Registrarse"),
        "singup": MessageLookupByLibrary.simpleMessage("Registrate"),
        "skip": MessageLookupByLibrary.simpleMessage("Omitir"),
        "swipeterms": MessageLookupByLibrary.simpleMessage(
            "Desliza para revisar los términos y condiciones"),
        "termconditions":
            MessageLookupByLibrary.simpleMessage("Términos y condiciones"),
        "tir": MessageLookupByLibrary.simpleMessage("% Interés"),
        "welcome": MessageLookupByLibrary.simpleMessage("Bienvenido")
      };
}
