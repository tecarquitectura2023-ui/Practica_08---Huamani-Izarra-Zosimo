
class DescuentoController {

  double calcularDescuento(double precio, double porcentaje) {
    return precio * (porcentaje / 100);
  }

  double calcularPrecioFinal(double precio, double porcentaje) {
    double descuento = calcularDescuento(precio, porcentaje);
    return precio - descuento;
  }

  String obtenerTipoDescuento(double porcentaje) {
    if (porcentaje >= 20) {
      return 'Descuento especial';
    } else {
      return 'Descuento regular';
    }
  }
}
