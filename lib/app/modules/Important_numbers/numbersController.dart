
import 'package:get/get.dart';


import '../../data/Model/model.dart';

class NumberController extends GetxController {
  @override
  Future<void> onInit() async {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
  RxList<Important_number> getDataList = RxList<Important_number>([
    Important_number(
        name: "પોલીસ",
        number:
            "100,2241301-02-03,વરાછા-2544496,કાપોદરા-2577579,કતારગામ-2482585"),
    Important_number(name: "આગ", number: "101,2414139"),
    Important_number(name: "એમ્બ્યુલન્સ", number: "108"),
    Important_number(
        name: "SMC હેલ્પલાઈન", number: "2451913,2423751,1800-123-8000"),
    Important_number(name: "SMC ફરિયાદ", number: "7623838000"),
    Important_number(
        name: "શબવાહિની",
        number: "SMC-2414139,મારુતિ ગૌશાળા, વરાછા -9586308885"),
    Important_number(name: "રેલવે પુછપરછ", number: "139"),
    Important_number(name: "ટોરેન્ટ પાવર", number: "2551912,2400240"),
    Important_number(
        name: "દક્ષિણ ગુજરાત વીજ(GEB)",
        number: "2506000,2506200,1800-233-3003"),
    Important_number(name: "ગુજરાત ગેસ ઈમરજન્સી", number: "18002330400"),
    Important_number(
        name: "ઘાયલ પશુ પક્ષી બચવવા",
        number:
            "કુદરતી ક્લબ -9825480908/9825057678,કરુણા-3131901,પ્રાર્થના-9825119081"),
    Important_number(name: "સરદાર  પટેલ સ્મૃતિ  ભવન", number: "2567773"),
    Important_number(name: "સુરત એરપોર્ટ પૂછપરછ ", number: "2700200/2700203"),

    //hospital
    Important_number(name: "સુરત રક્તદાનકેન્દ્ર ", number: "3937700/393774"),
    Important_number(
        name: "લોકસમર્પણ  રક્તદાનકેન્દ્ર ", number: "2553020/2547575"),
    Important_number(
        name: "લોકદ્રષ્ટિ ચક્ષુ બેંક", number: "2553653/9825034591"),
    Important_number(
        name: "સ્મીમેર હોસ્પિટલ", number: "2368040-44,9724346044-48"),
    Important_number(name: "સિવિલ હોસ્પિટલ,મજુરા", number: "2244456-59"),
    Important_number(name: "મહાવીર હોસ્પિટલ", number: "4082000/4082022"),
    Important_number(name: "કિરણ  હોસ્પિટલ", number: "7161111/2534111"),
    Important_number(name: "સુરત ડાયમંડ હોસ્પિટલ", number: "2503502/9426875946"),
    Important_number(name: "એપલ હોસ્પિટલ", number: "2310703"),
    Important_number(name: "વૉકહાર્ટ હોસ્પિટલ", number: "66944444"),
    Important_number(name: "ભારત કેન્સર  હોસ્પિટલ ", number: "3884400/10/11"),
    Important_number(name: "બીએપીએસ  હોસ્પિટલ", number: "2781000/9879644144"),
    //gujarat
    Important_number(name: "પોલીસ ", number: "100"),
    Important_number(name: "આગ", number: "101"),
    Important_number(name: "એમ્બ્યુલન્સ", number: "108"),
    Important_number(name: "ઓટો રીક્ષા તરફથી હેરાનગતિ થતી હોઈ તો ટ્રાફિક પોલીસ", number: "1095"),
    Important_number(
        name: "લાંચ રિશ્વત ની ફરિયાદ", number: "1800023344444,9586800870"),
    Important_number(name: "આપઘાત નો વિચાર અટકાવ", number: "1096"),
    Important_number(name: "મહિલા હેલ્પલાઇન", number: "1019"),
    Important_number(
        name: "વરિષ્ઠ નાગરિક  અને બાળકો ની મદદ માટે", number: "1090"),
    Important_number(
        name: "અઘટીત બનાવ વખતે પોલીસ ને ઓળખ આપ્યા વગર જાણ કરવા",
        number: "7738133144/7738144144"),
    Important_number(name: "સાયબર  ગુનાની ફરિયાદ માટે", number: "9820810007"),
    Important_number(
        name: "રેલવે પ્રવાસ દરમિયાન સામાન ખોવાય તો ", number: "9833331111"),
    //bharat
    Important_number(name: "પોલીસ ", number: "100"),
    Important_number(name: "આગ", number: "101"),
    Important_number(name: "એમ્બ્યુલન્સ", number: "102"),
    Important_number(name: "કુદરતી આફત વખતે ", number: "108/1078"),
    Important_number(name: "મહિલા હેલ્પલાઈન", number: "1091"),
    Important_number(name: "બાળકો ની  મદદ  માટે", number: "1098"),
    Important_number(name: "એર એમ્બ્યુલન્સ", number: "9540161344"),
    Important_number(name: "એડ્સ હેલ્પલાઇન ", number: "1097"),
    Important_number(name: "રેલવે પુછપરછ ", number: "139"),
    Important_number(name: "વરિષ્ઠ નાગરિક હેલ્પલાઇન", number: "101/1291"),
    Important_number(name: "રેલવે અકસ્માત ઇમરજન્સી", number: "1072"),
    Important_number(name: "રોડ અકસ્માત (નેશનલ હાઈવે)", number: "1033"),
    Important_number(name: "કિસાન કોલ સેન્ટર", number: "1551"),

    //mahiti
    Important_number(name: "ગુજરાતી સમાજ લિસ્ટ - સમગ્ર ભારત",filename: ""),
    Important_number(name: "ગુજરાત સરકાર ભરતી માગદર્શન પુષ્ટિકા",filename: ""),
    Important_number(name: "લેઉઆ પટેલ સમાજ લિસ્ટ - સમગ્ર ભારત",filename: ""),
  ]);
}
