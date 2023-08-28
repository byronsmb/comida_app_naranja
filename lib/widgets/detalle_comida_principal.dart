import 'package:comida_app_naranja/models/comida.dart';
import 'package:flutter/material.dart';

class DetalleComidaPrincipal extends StatelessWidget {
  const DetalleComidaPrincipal({super.key, required this.comidaActual});
  final Comida comidaActual;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.35, //0.35,

      //color: Colors.red,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              child: Text(
                comidaActual.nombre.toUpperCase(),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      color: const Color.fromARGB(255, 49, 38, 16),
                      //fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Text(
              'Solamente hoy, esta comida ofrece...',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Color.fromARGB(255, 139, 138, 138),
                    //fontSize: 35,
                  ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 18),
            Container(
              width: 120,
              height: 40,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color.fromARGB(255, 236, 146, 21),
                        Color.fromARGB(255, 252, 74, 4),
                      ])),
              child: Container(
                width: 116,
                height: 36,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  color: Colors.white,
                ),
                alignment: Alignment.center,
                child: Text(
                  '\$${comidaActual.precio}',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: const Color.fromARGB(255, 252, 74, 4),
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: 18),
            Container(
              //color: Colors.red,
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.16,
              child: Text(
                comidaActual.descripcion,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: const Color.fromARGB(255, 139, 138, 138),
                      //fontSize: 35,
                    ),
                textAlign: TextAlign.center,
                maxLines: 7,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            //SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          ],
        ),
      ),

      ///
      ///
    );
  }
}
