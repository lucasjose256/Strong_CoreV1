import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:strong_core/SCREENS/auxiliar_corpo_humano.dart';
import 'package:strong_core/SCREENS/screen_semanas.dart';
import 'package:strong_core/provider/colors.dart';
import 'package:strong_core/style/add_pop_up_card.dart';
import 'package:intl/intl.dart';
import 'package:strong_core/MODELS/botao_duplo.dart';
import 'package:strong_core/MODELS/sequencial_buttun.dart';

import '../MODELS/user_preferences.dart';
import '../provider/colors2.dart';
import '../provider/information_forms.dart';
import '../style/hero_dialog_route.dart';

class CorpoHumano extends StatefulWidget {
  final infoForms;
  const CorpoHumano({Key? key, this.infoForms}) : super(key: key);

  @override
  State<CorpoHumano> createState() => _CorpoHumanoState(infoForms);
}

@override
class _CorpoHumanoState extends State<CorpoHumano> {
  final infoForms;
  _CorpoHumanoState(this.infoForms);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          actions: [
            TextButton(
                onPressed: () => Navigator.of(context).pop(), child: Text('Ok'))
          ],
          title: Text('Anamnese'),
          content: const Text(
              'Selecione TODOS os campos do Corpo Humano com o grau de dor correspondente na região'),
        ),
      );
    });
  }

  Uint8List? bytes;
  GlobalKey _globalKey = GlobalKey();
  bool loading = false;
  List<String> grauDores = [];
  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();
    var telaWidth = MediaQuery.of(context).size.width;
    var telaHight = MediaQuery.of(context).size.height;
    AddTodoButton regiaoCervical1;
    AddTodoButton pescoco0;
    AddTodoButton costasSuperior2;
    AddTodoButton costasMedia3;
    AddTodoButton costasInferior4;
    AddTodoButton bacia5;
    BotaoDuplo? ombro6;
    BotaoDuplo braco7;
    BotaoDuplo cotovelo8;
    BotaoDuplo antebraco9;
    BotaoDuplo punho10;
    BotaoDuplo mao11;
    BotaoDuplo perna12;
    BotaoDuplo joelho13;
    BotaoDuplo panturrilha14;
    BotaoDuplo tornozelo15;
    BotaoDuplo pe16;
    String dores = '';
    String Aux = '';
    for (int i = 0; i < infoForms.dores.length; i++) {
      dores += infoForms.dores[i] + ',';
    }
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('Strong Core'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          //controller:  scrollController.jumpTo(0),
          child: Center(
            child: Container(
              //    alignment: AlignmentDirectional.topStart,
              width: 350,
              height: 730,
              child: Column(
                //        crossAxisAlignment: CrossAxisAlignment.center,
                //mainAxisAlignment: MainAxisA lignment.center,
                children: [
                  Stack(alignment: AlignmentDirectional.topCenter, children: [
                    Image.asset(
                      //      'Assets/images/corpo_humano_2.jpeg',
                      'Assets/images/corpo_humano_2.jpeg', height: 620,
                    ),
                    Positioned(
                        right: 151,
                        top: 55,
                        child: pescoco0 = AddTodoButton(
                          number: '0',
                          numberId: '',
                          nomeMembro: 'na região do PESCOÇO',
                        )),
                    Positioned(
                        right: 151,
                        top: 88,
                        child: regiaoCervical1 = AddTodoButton(
                          number: '1',
                          numberId: '',
                          nomeMembro: 'na região CERVICAL',
                        )),
                    Positioned(
                        right: 151,
                        top: 145,
                        child: costasSuperior2 = AddTodoButton(
                          number: '2',
                          numberId: '',
                          nomeMembro: 'na região COSTAS SUPERIOR',
                        )),
                    Positioned(
                        right: 151,
                        top: 190,
                        child: costasMedia3 = AddTodoButton(
                          number: '3',
                          numberId: '',
                          nomeMembro: 'na região COSTAS MÉDIA',
                        )),
                    Positioned(
                      top: 105,
                      child: ChangeNotifierProvider<Cor2>(
                        create: (context) => Cor2(),
                        child: ChangeNotifierProvider<Cor1>(
                            create: (context) => Cor1(),
                            child: ombro6 = BotaoDuplo(
                              palavraFeminino: false,
                              phraseCard: 'no OMBRO',
                              buttunDistance: 85,
                              numberButtun: '6',
                            )),
                      ),
                    ),
                    Positioned(
                        right: 151,
                        top: 225,
                        child: costasInferior4 = AddTodoButton(
                          number: '4',
                          numberId: '',
                          nomeMembro: 'na região LOMBAR',
                        )),
                    Positioned(
                        right: 151,
                        top: 275,
                        child: bacia5 = AddTodoButton(
                          number: '5',
                          numberId: '',
                          nomeMembro: 'na região do QUADRIL',
                        )),
                    Positioned(
                      top: 150,
                      child: ChangeNotifierProvider<Cor2>(
                        create: (context) => Cor2(),
                        child: ChangeNotifierProvider<Cor1>(
                            create: (context) => Cor1(),
                            child: braco7 = BotaoDuplo(
                              palavraFeminino: false,
                              phraseCard: 'no BRAÇO',
                              buttunDistance: 110,
                              numberButtun: '7',
                            )),
                      ),
                    ),
                    Positioned(
                      top: 185,
                      child: ChangeNotifierProvider<Cor2>(
                        create: (context) => Cor2(),
                        child: ChangeNotifierProvider<Cor1>(
                            create: (context) => Cor1(),
                            child: cotovelo8 = BotaoDuplo(
                              palavraFeminino: false,
                              phraseCard: 'no COTOVELO',
                              buttunDistance: 122,
                              numberButtun: '8',
                            )),
                      ),
                    ),
                    Positioned(
                      top: 220,
                      child: ChangeNotifierProvider<Cor2>(
                        create: (context) => Cor2(),
                        child: ChangeNotifierProvider<Cor1>(
                            create: (context) => Cor1(),
                            child: antebraco9 = BotaoDuplo(
                              palavraFeminino: false,
                              phraseCard: 'no ANTEBRAÇO',
                              buttunDistance: 138,
                              numberButtun: '9',
                            )),
                      ),
                    ),
                    Positioned(
                      top: 255,
                      child: ChangeNotifierProvider<Cor2>(
                        create: (context) => Cor2(),
                        child: ChangeNotifierProvider<Cor1>(
                            create: (context) => Cor1(),
                            child: punho10 = BotaoDuplo(
                              palavraFeminino: false,
                              phraseCard: 'no PUNHO',
                              buttunDistance: 150,
                              numberButtun: '10',
                            )),
                      ),
                    ),
                    Positioned(
                      top: 290,
                      child: ChangeNotifierProvider<Cor2>(
                        create: (context) => Cor2(),
                        child: ChangeNotifierProvider<Cor1>(
                            create: (context) => Cor1(),
                            child: mao11 = BotaoDuplo(
                              palavraFeminino: true,
                              phraseCard: 'na MÃO',
                              buttunDistance: 170,
                              numberButtun: '11',
                            )),
                      ),
                    ),
                    Positioned(
                      top: 354,
                      child: ChangeNotifierProvider<Cor2>(
                        create: (context) => Cor2(),
                        child: ChangeNotifierProvider<Cor1>(
                            create: (context) => Cor1(),
                            child: perna12 = BotaoDuplo(
                              palavraFeminino: true,
                              phraseCard: 'na PERNA',
                              buttunDistance: 14,
                              numberButtun: '12',
                            )),
                      ),
                    ),
                    Positioned(
                      top: 428,
                      child: ChangeNotifierProvider<Cor2>(
                        create: (context) => Cor2(),
                        child: ChangeNotifierProvider<Cor1>(
                            create: (context) => Cor1(),
                            child: joelho13 = BotaoDuplo(
                              palavraFeminino: false,
                              phraseCard: 'no JOELHO',
                              buttunDistance: 10,
                              numberButtun: '13',
                            )),
                      ),
                    ),
                    Positioned(
                      top: 485,
                      child: ChangeNotifierProvider<Cor2>(
                        create: (context) => Cor2(),
                        child: ChangeNotifierProvider<Cor1>(
                            create: (context) => Cor1(),
                            child: panturrilha14 = BotaoDuplo(
                              palavraFeminino: true,
                              phraseCard: 'na PANTURRILHA',
                              buttunDistance: 8,
                              numberButtun: '14',
                            )),
                      ),
                    ),
                    Positioned(
                      top: 550,
                      child: ChangeNotifierProvider<Cor2>(
                        create: (context) => Cor2(),
                        child: ChangeNotifierProvider<Cor1>(
                            create: (context) => Cor1(),
                            child: tornozelo15 = BotaoDuplo(
                              palavraFeminino: false,
                              phraseCard: 'no TORNOZELO',
                              buttunDistance: 0,
                              numberButtun: '15',
                            )),
                      ),
                    ),
                    Positioned(
                      top: 579,
                      child: ChangeNotifierProvider<Cor2>(
                        create: (context) => Cor2(),
                        child: ChangeNotifierProvider<Cor1>(
                            create: (context) => Cor1(),
                            child: pe16 = BotaoDuplo(
                              palavraFeminino: false,
                              phraseCard: 'no PÉ',
                              buttunDistance: 0,
                              numberButtun: '16',
                            )),
                      ),
                    ),
                  ]),
                  const SizedBox(
                    height: 15,
                  ),
                  /* MaterialButton(
                      onPressed: (() => setState(() {})), child: Text('atualizar')),*/
                  MaterialButton(
                    minWidth: 100,
                    padding: EdgeInsets.only(top: 8, bottom: 8),
                    color: ui.Color.fromARGB(255, 202, 43, 32),
                    onPressed: () async {
                      if (pescoco0.graudaDor == null ||
                          regiaoCervical1.graudaDor == null ||
                          costasSuperior2.graudaDor == null ||
                          costasMedia3.graudaDor == null ||
                          costasInferior4.graudaDor == null ||
                          bacia5.graudaDor == null ||
                          ombro6!.painDegreeRight == '' ||
                          ombro6.painDegreeleft == '' ||
                          braco7.painDegreeRight == '' ||
                          braco7.painDegreeleft == '' ||
                          cotovelo8.painDegreeRight == '' ||
                          cotovelo8.painDegreeleft == '' ||
                          antebraco9.painDegreeRight == '' ||
                          antebraco9.painDegreeleft == '' ||
                          punho10.painDegreeRight == '' ||
                          punho10.painDegreeleft == '' ||
                          mao11.painDegreeRight == '' ||
                          mao11.painDegreeleft == '' ||
                          perna12.painDegreeRight == '' ||
                          perna12.painDegreeleft == '' ||
                          joelho13.painDegreeRight == '' ||
                          joelho13.painDegreeleft == '' ||
                          panturrilha14.painDegreeRight == '' ||
                          panturrilha14.painDegreeleft == '' ||
                          tornozelo15.painDegreeRight == '' ||
                          tornozelo15.painDegreeleft == '')

                      /* grauDores = [
                        //     pescoco0!.graudaDor!,
                        /*   pescoco0.graudaDor!,
                          regiaoCervical1.graudaDor!,
                          costasSuperior2.graudaDor!,
                          costasMedia3.graudaDor!,
                          costasInferior4.graudaDor!,
                          bacia5.graudaDor!,*/
                        ombro6!.painDegreeRight!,
                        ombro6.painDegreeleft,
                      ];*/
                      {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            actions: [
                              TextButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: Text('Ok'))
                            ],
                            title: Text('Anamnese'),
                            content: Text(
                                'Selecione TODOS os campos do Corpo Humano'),
                          ),
                        );
                      } else {
                        await UserPreferences.setBool(true);

                        var firebase = await FirebaseFirestore.instance
                            .collection('demo')
                            .doc(FirebaseAuth.instance.currentUser!.uid);
                        firebase.update({
                          'PRIMEIRO_ACESSO_COMPLETO': true,
                        });

                        await firebase.set({
                          'forms_Nome': infoForms.nome,
                          'forms_Sexo': infoForms.sexo,
                          'forms_Peso': infoForms.peso,
                          'forms_Altura': infoForms.altura,
                          'forms_Data de Nascimento': infoForms.dataNascimento,
                          'forms_Posto': infoForms.posto,
                          'forms_Cargo': infoForms.cargo,
                          'forms_DataAdmissao': infoForms.dataAdmissao,
                          'forms_P1_exercicio_na_semana': infoForms.question1,
                          'forms_P2_intrucao_exercicio': infoForms.question2,
                          'forms_P3_orientacoes_exercicio': infoForms.question3,
                          'forms_P4_Lista_problemas_saude': dores,
                          'forms_P5_dormir_suficiente': infoForms.question4,
                          'forms_P6_estresse': infoForms.question5,
                          ////////////////////////
                          'Pescoço0_SEM_0': pescoco0.graudaDor,
                          'Pescoço0_SEM_4': '',
                          'Pescoço0_SEM_6': '',
                          'Pescoço0_SEM_8': '',
                          ////////////
                          'Regiao_cervical1_SEM_0': regiaoCervical1.graudaDor,
                          'Regiao_cervical1_SEM_4': '',
                          'Regiao_cervical1_SEM_6': '',
                          'Regiao_cervical1_SEM_8': '',
                          //////
                          'Costas_superior2_SEM_0': costasSuperior2.graudaDor,
                          'Costas_superior2_SEM_4': '',
                          'Costas_superior2_SEM_6': '',
                          'Costas_superior2_SEM_8': '',
                          ///////////
                          'Costas_média3_SEM_0': costasMedia3.graudaDor,
                          'Costas_média3_SEM_4': '',
                          'Costas_média3_SEM_6': '',
                          'Costas_média3_SEM_8': '',
                          ////////
                          'Costas_inferior4_SEM_0': costasInferior4.graudaDor,
                          'Costas_inferior4_SEM_4': '',
                          'Costas_inferior4_SEM_6': '',
                          'Costas_inferior4_SEM_8': '',
                          /////
                          'Bacia5_SEM_0': bacia5.graudaDor,
                          'Bacia5_SEM_4': '',
                          'Bacia5_SEM_6': '',
                          'Bacia5_SEM_8': '',
                          /////
                          'Ombro6_DIREITO_SEM_0': ombro6!.painDegreeRight,
                          'Ombro6_DIREITO_SEM_4': '',
                          'Ombro6_DIREITO_SEM_6': '',
                          'Ombro6_DIREITO_SEM_8': '',

                          'Ombro6_ESQUERDO_SEM_0': ombro6!.painDegreeleft,
                          'Ombro6_ESQUERDO_SEM_4': '',
                          'Ombro6_ESQUERDO_SEM_6': '',
                          'Ombro6_ESQUERDO_SEM_8': '',

                          'Braço7_DIREITO_SEM_0': braco7.painDegreeRight,
                          'Braço7_DIREITO_SEM_4': '',
                          'Braço7_DIREITO_SEM_6': '',
                          'Braço7_DIREITO_SEM_8': '',

                          'Braço7_ESQUERDO_SEM_0': braco7.painDegreeleft,
                          'Braço7_ESQUERDO_SEM_4': '',
                          'Braço7_ESQUERDO_SEM_6': '',
                          'Braço7_ESQUERDO_SEM_8': '',

                          'Cotovelo8_DIREITO_SEM_0': cotovelo8.painDegreeRight,
                          'Cotovelo8_DIREITO_SEM_4': '',
                          'Cotovelo8_DIREITO_SEM_6': '',
                          'Cotovelo8_DIREITO_SEM_8': '',

                          'Cotovelo8_ESQUERDO_SEM_0': cotovelo8.painDegreeleft,
                          'Cotovelo8_ESQUERDO_SEM_4': '',
                          'Cotovelo8_ESQUERDO_SEM_6': '',
                          'Cotovelo8_ESQUERDO_SEM_8': '',

                          'Antebraço9_DIREITO_SEM_0':
                              antebraco9.painDegreeRight,
                          'Antebraço9_DIREITO_SEM_4': '',
                          'Antebraço9_DIREITO_SEM_6': '',
                          'Antebraço9_DIREITO_SEM_8': '',

                          'Antebraço9_ESQUERDO_SEM_0':
                              antebraco9.painDegreeleft,
                          'Antebraço9_ESQUERDO_SEM_4': '',
                          'Antebraço9_ESQUERDO_SEM_6': '',
                          'Antebraço9_ESQUERDO_SEM_8': '',

                          'Punho10_DIREITO_SEM_0': punho10.painDegreeRight,
                          'Punho10_DIREITO_SEM_4': '',
                          'Punho10_DIREITO_SEM_6': '',
                          'Punho10_DIREITO_SEM_8': '',

                          'Punho10_ESQUERDO_SEM_0': punho10.painDegreeleft,
                          'Punho10_ESQUERDO_SEM_4': '',
                          'Punho10_ESQUERDO_SEM_6': '',
                          'Punho10_ESQUERDO_SEM_8': '',

                          'Mao11_DIREITA_SEM_0': mao11.painDegreeRight,
                          'Mao11_DIREITA_SEM_4': '',
                          'Mao11_DIREITA_SEM_6': '',
                          'Mao11_DIREITA_SEM_8': '',

                          'Mao11_ESQUERDA_SEM_0': mao11.painDegreeleft,
                          'Mao11_ESQUERDA_SEM_4': '',
                          'Mao11_ESQUERDA_SEM_6': '',
                          'Mao11_ESQUERDA_SEM_8': '',

                          'Perna12_DIREITA_SEM_0': perna12.painDegreeRight,
                          'Perna12_DIREITA_SEM_4': '',
                          'Perna12_DIREITA_SEM_6': '',
                          'Perna12_DIREITA_SEM_8': '',

                          'Perna12_ESQUERDA_SEM_0': perna12.painDegreeleft,
                          'Perna12_ESQUERDA_SEM_4': '',
                          'Perna12_ESQUERDA_SEM_6': '',
                          'Perna12_ESQUERDA_SEM_8': '',

                          'Joelho13_DIREITO_SEM_0': joelho13.painDegreeRight,
                          'Joelho13_DIREITO_SEM_4': '',
                          'Joelho13_DIREITO_SEM_6': '',
                          'Joelho13_DIREITO_SEM_8': '',

                          'Joelho13_ESQUERDO_SEM_0': joelho13.painDegreeleft,
                          'Joelho13_ESQUERDO_SEM_4': '',
                          'Joelho13_ESQUERDO_SEM_6': '',
                          'Joelho13_ESQUERDO_SEM_8': '',

                          'Panturrilha14_DIREITA_SEM_0':
                              panturrilha14.painDegreeRight,
                          'Panturrilha14_DIREITA_SEM_4': '',
                          'Panturrilha14_DIREITA_SEM_6': '',
                          'Panturrilha14_DIREITA_SEM_8': '',

                          'Panturrilha14_ESQUERDA_SEM_0':
                              panturrilha14.painDegreeleft,
                          'Panturrilha14_ESQUERDA_SEM_4': '',
                          'Panturrilha14_ESQUERDA_SEM_6': '',
                          'Panturrilha14_ESQUERDA_SEM_8': '',

                          'Tornozelo15_DIREITO_SEM_0':
                              tornozelo15.painDegreeRight,
                          'Tornozelo15_DIREITO_SEM_4': '',
                          'Tornozelo15_DIREITO_SEM_6': '',
                          'Tornozelo15_DIREITO_SEM_8': '',

                          'Tornozelo15_ESQUERDO_SEM_0':
                              tornozelo15.painDegreeleft,
                          'Tornozelo15_ESQUERDO_SEM_4': '',
                          'Tornozelo15_ESQUERDO_SEM_6': '',
                          'Tornozelo15_ESQUERDO_SEM_8': '',

                          'Pe16_DIREITO_SEM_0': pe16.painDegreeRight,
                          'Pe16_DIREITO_SEM_4': '',
                          'Pe16_DIREITO_SEM_6': '',
                          'Pe16_DIREITO_SEM_8': '',

                          'Pe16_ESQUERDO_SEM_0': pe16.painDegreeleft,
                          'Pe16_ESQUERDO_SEM_4': '',
                          'Pe16_ESQUERDO_SEM_6': '',
                          'Pe16_ESQUERDO_SEM_8': '',

                          '_HORARIO_PRIMEIRO_ACESSO':
                              DateFormat.yMMMEd().format(DateTime.now()),
                          '_HORARIO_LIBERA_PROXIMO_VIDEO_SEMANA_1':
                              DateTime.now().add(Duration(days: 7)),

                          '_HORARIO_LIBERA_PROXIMO_VIDEO_SEMANA_4':
                              DateTime.now().add(Duration(days: 7 * 4)),
                          '_HORARIO_LIBERA_PROXIMO_VIDEO_SEMANA_5':
                              DateTime.now().add(Duration(days: 7 * 5)),
                          '_HORARIO_LIBERA_PROXIMO_VIDEO_SEMANA_6':
                              DateTime.now().add(Duration(days: 7 * 6)),
                          '_HORARIO_LIBERA_PROXIMO_VIDEO_SEMANA_7':
                              DateTime.now().add(Duration(days: 7 * 7)),
                          '_HORARIO_LIBERA_PROXIMO_VIDEO_SEMANA_8':
                              DateTime.now().add(Duration(days: 7 * 8)),
                          '_HORARIO_LIBERA_PROXIMO_VIDEO_SEMANA_9':
                              DateTime.now().add(Duration(days: 7 * 9)),

                          'ATUALIZOU_ANAMNSE_SEM2': false,
                          'ATUALIZOU_ANAMNSE_SEM4': false,
                          'ATUALIZOU_ANAMNSE_SEM6': false,
                          'ATUALIZOU_ANAMNSE_SEM8': false,

                          //SEMANA 1 DIA 1
                        });

                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (constect) => Semanas(),
                              settings: const RouteSettings()),
                        );
                      }
                    },
                    child: Text(
                      'Finalizar',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      side: BorderSide(color: Theme.of(context).primaryColor),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Map<String, int> listaExercicios = {
  'SEM_2_DIA1_EXERCICIO_PRANCHA DORSAL2': 100,
  'SEM_2_DIA1_EXERCICIO_PRANCHA DORSAL3': 100,
  'SEM_2_DIA1_EXERCICIO_PRANCHA DORSAL4': 100,
  'SEM_2_DIA1_EXERCICIO_PRANCHA DORSAL5': 100,
};
