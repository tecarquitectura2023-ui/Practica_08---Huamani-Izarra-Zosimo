class PagoController {

  double calcularSueldo(double horas, double pagoHora) {
    double sueldo;

    if (horas <= 48) {
      sueldo = horas * pagoHora;
    } else {
      double horasNormales = 48;
      double horasExtras = horas - 48;

      sueldo = (horasNormales * pagoHora) +
          (horasExtras * pagoHora * 1.5);
    }

    return sueldo;
  }
}
