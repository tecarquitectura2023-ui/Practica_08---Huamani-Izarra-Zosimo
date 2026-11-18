
class PromedioController {
// metodo calcularPromedio
  double calcularPromedio(
    double nota1,
    double nota2,
    double nota3,
  ) {
    return (nota1 + nota2 + nota3) / 3;
  }
  // metodo para obtenerEstado
  String obtenerEstado(double promedio) {
    if (promedio >= 13) {
      return 'Aprobado';
    } else {
      return 'Desaprobado';
    }
  }
}
