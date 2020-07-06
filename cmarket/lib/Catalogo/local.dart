class Local {
  
  Local(String nombreLocal, String nombreBarrio, String horario,
      String telefono, String direccion, String lineaComercial, String descripcion, 
  String parqueadero,
  String servicioDomicilo,
  String tarjetaCredito) {
    this.nombreLocal = nombreLocal;
    this.nombreBarrio = nombreBarrio;
    this.direccion = direccion;
    this.horario = horario;
    this.telefono = telefono;
    this.lineaComercial = lineaComercial;
    this.descripcion = descripcion;
    this.parqueadero = parqueadero;
    this.servicioDomicilo = servicioDomicilo;
    this.tarjetaCredito = tarjetaCredito;
  }

  String nombreLocal;
  String nombreBarrio;
  String horario;
  String telefono;
  String direccion;
  String lineaComercial;
  String descripcion;
  String parqueadero;
  String servicioDomicilo;
  String tarjetaCredito;
}
