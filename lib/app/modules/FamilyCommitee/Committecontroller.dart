import 'package:get/get.dart';

import '../../constant/String_constant.dart';
import '../../data/Model/model.dart';

class CommitteController extends GetxController {
  RxList<samiti> getCommitteDataList = RxList<samiti>([
    samiti(
        image: "assets/images/p3.png",
        member_work: "પાંચતોબરા",
        name: "શ્રી ખોડાભાઈ પરષોત્તમભાઇ",
        mobile: "9825162812"),
    samiti(
        image: "assets/images/p4.png",
        member_work: "પાંચતોબરા",
        name: "શ્રી ગોવિંદભાઇ લલ્લુભાઇ",
        mobile: "9825918084"),
    samiti(
        image: "assets/images/p5.png",
        member_work: "મોવિયા",
        name: "શ્રી દુર્લભભાઈ પ્રેમજીભાઈ ",
        mobile: "9825107664"),
    samiti(
        image: "assets/images/p6.png",
        member_work: "ખારસીયા ",
        name: "શ્રી શીવાભાઈ શંભુભાઈ   ",
        mobile: "7405619744"),
    samiti(
        image: "assets/images/p7.png",
        member_work: "પીઠડીયા ",
        name: "શ્રી વજુભાઇ બચુભાઈ",
        mobile: "9537539399"),
    samiti(
        image: "assets/images/p8.png",
        member_work: "અરડોઇ ",
        name: "શ્રી અરવિંદભાઈ હરજીભાઇ  ",
        mobile: "9925525333"),
    samiti(
        image: "assets/images/p52.png",
        member_work: "વંડા ",
        name: "સ્વ ગોરધનભાઈ બચુભાઈ ",
        mobile: "0000"),
    samiti(
        image: "assets/images/p53.png",
        member_work: "નાના લીલીયા ",
        name: "શ્રી શ્યામજીભાઈ મધુભાઈ  ",
        mobile: "9825194645"),
    samiti(
        image: "assets/images/p54.png",
        member_work: "ભમરીયાં ",
        name: "શ્રી બાલુભાઈ જગાભાઈ  ",
        mobile: "9982519464"),
    samiti(
        image: "assets/images/p55.png",
        member_work: "મોણપર ",
        name: "શ્રી શંભુભાઈ રાઘવભાઈ ",
        mobile: "9879088203"),
    samiti(
        image: "assets/images/p56.png",
        member_work: "ભુવા",
        name: "શ્રી ભનુભાઇ ધનજીભાઈ ",
        mobile: "9427248408"),
    samiti(
        image: "assets/images/p57.png",
        member_work: "વંડા",
        name: "શ્રી જગદીશભાઈ સવજીભાઈ ",
        mobile: "9825408888"),
    samiti(
        image: "assets/images/p17.png",
        member_work: "બળેલ પીપરીયા",
        name: "શ્રી કાનજીભાઈ રાઘવભાઈ ",
        mobile: "9925133366"),
    samiti(
        image: "assets/images/p18.png",
        member_work: "નાના ઝીંઝુડા",
        name: "શ્રી કનૈયાલાલ રવજીભાઈ (સીએ)",
        mobile: "9428435141"),
    samiti(
        image: "assets/images/p19.png",
        member_work: "વેજાગામ",
        name: "શ્રી કાંતિભાઈ ખીમજીભાઈ",
        mobile: "9825136690"),
    //karobarisamiti

    samiti(
        image: "assets/images/p9.png",
        member_work: "કાકીડીમોલી",
        name: "શ્રી જયંતીભાઈ ભગવાનભાઇ ",
        mobile: "9825349071",
      position: "પ્રમુખશ્રી"
    ),
    samiti(
        image: "assets/images/p10.png",
        member_work: "મોટાલીલીયા",
        name: "શ્રી ભગવાનભાઈ લક્ષ્મણભાઇ ",
        mobile: "9825426616",
        position: "મંત્રીશ્રી"
    ),
    samiti(
        image: "assets/images/p11.png",
        member_work: "પાંચટોબરા",
        name: "શ્રી નરેશભાઈ વાલજીભાઇ",
        mobile: "9925503545",
        position: "સહમંત્રીશ્રી"
    ),

    samiti(
        image: "assets/images/p12.png",
        member_work: "મોણપર",
        name: "શ્રી અલ્પેશભાઈ શંભુભાઈ",
        mobile: "9879038982",
        position: "કોઓર્ડિનેટરશ્રી"
    ),
    samiti(
        image: "assets/images/p13.png",
        member_work: "સાળવા",
        name: "શ્રી ઘનશ્યામભાઈ નાથાભાઈ",
        mobile: "9825814244",
        position: "કોઓર્ડિનેટરશ્રી"
    ),
    samiti(
        image: "assets/images/p14.png",
        member_work: "ભમરીયા",
        name: "શ્રી અરવિંદભાઈ લાભુભાઈ",
        mobile: "9879885951",
        position: "સહ ઓર્ડીનેટરશ્રી"
    ),
    samiti(
        image: "assets/images/p15.png",
        member_work: "ભમરીયા",
        name: "શ્રી ઘનશ્યામભાઈ પરષોત્તમભાઇ",
        mobile: "9374706864",
        position: "ઓડિટર"
    ),
    samiti(
        image: "assets/images/p16.png",
        member_work: "પાંચટોબરા",
        name: "શ્રી નરેશભાઈ બાવચંદભાઈ",
        mobile: "9824258055",
        position: "સલાહકાર"
    ),
    samiti(
        image: "assets/images/p17.png",
        member_work: "બળેલ પીપરીયા",
        name: "શ્રી કાનજીભાઈ રાઘવભાઈ",
        mobile: "9925133366",
        position: "સલાહકાર"
    ),
    samiti(
        image: "assets/images/p18.png",
        member_work: "નાના ઝીંઝુડા",
        name: "શ્રી કનૈયાલાલ રવજીભાઈ (સીએ)",
        mobile: "9374706625",
        position: "સલાહકાર"
    ),
    samiti(
        image: "assets/images/p19.png",
        member_work: "વેજાગામ",
        name: "શ્રી કાંતિભાઈ ખીમજીભાઈ",
        mobile: "9825136690",
        position: "સલાહકાર"
    ),
    samiti(
        image: "assets/images/p20.png",
        member_work: "ભુવા",
        name: "શ્રી રમણીકભાઇ નનુભાઈ (સીએ)",
        mobile: "9979227527",
        position: "સલાહકાર"
    ),
    samiti(
        image: "assets/images/p21.png",
        member_work: "વડોદ",
        name: "શ્રી શૈલેષભાઇ ઠાકરશીભાઈ (સીએ)",
        mobile: "9227925100",
        position: "સલાહકાર"
    ),
    samiti(
        image: "assets/images/p22.png",
        member_work: "મોટાલીલીયા",
        name: "શ્રી યશોધરભાઈ ગોકળદાસ",
        mobile: "9825235227",
        position: "સલાહકાર"

    ),


    ////sanklan smittii


    samiti(
        image: "assets/images/p23.png",
        member_work: "દાધીયા",
        name: "શ્રી મનસુખભાઇ પરષોત્તમભાઇ",
        mobile: "9825383493"),
    samiti(
        image: "assets/images/p24.png",
        member_work: "ભુવા",
        name: "શ્રી પ્રકાશભાઈ રવજીભાઈ",
        mobile: "9825107664"),
    samiti(
        image: "assets/images/p25.png",
        member_work: "પાંચતલાવડા ",
        name: "શ્રી જનકભાઈ ધીરજલાલ",
        mobile: "7405619744"),
    samiti(
        image: "assets/images/p26.png",
        member_work: "મેરિયાણા ",
        name: "શ્રી નરેશભાઈ નાગજીભાઈ",
        mobile: "9537539399"),
    samiti(
        image: "assets/images/p27.png",
        member_work: "ઘોબા ",
        name: "શ્રી સંજયભાઈ નાનજીભાઈ",
        mobile: "9925525333"),
    samiti(
        image: "assets/images/p28.png",
        member_work: "બળેલ પીપરીયા ",
        name: "શ્રી અનિલભાઈ પોપટભાઈ",
        mobile: "0000"),
    samiti(
        image: "assets/images/p29.png",
        member_work: "મોણપર ",
        name: "શ્રી પ્રકાશભાઈ વાઘજીભાઈ",
        mobile: "9825194645"),
    samiti(
        image: "assets/images/p30.png",
        member_work: "પાંચટોબરા ",
        name: "શ્રી શામજીભાઈ ડુંગરભાઈ",
        mobile: "9982519464"),
    samiti(
        image: "assets/images/p31.png",
        member_work: "મોણપર ",
        name: "શ્રી મુકેશભાઈ વશરામભાઇ",
        mobile: "9879088203"),
    samiti(
        image: "assets/images/p32.png",
        member_work: "મોટાલીલીયા",
        name: "શ્રી મુકેશભાઈ ગોકળભાઇ",
        mobile: "9427248408"),
    samiti(
        image: "assets/images/p33.png",
        member_work: "પાંચટોબરા",
        name: "શ્રી અલ્પેશભાઈ ખોડાભાઈ",
        mobile: "9825408888"),
    samiti(
        image: "assets/images/p34.png",
        member_work: "અરડોઇ",
        name: "શ્રી ભાસ્કરભાઈ જયંતિભાઈ",
        mobile: "9925133366"),
    samiti(
        image: "assets/images/p35.png",
        member_work: "તાવેડા",
        name: "શ્રી પરેશભાઈ મગનભાઈ",
        mobile: "9428435141"),
    samiti(
        image: "assets/images/p36.png",
        member_work: "સાકરપરા",
        name: "શ્રી રાજેશભાઈ મનસુખભાઇ",
        mobile: "9825136690"),
    samiti(
        image: "assets/images/p37.png",
        member_work: "તાવેડા",
        name: "શ્રી ઉર્વેશભાઈ પ્રકાશભાઈ",
        mobile: "9825162812"),
    samiti(
        image: "assets/images/p38.png",
        member_work: "દેવળા",
        name: "શ્રી ધર્મેશભાઈ હરિભાઈ",
        mobile: "9825918084"),
    samiti(
        image: "assets/images/p39.png",
        member_work: "શાંતિનગર",
        name: "શ્રી રજનીભાઇ મનુભાઈ",
        mobile: "9825107664"),
    samiti(
        image: "assets/images/p40.png",
        member_work: "થોરડી ",
        name: "શ્રી ઘનશ્યામભાઈ મનજીભાઇ",
        mobile: "7405619744"),
    samiti(
        image: "assets/images/p41.png",
        member_work: "મોટાલીલીયા ",
        name: "શ્રી દામજીભાઇ નારણભાઇ",
        mobile: "9537539399"),
    samiti(
        image: "assets/images/p42.png",
        member_work: "જાબાળ ",
        name: "શ્રી બાબુભાઇ મધુભાઇ",
        mobile: "9925525333"),
    samiti(
        image: "assets/images/p43.png",
        member_work: "ખરેડી ",
        name: "શ્રી હિંમતભાઇ બચુભાઈ",
        mobile: "0000"),
    samiti(
        image: "assets/images/p44.png",
        member_work: "પાંચટોબરા",
        name: "શ્રી જયંતીભાઈ માવજીભાઈ",
        mobile: "9825194645"),
    samiti(
        image: "assets/images/p45.png",
        member_work: "ભમરીયાં ",
        name: "શ્રી સંજયભાઈ બાલુભાઈ",
        mobile: "9982519464"),
    samiti(
        image: "assets/images/p46.png",
        member_work: "નાના લીલીયા ",
        name: "શ્રી મનીષભાઈ શામજીભાઈ",
        mobile: "9879088203"),
    samiti(
        image: "assets/images/p47.png",
        member_work: "ભુવા",
        name: "શ્રી ભરતભાઈ લાલજીભાઈ",
        mobile: "9427248408"),
    samiti(
        image: "assets/images/p48.png",
        member_work: "ભુવા",
        name: "શ્રી હર્ષભાઈ ધીરુભાઈ",
        mobile: "9825408888"),
    samiti(
        image: "assets/images/p49.png",
        member_work: "વંડા",
        name: "શ્રી ભાવેશભાઈ સવજીભાઈ",
        mobile: "9925133366"),
    samiti(
        image: "assets/images/p50.png",
        member_work: "મોવિયા",
        name: "શ્રી મનીષભાઈ કાનજીભાઈ",
        mobile: "9428435141"),
    samiti(
        image: "assets/images/p51.png",
        member_work: "મોણપર",
        name: "શ્રી દિનેશભાઇ વશરામભાઇ",
        mobile: "9825136690"),
    samiti(
        image: "assets/images/p51.png",
        member_work: "મોણપર",
        name: "શ્રી દિનેશભાઇ વશરામભાઇ",
        mobile: "9825136690"),

  ]);
}
