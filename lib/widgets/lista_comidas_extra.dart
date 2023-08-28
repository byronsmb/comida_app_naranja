import 'package:comida_app_naranja/data/datos_ficticios.dart';
import 'package:flutter/material.dart';

class ListaComidasExtra extends StatelessWidget {
  const ListaComidasExtra({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.35, //0.35

        //color: Colors.amber,
        child: ListView.builder(
          itemCount: comidaextraDisponible.length,
          itemBuilder: (context, index) {
            return Container(
              height: 130,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              //color: Colors.amber,
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: 115,
                      width: 115,
                      child: Hero(
                        tag: comidaextraDisponible[index].id,
                        child: Image.asset(
                          comidaextraDisponible[index].imagenUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.06),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.52,
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            comidaextraDisponible[index].nombre,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(height: 7),
                        Text(
                          comidaextraDisponible[index].descripcion,
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 7),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '\$${comidaextraDisponible[index].precio}',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge!
                                    .copyWith(
                                      color: Color.fromARGB(255, 252, 74, 4),
                                      fontWeight: FontWeight.bold,
                                    ),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                              InkWell(
                                onTap: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: const Text('Alimento agregado.'),
                                      action: SnackBarAction(
                                        label: 'Deshacer',
                                        onPressed: () {},
                                      ),
                                      backgroundColor:
                                          const Color.fromARGB(255, 160, 53, 11)
                                              .withOpacity(0.8),
                                    ),
                                  );
                                },
                                child: const Icon(Icons.add_box_rounded),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ));
  }
}
