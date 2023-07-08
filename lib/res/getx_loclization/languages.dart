
import 'package:get/get_navigation/src/root/internacionalization.dart';

class Languages extends Translations{
  @override
  Map<String,Map<String,String>>get keys =>{
    'en_US': {
      'Choose your language': 'Choose your language',
      'language':'Language',
      'singIn':"Sign In"
    },
    'es_US': {
      'Choose your language': 'Elige tu idioma',
      'language':'Idioma',
      'singIn':"Iniciar sesión"
    }
  };
}