import 'package:uuid/uuid.dart';

class IdGenerator {
  IdGenerator(this._uuid);

  final Uuid _uuid;
  // late final _random = Random();

  String generateId() {
    return _uuid.v4();
    // if (name == null) {
    //   return _uuid.v4();
    // }
    // return _fromName(name);
  }

  // String _fromName(String name) {
  //   final symbols =
  //       name.toLowerCase().replaceAll(' ', '_').replaceAll('-', '_').split('');
  //   return String.fromCharCodes(
  //     symbols.expand<int>(
  //       (s) {
  //         if (_isEngLetter(s)) {
  //           return s.runes;
  //         }
  //         final mapping = _symbolsMapping[s];
  //         if (mapping != null) {
  //           return mapping.runes;
  //         }
  //         return [];
  //       },
  //     ).followedBy('_${_random.nextInt(1000)}'.runes),
  //   );
  // }

  // late final _aRune = 'a'.runes.first;

  // late final _zRune = 'z'.runes.first;

  // bool _isEngLetter(String letter) {
  //   final rune = letter.runes.first;
  //   return rune >= _aRune && rune <= _zRune;
  // }

  // late final _symbolsMapping = {
  //   'а': 'a',
  //   'ә': 'ae',
  //   'б': 'b',
  //   'в': 'v',
  //   'г': 'g',
  //   'д': 'd',
  //   'е': 'e',
  //   'ё': 'io',
  //   'ж': 'j',
  //   'җ': 'j',
  //   'з': 'z',
  //   'и': 'i',
  //   'й': 'y',
  //   'к': 'k',
  //   'л': 'l',
  //   'м': 'm',
  //   'н': 'n',
  //   'ң': 'ng',
  //   'о': 'o',
  //   'ө': 'oe',
  //   'п': 'p',
  //   'р': 'r',
  //   'с': 's',
  //   'т': 't',
  //   'у': 'u',
  //   'ү': 'ue',
  //   'ф': 'f',
  //   'х': 'x',
  //   'һ': 'h',
  //   'ц': 'ts',
  //   'ч': 'ch',
  //   'ш': 'sh',
  //   'щ': 'sch',
  //   'ы': 'y',
  //   'э': 'ie',
  //   'ю': 'iu',
  //   'я': 'ia',
  // };
}
