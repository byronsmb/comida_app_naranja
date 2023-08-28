import 'package:comida_app_naranja/models/comida.dart';
import 'package:comida_app_naranja/widgets/detalle_comida_principal.dart';
import 'package:comida_app_naranja/widgets/lista_comidas_extra.dart';
import 'package:comida_app_naranja/widgets/myBottomNavigation.dart';
import 'package:flutter/material.dart';

class DetalleComida extends StatefulWidget {
  DetalleComida(
      {super.key, required this.comidaActual, required this.currentIndex});
  final Comida comidaActual;
  int currentIndex;

  @override
  State<DetalleComida> createState() => _DetalleComidaState();
}

class _DetalleComidaState extends State<DetalleComida> {
  late Widget descripcionSeleccionada;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    descripcionSeleccionada =
        DetalleComidaPrincipal(comidaActual: widget.comidaActual);
  }

  void _showDialog(BuildContext context) {
    // flutter defined function
    showDialog(
      context: context,
      //context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: const Text("Acompañantes"),
          content: const Text(
              "¿Desea agregar algún alimento acompañante a su comida?"),
          actions: [
            // usually buttons at the bottom of the dialog
            TextButton(
              child: const Text(
                "CANCELAR",
                style: TextStyle(
                  color: Color.fromARGB(255, 252, 74, 4),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                _showMessage();
              },
            ),
            TextButton(
              child: const Text(
                "ACEPTAR",
                style: TextStyle(
                  color: Color.fromARGB(255, 252, 74, 4),
                ),
              ),
              onPressed: () {
                setState(() {
                  descripcionSeleccionada = ListaComidasExtra();
                  Navigator.of(context).pop();
                });
              },
            ),
          ],
        );
      },
    );
  }

  void _showMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Agregado al carrito'),
        backgroundColor: Color.fromARGB(255, 252, 74, 4).withOpacity(0.3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 229, 229, 229),
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(50),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(25),
                    child: Hero(
                      tag: widget.comidaActual.id,
                      child: Image.asset(widget.comidaActual.imagenUrl),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 6, top: 6),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back),
                  ),
                ),
              ],
            ),
            SizedBox(height: 18),
            Container(
              width: 100,
              height: 10,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 236, 146, 21),
                    Color.fromARGB(255, 252, 74, 4),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 13),
            descripcionSeleccionada,
            ElevatedButton(
              onPressed: () {
                if (descripcionSeleccionada.runtimeType ==
                    ListaComidasExtra().runtimeType)
                  _showMessage();
                else
                  _showDialog(context);
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  const Color.fromARGB(255, 252, 74, 4),
                ),
              ),
              child: Text(
                'Order Now',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar:
          MyBottomNavigation(currentIndex: widget.currentIndex),
    );
  }
}
