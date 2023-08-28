import 'package:uuid/uuid.dart';

var uuid = Uuid();

class ComidaComplementaria {
  ComidaComplementaria({
    required this.imagenUrl,
    required this.nombre,
    required this.descripcion,
    required this.precio,
  }) : id = uuid.v4();

  final String id;
  final String imagenUrl;
  final String nombre;
  final String descripcion;
  final double precio;
}
