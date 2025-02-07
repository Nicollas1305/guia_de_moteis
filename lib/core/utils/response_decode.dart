import 'dart:convert';

String decodeResponseBody(String body) {
  return utf8.decode(latin1.encode(body), allowMalformed: true);
}
