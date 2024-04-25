import 'package:flutter/material.dart';
import 'package:newhiitgymfirebase2/presentation/widgets_screens.dart';

class Rutina5Dias extends StatefulWidget {
  static const name = '/runtina_5dias_screen';

  const Rutina5Dias({super.key});

  @override
  State<Rutina5Dias> createState() => _Rutina5DiasState();
}

class _Rutina5DiasState extends State<Rutina5Dias> {
  TextEditingController dia1Titulo1Controller = TextEditingController();
  TextEditingController dia2Titulo1Controller = TextEditingController();
  TextEditingController dia3Titulo1Controller = TextEditingController();
  TextEditingController dia4Titulo1Controller = TextEditingController();
  TextEditingController dia5Titulo1Controller = TextEditingController();

  TextEditingController dia1Titulo2Controller = TextEditingController();
  TextEditingController dia2Titulo2Controller = TextEditingController();
  TextEditingController dia3Titulo2Controller = TextEditingController();
  TextEditingController dia4Titulo2Controller = TextEditingController();
  TextEditingController dia5Titulo2Controller = TextEditingController();

  TextEditingController dia1Ejercicio1Controller = TextEditingController();
  TextEditingController dia1Ejercicio2Controller = TextEditingController();
  TextEditingController dia1Ejercicio3Controller = TextEditingController();
  TextEditingController dia1Ejercicio4Controller = TextEditingController();
  TextEditingController dia1Ejercicio5Controller = TextEditingController();
  TextEditingController dia1Ejercicio6Controller = TextEditingController();
  TextEditingController dia1Ejercicio7Controller = TextEditingController();
  TextEditingController dia1Ejercicio8Controller = TextEditingController();

  TextEditingController dia2Ejercicio1Controller = TextEditingController();
  TextEditingController dia2Ejercicio2Controller = TextEditingController();
  TextEditingController dia2Ejercicio3Controller = TextEditingController();
  TextEditingController dia2Ejercicio4Controller = TextEditingController();
  TextEditingController dia2Ejercicio5Controller = TextEditingController();

  TextEditingController dia3Ejercicio1Controller = TextEditingController();
  TextEditingController dia3Ejercicio2Controller = TextEditingController();
  TextEditingController dia3Ejercicio3Controller = TextEditingController();
  TextEditingController dia3Ejercicio4Controller = TextEditingController();
  TextEditingController dia3Ejercicio5Controller = TextEditingController();

  TextEditingController dia4Ejercicio1Controller = TextEditingController();
  TextEditingController dia4Ejercicio2Controller = TextEditingController();
  TextEditingController dia4Ejercicio3Controller = TextEditingController();
  TextEditingController dia4Ejercicio4Controller = TextEditingController();
  TextEditingController dia4Ejercicio5Controller = TextEditingController();
  TextEditingController dia4Ejercicio6Controller = TextEditingController();
  TextEditingController dia4Ejercicio7Controller = TextEditingController();
  TextEditingController dia4Ejercicio8Controller = TextEditingController();

  TextEditingController dia5Ejercicio1Controller = TextEditingController();
  TextEditingController dia5Ejercicio2Controller = TextEditingController();
  TextEditingController dia5Ejercicio3Controller = TextEditingController();
  TextEditingController dia5Ejercicio4Controller = TextEditingController();
  TextEditingController dia5Ejercicio5Controller = TextEditingController();

  String dia1Titulo1Text = 'Día 1, título 1';
  String dia2Titulo1Text = 'Día 2, título 1';
  String dia3Titulo1Text = 'Día 3, título 1';
  String dia4Titulo1Text = 'Día 4, título 1';
  String dia5Titulo1Text = 'Día 5, título 1';

  String dia1Titulo2Text = 'Día 1, título 2';
  String dia2Titulo2Text = 'Día 2, título 2';
  String dia3Titulo2Text = 'Día 3, título 2';
  String dia4Titulo2Text = 'Día 4, título 2';
  String dia5Titulo2Text = 'Día 5, título 2';

  String dia1Ejercicio1Text = 'Día 1, ejercicio 1';
  String dia1Ejercicio2Text = 'Día 1, ejercicio 2';
  String dia1Ejercicio3Text = 'Día 1, ejercicio 3';
  String dia1Ejercicio4Text = 'Día 1, ejercicio 4';
  String dia1Ejercicio5Text = 'Día 1, ejercicio 5';
  String dia1Ejercicio6Text = 'Día 1, ejercicio 6';
  String dia1Ejercicio7Text = 'Día 1, ejercicio 7';
  String dia1Ejercicio8Text = 'Día 1, ejercicio 8';

  String dia2Ejercicio1Text = 'Día 2, ejercicio 1';
  String dia2Ejercicio2Text = 'Día 2, ejercicio 2';
  String dia2Ejercicio3Text = 'Día 2, ejercicio 3';
  String dia2Ejercicio4Text = 'Día 2, ejercicio 4';
  String dia2Ejercicio5Text = 'Día 2, ejercicio 5';

  String dia3Ejercicio1Text = 'Día 3, ejercicio 1';
  String dia3Ejercicio2Text = 'Día 3, ejercicio 2';
  String dia3Ejercicio3Text = 'Día 3, ejercicio 3';
  String dia3Ejercicio4Text = 'Día 3, ejercicio 4';
  String dia3Ejercicio5Text = 'Día 3, ejercicio 5';

  String dia4Ejercicio1Text = 'Día 4, ejercicio 1';
  String dia4Ejercicio2Text = 'Día 4, ejercicio 2';
  String dia4Ejercicio3Text = 'Día 4, ejercicio 3';
  String dia4Ejercicio4Text = 'Día 4, ejercicio 4';
  String dia4Ejercicio5Text = 'Día 4, ejercicio 5';
  String dia4Ejercicio6Text = 'Día 4, ejercicio 6';
  String dia4Ejercicio7Text = 'Día 4, ejercicio 7';
  String dia4Ejercicio8Text = 'Día 4, ejercicio 8';

  String dia5Ejercicio1Text = 'Día 5, ejercicio 1';
  String dia5Ejercicio2Text = 'Día 5, ejercicio 2';
  String dia5Ejercicio3Text = 'Día 5, ejercicio 3';
  String dia5Ejercicio4Text = 'Día 5, ejercicio 4';
  String dia5Ejercicio5Text = 'Día 5, ejercicio 5';

  // Future? RutinaStream;
  // The5DiasModel? the5dias;

  // getOnTheLoad() async {
  //   RutinaStream = await DataBaseMethods().getRutinas2();
  // }

  List<Container> cards = [
    Container(
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.blue),
      child: Text('card 1'),
    ),
    Container(
      width: double.infinity,
      child: Text('Card2'),
      decoration: BoxDecoration(color: Colors.amber),
    )
  ];

  @override
  void initState() {
    super.initState();
    // getOnTheLoad();
    // get5dias();
  }

  // Future<void> get5dias() async {
  //   final response = await Dio()
  //       .get('https://65eb7ba243ce16418933eaa1.mockapi.io/Rutinas/5Dias/1');

  //   the5dias = The5DiasModel.fromJson(response.data);

  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    final titleStyleLarge = Theme.of(context).textTheme.titleLarge;

    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed: () => context.push('/'), icon: Icon(Icons.arrow_back)),
                  Container(
                    child: Row(
                      children: [
                        Text(
                          'Rutina de ',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          '5 días',
                          style: TextStyle(
                              fontSize: 32,
                              color: colors.primary,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Image.asset('assets/logo.png', fit: BoxFit.cover,height: 50,)
                ],
              ),
              const Text(
                  'Recuerda realizar esta rutina con los descansos pertinentes, no te fuerces'),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: FutureBuilder(
                  future: FirebaseFirestore.instance
                      .collection('Rutinas')
                      .doc('5Dias')
                      .get(),
                  builder: (context, snapshot) {
                    final rutinaData = snapshot.data?.data();
                    return !snapshot.hasData
                        ? const CircularProgressIndicator()
                        : SizedBox(
                            height: 60,
                            child: PageView(
                              children: [
                                SizedBox(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Flexible(
                                        child: CardSwiper(
                                          cardBuilder: (context,
                                              index,
                                              horizontalOffsetPercentage,
                                              verticalOffsetPercentage) {
                                            List<Container> cards = [
                                              Container(
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.black,
                                                        width: 2),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                12)),
                                                    color: Color.fromARGB(
                                                        255, 255, 66, 66)),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            rutinaData?[
                                                                'Dia1_Titulo1'],
                                                            style:
                                                                titleStyleLarge,
                                                          ),
                                                        ],
                                                      ),
                                                      Text(rutinaData?[
                                                          'Dia1_Ejercicio1']),
                                                      Text(rutinaData?[
                                                          'Dia1_Ejercicio2']),
                                                      Text(rutinaData?[
                                                          'Dia1_Ejercicio3']),
                                                      Text(rutinaData?[
                                                          'Dia1_Ejercicio4']),
                                                      Text(rutinaData?[
                                                          'Dia1_Ejercicio5']),
                                                      SizedBox(
                                                        height: 20,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            rutinaData?[
                                                                'Dia1_Titulo2'],
                                                            style:
                                                                titleStyleLarge,
                                                          ),
                                                        ],
                                                      ),
                                                      Text(rutinaData?[
                                                          'Dia1_Ejercicio6']),
                                                      Text(rutinaData?[
                                                          'Dia1_Ejercicio7']),
                                                      Text(rutinaData?[
                                                          'Dia1_Ejercicio8']),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.black,
                                                        width: 2),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                12)),
                                                    color: const Color.fromARGB(
                                                        255, 199, 199, 199)),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            rutinaData?[
                                                                'Dia2_Titulo1'],
                                                            style:
                                                                titleStyleLarge,
                                                          ),
                                                        ],
                                                      ),
                                                      Text(rutinaData?[
                                                          'Dia2_Ejercicio1']),
                                                      Text(rutinaData?[
                                                          'Dia2_Ejercicio2']),
                                                      Text(rutinaData?[
                                                          'Dia2_Ejercicio3']),
                                                      Text(rutinaData?[
                                                          'Dia2_Ejercicio4']),
                                                      Text(rutinaData?[
                                                          'Dia2_Ejercicio5']),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.black,
                                                        width: 2),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                12)),
                                                    color: Color.fromARGB(
                                                        255, 87, 49, 255)),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            rutinaData?[
                                                                'Dia3_Titulo1'],
                                                            style:
                                                                titleStyleLarge,
                                                          ),
                                                        ],
                                                      ),
                                                      Text(rutinaData?[
                                                          'Dia3_Ejercicio1']),
                                                      Text(rutinaData?[
                                                          'Dia3_Ejercicio2']),
                                                      Text(rutinaData?[
                                                          'Dia3_Ejercicio3']),
                                                      Text(rutinaData?[
                                                          'Dia3_Ejercicio4']),
                                                      Text(rutinaData?[
                                                          'Dia3_Ejercicio5']),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.black,
                                                        width: 2),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                12)),
                                                    color: Color.fromARGB(
                                                        255, 66, 224, 255)),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            rutinaData?[
                                                                'Dia4_Titulo1'],
                                                            style:
                                                                titleStyleLarge,
                                                          ),
                                                        ],
                                                      ),
                                                      Text(rutinaData?[
                                                          'Dia4_Ejercicio1']),
                                                      Text(rutinaData?[
                                                          'Dia4_Ejercicio2']),
                                                      Text(rutinaData?[
                                                          'Dia4_Ejercicio3']),
                                                      Text(rutinaData?[
                                                          'Dia4_Ejercicio4']),
                                                      Text(rutinaData?[
                                                          'Dia4_Ejercicio5']),
                                                      SizedBox(
                                                        height: 20,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            rutinaData?[
                                                                'Dia1_Titulo2'],
                                                            style:
                                                                titleStyleLarge,
                                                          ),
                                                        ],
                                                      ),
                                                      Text(rutinaData?[
                                                          'Dia4_Ejercicio6']),
                                                      Text(rutinaData?[
                                                          'Dia4_Ejercicio7']),
                                                      Text(rutinaData?[
                                                          'Dia4_Ejercicio8']),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.black,
                                                        width: 2),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                12)),
                                                    color: Color.fromARGB(
                                                        255, 181, 255, 33)),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            rutinaData?[
                                                                'Dia5_Titulo1'],
                                                            style:
                                                                titleStyleLarge,
                                                          ),
                                                        ],
                                                      ),
                                                      Text(rutinaData?[
                                                          'Dia5_Ejercicio1']),
                                                      Text(rutinaData?[
                                                          'Dia5_Ejercicio2']),
                                                      Text(rutinaData?[
                                                          'Dia5_Ejercicio3']),
                                                      Text(rutinaData?[
                                                          'Dia5_Ejercicio4']),
                                                      Text(rutinaData?[
                                                          'Dia5_Ejercicio5']),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ];
                                            return cards[index];
                                          },
                                          cardsCount: 5,
                                        ),
                                      ),
                                      prefs.isAdmin
                                          ? Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                OutlinedButton(
                                                  onPressed: () {
                                                    dia1Titulo1Controller.text =
                                                        rutinaData?[
                                                            'Dia1_Titulo1'];
                                                    dia2Titulo1Controller.text =
                                                        rutinaData?[
                                                            'Dia2_Titulo1'];
                                                    dia3Titulo1Controller.text =
                                                        rutinaData?[
                                                            'Dia3_Titulo1'];
                                                    dia4Titulo1Controller.text =
                                                        rutinaData?[
                                                            'Dia4_Titulo1'];
                                                    dia5Titulo1Controller.text =
                                                        rutinaData?[
                                                            'Dia5_Titulo1'];

                                                    dia1Titulo2Controller.text =
                                                        rutinaData?[
                                                            'Dia1_Titulo2'];
                                                    dia1Ejercicio1Controller
                                                            .text =
                                                        rutinaData?[
                                                            'Dia1_Ejercicio1'];
                                                    dia1Ejercicio2Controller
                                                            .text =
                                                        rutinaData?[
                                                            'Dia1_Ejercicio2'];
                                                    dia1Ejercicio3Controller
                                                            .text =
                                                        rutinaData?[
                                                            'Dia1_Ejercicio3'];
                                                    dia1Ejercicio4Controller
                                                            .text =
                                                        rutinaData?[
                                                            'Dia1_Ejercicio4'];
                                                    dia1Ejercicio5Controller
                                                            .text =
                                                        rutinaData?[
                                                            'Dia1_Ejercicio5'];
                                                    dia1Ejercicio6Controller
                                                            .text =
                                                        rutinaData?[
                                                            'Dia1_Ejercicio6'];
                                                    dia1Ejercicio7Controller
                                                            .text =
                                                        rutinaData?[
                                                            'Dia1_Ejercicio7'];
                                                    dia1Ejercicio8Controller
                                                            .text =
                                                        rutinaData?[
                                                            'Dia1_Ejercicio8'];

                                                    dia2Ejercicio1Controller
                                                            .text =
                                                        rutinaData?[
                                                            'Dia2_Ejercicio1'];
                                                    dia2Ejercicio2Controller
                                                            .text =
                                                        rutinaData?[
                                                            'Dia2_Ejercicio2'];
                                                    dia2Ejercicio3Controller
                                                            .text =
                                                        rutinaData?[
                                                            'Dia2_Ejercicio3'];
                                                    dia2Ejercicio4Controller
                                                            .text =
                                                        rutinaData?[
                                                            'Dia2_Ejercicio4'];
                                                    dia2Ejercicio5Controller
                                                            .text =
                                                        rutinaData?[
                                                            'Dia2_Ejercicio5'];

                                                    dia3Ejercicio1Controller
                                                            .text =
                                                        rutinaData?[
                                                            'Dia3_Ejercicio1'];
                                                    dia3Ejercicio2Controller
                                                            .text =
                                                        rutinaData?[
                                                            'Dia3_Ejercicio2'];
                                                    dia3Ejercicio3Controller
                                                            .text =
                                                        rutinaData?[
                                                            'Dia3_Ejercicio3'];
                                                    dia3Ejercicio4Controller
                                                            .text =
                                                        rutinaData?[
                                                            'Dia3_Ejercicio4'];
                                                    dia3Ejercicio5Controller
                                                            .text =
                                                        rutinaData?[
                                                            'Dia3_Ejercicio5'];

                                                    dia4Ejercicio1Controller
                                                            .text =
                                                        rutinaData?[
                                                            'Dia4_Ejercicio1'];
                                                    dia4Ejercicio2Controller
                                                            .text =
                                                        rutinaData?[
                                                            'Dia4_Ejercicio2'];
                                                    dia4Ejercicio3Controller
                                                            .text =
                                                        rutinaData?[
                                                            'Dia4_Ejercicio3'];
                                                    dia4Ejercicio4Controller
                                                            .text =
                                                        rutinaData?[
                                                            'Dia4_Ejercicio4'];
                                                    dia4Ejercicio5Controller
                                                            .text =
                                                        rutinaData?[
                                                            'Dia4_Ejercicio5'];
                                                    dia4Ejercicio6Controller
                                                            .text =
                                                        rutinaData?[
                                                            'Dia4_Ejercicio6'];
                                                    dia4Ejercicio7Controller
                                                            .text =
                                                        rutinaData?[
                                                            'Dia4_Ejercicio7'];
                                                    dia4Ejercicio8Controller
                                                            .text =
                                                        rutinaData?[
                                                            'Dia4_Ejercicio8'];

                                                    dia5Ejercicio1Controller
                                                            .text =
                                                        rutinaData?[
                                                            'Dia5_Ejercicio1'];
                                                    dia5Ejercicio2Controller
                                                            .text =
                                                        rutinaData?[
                                                            'Dia5_Ejercicio2'];
                                                    dia5Ejercicio3Controller
                                                            .text =
                                                        rutinaData?[
                                                            'Dia5_Ejercicio3'];
                                                    dia5Ejercicio4Controller
                                                            .text =
                                                        rutinaData?[
                                                            'Dia5_Ejercicio4'];
                                                    dia5Ejercicio5Controller
                                                            .text =
                                                        rutinaData?[
                                                            'Dia5_Ejercicio5'];
                                                    editRutina('1');
                                                  },
                                                  child: const Text(
                                                      'Editar rutina'),
                                                ),
                                              ],
                                            )
                                          : const SizedBox()
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                  },
                ),
              )
              // Expanded(
              //   child: FutureBuilder(
              //     future: FirebaseFirestore.instance.collection('Rutinas').doc('5Dias').get(),
              //     builder: (context, snapshot) {
              //       print(snapshot.data);
              //       return !snapshot.hasData
              //           ? CircularProgressIndicator()
              //           : ListView.builder(
              //               itemCount: snapshot.data?.data.length,
              //               itemBuilder: (context, index) {
              //                 DocumentSnapshot userSnapshot =
              //                     snapshot.data.docs[index];
              //                 return Container(
              //                   margin: EdgeInsets.all(4),
              //                   width: double.infinity,
              //                   decoration: BoxDecoration(
              //                       border: Border.all(color: Colors.red)),
              //                   child: Padding(
              //                     padding: const EdgeInsets.all(8.0),
              //                     child: Column(
              //                       children: [
              //                         Container(
              //                           child: Row(
              //                             children: [
              //                               Text(userSnapshot['Dia1_Titulo1']),
              //                               GestureDetector(
              //                                 child: Icon(Icons.edit),
              //                               )
              //                             ],
              //                           ),
              //                         ),
              //                         Text(userSnapshot['Dia1_Ejercicio1']),
              //                       ],
              //                     ),
              //                   ),
              //                 );
              //               },
              //             );
              //     },
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }

  Future editRutina(String id) => showDialog(
        context: context,
        builder: (context) {
          final colors = Theme.of(context).colorScheme;
          return AlertDialog(
            scrollable: true,
            content: Column(
              children: [
                const Text(
                  'Rutina de los 5 días',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'MODO EDICIÓN',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: colors.primary),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // Día 1
                    _TextAndTextField(
                        textTitle: dia1Titulo1Text,
                        controllerTextField: dia1Titulo1Controller),
                    _TextAndTextField(
                      textTitle: dia1Ejercicio1Text,
                      controllerTextField: dia1Ejercicio1Controller,
                    ),
                    _TextAndTextField(
                      textTitle: dia1Ejercicio2Text,
                      controllerTextField: dia1Ejercicio2Controller,
                    ),
                    _TextAndTextField(
                      textTitle: dia1Ejercicio3Text,
                      controllerTextField: dia1Ejercicio3Controller,
                    ),
                    _TextAndTextField(
                      textTitle: dia1Ejercicio4Text,
                      controllerTextField: dia1Ejercicio4Controller,
                    ),
                    _TextAndTextField(
                      textTitle: dia1Ejercicio5Text,
                      controllerTextField: dia1Ejercicio5Controller,
                    ),
                    _TextAndTextField(
                        textTitle: dia1Titulo2Text,
                        controllerTextField: dia1Titulo2Controller),
                    _TextAndTextField(
                      textTitle: dia1Ejercicio6Text,
                      controllerTextField: dia1Ejercicio6Controller,
                    ),
                    _TextAndTextField(
                      textTitle: dia1Ejercicio7Text,
                      controllerTextField: dia1Ejercicio7Controller,
                    ),
                    _TextAndTextField(
                      textTitle: dia1Ejercicio8Text,
                      controllerTextField: dia1Ejercicio8Controller,
                    ),
                    //Día 2
                    _TextAndTextField(
                        textTitle: dia2Titulo1Text,
                        controllerTextField: dia2Titulo1Controller),
                    _TextAndTextField(
                      textTitle: dia2Ejercicio1Text,
                      controllerTextField: dia2Ejercicio1Controller,
                    ),
                    _TextAndTextField(
                      textTitle: dia2Ejercicio2Text,
                      controllerTextField: dia2Ejercicio2Controller,
                    ),
                    _TextAndTextField(
                      textTitle: dia2Ejercicio3Text,
                      controllerTextField: dia2Ejercicio3Controller,
                    ),
                    _TextAndTextField(
                      textTitle: dia2Ejercicio4Text,
                      controllerTextField: dia2Ejercicio4Controller,
                    ),
                    _TextAndTextField(
                      textTitle: dia2Ejercicio5Text,
                      controllerTextField: dia2Ejercicio5Controller,
                    ),
                    // Día 3
                    _TextAndTextField(
                        textTitle: dia3Titulo1Text,
                        controllerTextField: dia3Titulo1Controller),
                    _TextAndTextField(
                      textTitle: dia3Ejercicio1Text,
                      controllerTextField: dia3Ejercicio1Controller,
                    ),
                    _TextAndTextField(
                      textTitle: dia3Ejercicio2Text,
                      controllerTextField: dia3Ejercicio2Controller,
                    ),
                    _TextAndTextField(
                      textTitle: dia3Ejercicio3Text,
                      controllerTextField: dia3Ejercicio3Controller,
                    ),
                    _TextAndTextField(
                      textTitle: dia3Ejercicio4Text,
                      controllerTextField: dia3Ejercicio4Controller,
                    ),
                    _TextAndTextField(
                      textTitle: dia3Ejercicio5Text,
                      controllerTextField: dia3Ejercicio5Controller,
                    ),
                    // Día 4
                    _TextAndTextField(
                        textTitle: dia4Titulo1Text,
                        controllerTextField: dia4Titulo1Controller),
                    _TextAndTextField(
                      textTitle: dia4Ejercicio1Text,
                      controllerTextField: dia4Ejercicio1Controller,
                    ),
                    _TextAndTextField(
                      textTitle: dia4Ejercicio2Text,
                      controllerTextField: dia4Ejercicio2Controller,
                    ),
                    _TextAndTextField(
                      textTitle: dia4Ejercicio3Text,
                      controllerTextField: dia4Ejercicio3Controller,
                    ),
                    _TextAndTextField(
                      textTitle: dia4Ejercicio4Text,
                      controllerTextField: dia4Ejercicio4Controller,
                    ),
                    _TextAndTextField(
                      textTitle: dia4Ejercicio5Text,
                      controllerTextField: dia4Ejercicio5Controller,
                    ),
                    _TextAndTextField(
                      textTitle: dia4Ejercicio6Text,
                      controllerTextField: dia4Ejercicio6Controller,
                    ),
                    _TextAndTextField(
                      textTitle: dia4Ejercicio7Text,
                      controllerTextField: dia4Ejercicio7Controller,
                    ),
                    _TextAndTextField(
                      textTitle: dia4Ejercicio8Text,
                      controllerTextField: dia4Ejercicio8Controller,
                    ),
                    // Día 5
                    _TextAndTextField(
                        textTitle: dia5Titulo1Text,
                        controllerTextField: dia5Titulo1Controller),
                    _TextAndTextField(
                      textTitle: dia5Ejercicio1Text,
                      controllerTextField: dia5Ejercicio1Controller,
                    ),
                    _TextAndTextField(
                      textTitle: dia5Ejercicio2Text,
                      controllerTextField: dia5Ejercicio2Controller,
                    ),
                    _TextAndTextField(
                      textTitle: dia5Ejercicio3Text,
                      controllerTextField: dia5Ejercicio3Controller,
                    ),
                    _TextAndTextField(
                      textTitle: dia5Ejercicio4Text,
                      controllerTextField: dia5Ejercicio4Controller,
                    ),
                    _TextAndTextField(
                      textTitle: dia5Ejercicio5Text,
                      controllerTextField: dia5Ejercicio5Controller,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FilledButton(
                            onPressed: () async {
                              Map<String, dynamic> updateRutina5Dias = {
                                'Dia1_Titulo1': dia1Titulo1Controller.text,
                                'Dia1_Ejercicio1':
                                    dia1Ejercicio1Controller.text,
                                'Dia1_Ejercicio2':
                                    dia1Ejercicio2Controller.text,
                                'Dia1_Ejercicio3':
                                    dia1Ejercicio3Controller.text,
                                'Dia1_Ejercicio4':
                                    dia1Ejercicio4Controller.text,
                                'Dia1_Ejercicio5':
                                    dia1Ejercicio5Controller.text,
                                'Dia1_Titulo2': dia1Titulo2Controller.text,
                                'Dia1_Ejercicio6':
                                    dia1Ejercicio6Controller.text,
                                'Dia1_Ejercicio7':
                                    dia1Ejercicio7Controller.text,
                                'Dia1_Ejercicio8':
                                    dia1Ejercicio8Controller.text,
                                'Dia2_Titulo1': dia2Titulo1Controller.text,
                                'Dia2_Ejercicio1':
                                    dia2Ejercicio1Controller.text,
                                'Dia2_Ejercicio2':
                                    dia2Ejercicio2Controller.text,
                                'Dia2_Ejercicio3':
                                    dia2Ejercicio3Controller.text,
                                'Dia2_Ejercicio4':
                                    dia2Ejercicio4Controller.text,
                                'Dia2_Ejercicio5':
                                    dia2Ejercicio5Controller.text,
                                'Dia3_Titulo1': dia3Titulo1Controller.text,
                                'Dia3_Ejercicio1':
                                    dia3Ejercicio1Controller.text,
                                'Dia3_Ejercicio2':
                                    dia3Ejercicio2Controller.text,
                                'Dia3_Ejercicio3':
                                    dia3Ejercicio3Controller.text,
                                'Dia3_Ejercicio4':
                                    dia3Ejercicio4Controller.text,
                                'Dia3_Ejercicio5':
                                    dia3Ejercicio5Controller.text,
                                'Dia4_Titulo1': dia4Titulo1Controller.text,
                                'Dia4_Ejercicio1':
                                    dia4Ejercicio1Controller.text,
                                'Dia4_Ejercicio2':
                                    dia4Ejercicio2Controller.text,
                                'Dia4_Ejercicio3':
                                    dia4Ejercicio3Controller.text,
                                'Dia4_Ejercicio4':
                                    dia4Ejercicio4Controller.text,
                                'Dia4_Ejercicio5':
                                    dia4Ejercicio5Controller.text,
                                'Dia4_Ejercicio6':
                                    dia4Ejercicio6Controller.text,
                                'Dia4_Ejercicio7':
                                    dia4Ejercicio7Controller.text,
                                'Dia4_Ejercicio8':
                                    dia4Ejercicio8Controller.text,
                                'Dia5_Titulo1': dia5Titulo1Controller.text,
                                'Dia5_Ejercicio1':
                                    dia5Ejercicio1Controller.text,
                                'Dia5_Ejercicio2':
                                    dia5Ejercicio2Controller.text,
                                'Dia5_Ejercicio3':
                                    dia5Ejercicio3Controller.text,
                                'Dia5_Ejercicio4':
                                    dia5Ejercicio4Controller.text,
                                'Dia5_Ejercicio5':
                                    dia5Ejercicio5Controller.text,
                              };

                              await DataBaseMethods()
                                  .updateRutina5Dias(updateRutina5Dias)
                                  .then((value) => context.pop());
                              setState(() {});
                            },
                            child: const Text('Actualizar rutina')),
                      ],
                    )
                  ],
                )
              ],
            ),
          );
        },
      );
}

class _TextAndTextField extends StatelessWidget {
  const _TextAndTextField({
    super.key,
    required this.textTitle,
    required this.controllerTextField,
  });

  final String textTitle;
  final TextEditingController controllerTextField;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          Text(
            textTitle,
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 4,
          ),
          TextField(
            controller: controllerTextField,
            decoration: const InputDecoration(border: OutlineInputBorder()),
          ),
        ],
      ),
    );
  }
}
