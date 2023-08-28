import 'package:comida_app_naranja/data/datos_ficticios.dart';
import 'package:comida_app_naranja/models/comida.dart';
import 'package:comida_app_naranja/screens/detalle_comida.dart';
import 'package:comida_app_naranja/widgets/myBottomNavigation.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final int _currentIndex = 0;
  void _cambiarPantalla(Comida comida, int currentIndex) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => DetalleComida(
                comidaActual: comida,
                currentIndex: currentIndex,
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Comida> nuevaComida =
        comidaDisponible.sublist(comidaDisponible.length - 3);
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.more_vert),
                  Icon(Icons.vertical_distribute_sharp),
                ],
              ),
            ),
            Text(
              'Food Menu',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: const Color.fromARGB(255, 231, 76, 20),
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    decoration: TextDecoration.underline,
                    decorationColor: const Color.fromARGB(255, 231, 76, 20),
                  ),
            ),
            Text(
              'Elige tu mejor comida que tengas un buen día',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Colors.black54,
                    //fontWeight: FontWeight.bold,
                    //fontSize: 40,
                  ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              child: ListView.builder(
                itemCount: comidaDisponible.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        _cambiarPantalla(
                            comidaDisponible[index], _currentIndex);
                      },
                      child: Stack(children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color.fromARGB(255, 236, 146, 21),
                                Color.fromARGB(255, 252, 74, 4),
                              ],
                            ),
                          ),
                          //height: MediaQuery.of(context).size.height * 0.3,
                          width: MediaQuery.of(context).size.width * 0.45,
                          child: Center(
                            child: Hero(
                              tag: comidaDisponible[index].id,
                              child: Image.asset(
                                  comidaDisponible[index].imagenUrl),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 5,
                          child: Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            width: MediaQuery.of(context).size.width * 0.45,
                            child: Text(
                              comidaDisponible[index].nombre,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        )
                      ]),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Mas.. ',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: const Color.fromARGB(255, 49, 38, 16),
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                      ),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              child: ListView.builder(
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      _cambiarPantalla(nuevaComida[index], _currentIndex);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(9.0),
                      child: Container(
                        color: const Color.fromARGB(255, 229, 229, 229),
                        //height: MediaQuery.of(context).size.height * 0.3,
                        width: MediaQuery.of(context).size.width * 0.45,
                        child: Stack(
                          children: [
                            Center(
                              child: Hero(
                                tag: nuevaComida[index].id,
                                child:
                                    Image.asset(nuevaComida[index].imagenUrl),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topCenter,
                              child: Container(
                                height: 22,
                                width: 80,
                                alignment: Alignment.center,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.vertical(
                                    bottom: Radius.circular(5),
                                  ),
                                  color: Color.fromARGB(255, 231, 76, 20),
                                ),
                                child: const Text(
                                  'NUEVO',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 5,
                              child: Container(
                                //color: Colors.amber,
                                alignment: Alignment.center,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                width: MediaQuery.of(context).size.width * 0.45,
                                child: Text(
                                  nuevaComida[index].nombre,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                        color: const Color.fromARGB(
                                            255, 49, 38, 16),
                                        fontSize: 12,
                                      ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: MyBottomNavigation(
        currentIndex: _currentIndex,
      ),
    );
  }
}
