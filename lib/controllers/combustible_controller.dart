class CombustibleController {

  double calcularRendimiento(double distancia, double litros) {
    return distancia / litros;
  }

  String obtenerEstado(double rendimiento) {
    if (rendimiento >= 15) {
      return 'Buen rendimiento';
    } else {
      return 'Rendimiento bajo';
    }
  }
}
