INSERT INTO `sistemarestaurante`.`camarero` (`idCamarero`, `dni`, `nombre`, `apellido`) VALUES ('1', '111111111', 'Matias', 'Torsello');
INSERT INTO `sistemarestaurante`.`camarero` (`idCamarero`, `dni`, `nombre`, `apellido`) VALUES ('2', '111111112', 'Juan Pablo', 'Federico');
INSERT INTO `sistemarestaurante`.`camarero` (`idCamarero`, `dni`, `nombre`, `apellido`) VALUES ('3', '111111113', 'Lucio', 'Trucco');
INSERT INTO `sistemarestaurante`.`camarero` (`idCamarero`, `dni`, `nombre`, `apellido`) VALUES ('4', '111111114', 'Ruben', 'Gomez');

INSERT INTO `sistemarestaurante`.`tipocliente` (`idTipoCliente`, `tipo`) VALUES ('1', 'Plata');
INSERT INTO `sistemarestaurante`.`tipocliente` (`idTipoCliente`, `tipo`) VALUES ('2', 'Oro');
INSERT INTO `sistemarestaurante`.`tipocliente` (`idTipoCliente`, `tipo`) VALUES ('3', 'Diamante');

INSERT INTO `sistemarestaurante`.`cliente` (`idCliente`, `idTipoCliente`, `dni`, `nombre`, `apellido`, `numHabitacion`) VALUES ('1', '1', '39276649', 'Matias', 'Torsello', '1');
INSERT INTO `sistemarestaurante`.`cliente` (`idCliente`, `idTipoCliente`, `dni`, `nombre`, `apellido`, `numHabitacion`) VALUES ('2', '1', '39872663', 'Lucio', 'Trucco', '2');
INSERT INTO `sistemarestaurante`.`cliente` (`idCliente`, `idTipoCliente`, `dni`, `nombre`, `apellido`, `numHabitacion`) VALUES ('3', '1', '38765890', 'Juan Pablo', 'Federico', '3');
INSERT INTO `sistemarestaurante`.`cliente` (`idCliente`, `idTipoCliente`, `dni`, `nombre`, `apellido`, `numHabitacion`) VALUES ('4', '1', '34567890', 'Nicolas', 'Gomez', '4');

INSERT INTO `sistemarestaurante`.`salon` (`idSalon`, `descripcion`) VALUES ('1', 'Comun');
INSERT INTO `sistemarestaurante`.`salon` (`idSalon`, `descripcion`) VALUES ('2', 'VIP');

INSERT INTO `sistemarestaurante`.`mesa` (`idMesa`, `idSalon`, `estadoMesa`, `nroMesa`) VALUES ('1', '1', '1', '1');
INSERT INTO `sistemarestaurante`.`mesa` (`idMesa`, `idSalon`, `estadoMesa`, `nroMesa`) VALUES ('2', '1', '1', '2');
INSERT INTO `sistemarestaurante`.`mesa` (`idMesa`, `idSalon`, `estadoMesa`, `nroMesa`) VALUES ('3', '1', '1', '3');
INSERT INTO `sistemarestaurante`.`mesa` (`idMesa`, `idSalon`, `estadoMesa`, `nroMesa`) VALUES ('4', '1', '1', '4');

INSERT INTO `sistemarestaurante`.`comanda` (`idComanda`, `idCliente`, `idCamarero`, `idMesa`, `fecha`, `activo`) VALUES ('1', '1', '1', '1', '2009-01-00', 1);
INSERT INTO `sistemarestaurante`.`comanda` (`idComanda`, `idCliente`, `idCamarero`, `idMesa`, `fecha`, `activo`) VALUES ('2', '2', '1', '2', '2009-01-00', 0);
INSERT INTO `sistemarestaurante`.`comanda` (`idComanda`, `idCliente`, `idCamarero`, `idMesa`, `fecha`, `activo`) VALUES ('3', '2', '1', '3', '2009-01-00', 1);

INSERT INTO `sistemarestaurante`.`conversion` (`idConversion`, `unidad`) VALUES ('1', 'Kg');
INSERT INTO `sistemarestaurante`.`conversion` (`idConversion`, `unidad`) VALUES ('2', 'Gr');
INSERT INTO `sistemarestaurante`.`conversion` (`idConversion`, `unidad`) VALUES ('3', 'L');
INSERT INTO `sistemarestaurante`.`conversion` (`idConversion`, `unidad`) VALUES ('4', 'Ml');

INSERT INTO `sistemarestaurante`.`ingrediente` (`nombre`, `descripcion`, `unidad`) VALUES ('Carne', 'carnes', 'kg');
INSERT INTO `sistemarestaurante`.`ingrediente` (`idIngrediente`, `nombre`, `descripcion`, `unidad`) VALUES ('2', 'Pollo', 'carnes', 'kg');
INSERT INTO `sistemarestaurante`.`ingrediente` (`idIngrediente`, `nombre`, `descripcion`, `unidad`) VALUES ('3', 'Tomate', 'verdura', 'kg');

INSERT INTO `sistemarestaurante`.`receta` (`idReceta`, `nombre`, `descripcion`) VALUES ('1', 'Milanesa con papas', 'Para compartir');
INSERT INTO `sistemarestaurante`.`receta` (`idReceta`, `nombre`, `descripcion`) VALUES ('2', 'Papas con cheddar', 'Para compartir');
INSERT INTO `sistemarestaurante`.`receta` (`idReceta`, `nombre`, `descripcion`) VALUES ('3', 'Carne al horno', 'Una persona');

INSERT INTO `sistemarestaurante`.`rubro` (`idRubro`, `descripcion`) VALUES ('1', 'Entrada');
INSERT INTO `sistemarestaurante`.`rubro` (`idRubro`, `descripcion`) VALUES ('2', 'Plato principal');
INSERT INTO `sistemarestaurante`.`rubro` (`idRubro`, `descripcion`) VALUES ('3', 'Postre');

INSERT INTO `sistemarestaurante`.`subrubro` (`idSubRubro`, `descripcion`) VALUES ('1', 'Bebida');
INSERT INTO `sistemarestaurante`.`subrubro` (`idSubRubro`, `descripcion`) VALUES ('2', 'Carnes');
INSERT INTO `sistemarestaurante`.`subrubro` (`idSubRubro`, `descripcion`) VALUES ('3', 'Pastas');

INSERT INTO `sistemarestaurante`.`producto` (`idProducto`, `idReceta`, `idRubro`, `idSubRubro`, `nombre`, `descripcion`, `habilitado`) VALUES ('1', '1', '1', '1', 'Cocacola', 'rica', 1);
INSERT INTO `sistemarestaurante`.`producto` (`idProducto`, `idReceta`, `idRubro`, `idSubRubro`, `nombre`, `descripcion`, `habilitado`) VALUES ('2', '1', '2', '2', 'Cosecha tardia', 'asco', 1);
INSERT INTO `sistemarestaurante`.`producto` (`idProducto`, `idReceta`, `idRubro`, `idSubRubro`, `nombre`, `descripcion`, `habilitado`) VALUES ('3', '1', '2', '3', 'Carne con papas', 'rico', 1);

INSERT INTO `sistemarestaurante`.`itemcomanda` (`idItemComanda`, `idComanda`, `idProducto`, `cantidad`) VALUES ('1', '1', '1', '1');
INSERT INTO `sistemarestaurante`.`itemcomanda` (`idItemComanda`, `idComanda`, `idProducto`, `cantidad`) VALUES ('2', '1', '2', '2');
INSERT INTO `sistemarestaurante`.`itemcomanda` (`idItemComanda`, `idComanda`, `idProducto`, `cantidad`) VALUES ('3', '2', '2', '1');

INSERT INTO `sistemarestaurante`.`listaprecio` (`idListaPrecio`, `fecha`, `idTipoCliente`) VALUES ('1', '2009-01-00', '1');
INSERT INTO `sistemarestaurante`.`listaprecio` (`idListaPrecio`, `fecha`, `idTipoCliente`) VALUES ('2', '2009-02-00', '2');
INSERT INTO `sistemarestaurante`.`listaprecio` (`idListaPrecio`, `fecha`, `idTipoCliente`) VALUES ('3', '2009-03-00', '1');
INSERT INTO `sistemarestaurante`.`listaprecio` (`idListaPrecio`, `fecha`, `idTipoCliente`) VALUES ('4', '2009-04-00', '3');

INSERT INTO `sistemarestaurante`.`itemlistaprecio` (`idItemListaPrecio`, `idListaPrecio`, `idProducto`, `precio`) VALUES ('1', '1', '1', '100');
INSERT INTO `sistemarestaurante`.`itemlistaprecio` (`idItemListaPrecio`, `idListaPrecio`, `idProducto`, `precio`) VALUES ('2', '3', '3', '200');
INSERT INTO `sistemarestaurante`.`itemlistaprecio` (`idItemListaPrecio`, `idListaPrecio`, `idProducto`, `precio`) VALUES ('3', '1', '1', '100');
INSERT INTO `sistemarestaurante`.`itemlistaprecio` (`idItemListaPrecio`, `idListaPrecio`, `idProducto`, `precio`) VALUES ('4', '2', '3', '400');

INSERT INTO `sistemarestaurante`.`stock` (`idStock`, `idIngrediente`, `cantidadActual`, `cantidadMinima`, `cantidadDeseada`) VALUES ('1', '1', '50', '10', '30');
INSERT INTO `sistemarestaurante`.`stock` (`idStock`, `idIngrediente`, `cantidadActual`, `cantidadMinima`, `cantidadDeseada`) VALUES ('2', '3', '50', '15', '32');
INSERT INTO `sistemarestaurante`.`stock` (`idStock`, `idIngrediente`, `cantidadActual`, `cantidadMinima`, `cantidadDeseada`) VALUES ('3', '2', '20', '3', '10');

INSERT INTO `sistemarestaurante`.`itemreceta` (`idItemReceta`, `idReceta`, `idIngrediente`, `cantidad`) VALUES ('1', '1', '3', '100');
INSERT INTO `sistemarestaurante`.`itemreceta` (`idItemReceta`, `idReceta`, `idIngrediente`, `cantidad`) VALUES ('2', '2', '2', '200');
INSERT INTO `sistemarestaurante`.`itemreceta` (`idItemReceta`, `idReceta`, `idIngrediente`, `cantidad`) VALUES ('3', '1', '2', '40');
INSERT INTO `sistemarestaurante`.`itemreceta` (`idItemReceta`, `idReceta`, `idIngrediente`, `cantidad`) VALUES ('4', '3', '1', '100');

INSERT INTO `sistemarestaurante`.`itemrubro` (`idSubRubro`, `idRubro`) VALUES ('1', '2');
INSERT INTO `sistemarestaurante`.`itemrubro` (`idSubRubro`, `idRubro`) VALUES ('2', '3');
INSERT INTO `sistemarestaurante`.`itemrubro` (`idSubRubro`, `idRubro`) VALUES ('3', '1');

INSERT INTO `sistemarestaurante`.`menu` (`idMenu`, `fechaUnica`, `disponibilidadSemana`) VALUES ('1', '2009-01-00', 'Lunes');
INSERT INTO `sistemarestaurante`.`menu` (`idMenu`, `fechaUnica`, `disponibilidadSemana`) VALUES ('2', '2009-01-01', 'Martes');
INSERT INTO `sistemarestaurante`.`menu` (`idMenu`, `fechaUnica`, `disponibilidadSemana`) VALUES ('3', '2009-01-02', 'Miercoles');
INSERT INTO `sistemarestaurante`.`menu` (`idMenu`, `fechaUnica`, `disponibilidadSemana`) VALUES ('4', '2009-01-03', 'Jueves');

INSERT INTO `sistemarestaurante`.`itemmenu` (`idMenu`, `idProducto`) VALUES ('1', '1');
INSERT INTO `sistemarestaurante`.`itemmenu` (`idMenu`, `idProducto`) VALUES ('2', '2');
INSERT INTO `sistemarestaurante`.`itemmenu` (`idMenu`, `idProducto`) VALUES ('3', '1');

INSERT INTO `sistemarestaurante`.`vianda` (`idVianda`, `descripcion`) VALUES ('1', 'Vegetariana');
INSERT INTO `sistemarestaurante`.`vianda` (`idVianda`, `descripcion`) VALUES ('2', 'Rapida');
INSERT INTO `sistemarestaurante`.`vianda` (`idVianda`, `descripcion`) VALUES ('3', 'Dietetica');

INSERT INTO `sistemarestaurante`.`itemvianda` (`idProducto`, `idVianda`) VALUES ('1', '1');
INSERT INTO `sistemarestaurante`.`itemvianda` (`idProducto`, `idVianda`) VALUES ('2', '3');
INSERT INTO `sistemarestaurante`.`itemvianda` (`idProducto`, `idVianda`) VALUES ('3', '2');

INSERT INTO `sistemarestaurante`.`mesasimple` (`idMesaSimple`, `idMesa`, `capacidad`) VALUES ('1', '1', '4');
INSERT INTO `sistemarestaurante`.`mesasimple` (`idMesaSimple`, `idMesa`, `capacidad`) VALUES ('2', '2', '4');
INSERT INTO `sistemarestaurante`.`mesasimple` (`idMesaSimple`, `idMesa`, `capacidad`) VALUES ('3', '3', '2');

INSERT INTO `sistemarestaurante`.`login` (`idLogin`, `nombreUsuario`, `password`) VALUES ('1', 'Matias', '123456');
INSERT INTO `sistemarestaurante`.`login` (`idLogin`, `nombreUsuario`, `password`) VALUES ('2', 'Juan Pablo', '223344');
INSERT INTO `sistemarestaurante`.`login` (`idLogin`, `nombreUsuario`, `password`) VALUES ('3', 'Lucio', '343434');

INSERT INTO `sistemarestaurante`.`privilegio` (`idPrivilegio`, `privilegio`) VALUES ('1', 'Borrar mesa');
INSERT INTO `sistemarestaurante`.`privilegio` (`idPrivilegio`, `privilegio`) VALUES ('2', 'Añadir producto');
INSERT INTO `sistemarestaurante`.`privilegio` (`idPrivilegio`, `privilegio`) VALUES ('3', 'Añadir menu');
INSERT INTO `sistemarestaurante`.`privilegio` (`idPrivilegio`, `privilegio`) VALUES ('4', 'Añadir plato');
INSERT INTO `sistemarestaurante`.`privilegio` (`idPrivilegio`, `privilegio`) VALUES ('5', 'Añadir mesa');

INSERT INTO `sistemarestaurante`.`tipousuario` (`idTipoUsuario`, `tipoUsuario`) VALUES ('1', 'Admin');
INSERT INTO `sistemarestaurante`.`tipousuario` (`idTipoUsuario`, `tipoUsuario`) VALUES ('2', 'Normal');

INSERT INTO `sistemarestaurante`.`usuario` (`idUsuario`, `idTipoUsuario`, `nombre`, `apellido`, `idLogin`) VALUES ('1', '2', 'Matias', 'Torsello', '1');
INSERT INTO `sistemarestaurante`.`usuario` (`idUsuario`, `idTipoUsuario`, `nombre`, `apellido`, `idLogin`) VALUES ('2', '1', 'Juan Pablo', 'Federico', '2');
INSERT INTO `sistemarestaurante`.`usuario` (`idUsuario`, `idTipoUsuario`, `nombre`, `apellido`, `idLogin`) VALUES ('3', '2', 'Lucio', 'Trucco', '3');

INSERT INTO `sistemarestaurante`.`ticket` (`idTicket`, `idUsuario`, `monto`, `esCortesia`) VALUES ('1', '1', '400', b'0');
INSERT INTO `sistemarestaurante`.`ticket` (`idTicket`, `idUsuario`, `monto`, `esCortesia`) VALUES ('2', '2', '500', b'0');
INSERT INTO `sistemarestaurante`.`ticket` (`idTicket`, `idUsuario`, `monto`, `esCortesia`) VALUES ('3', '3', '200', b'1');

INSERT INTO `sistemarestaurante`.`itemticket` (`idItemTicket`, `idProducto`, `idTicket`, `precioUnitario`, `cantidad`) VALUES ('1', '1', '1', '30', '4');
INSERT INTO `sistemarestaurante`.`itemticket` (`idItemTicket`, `idProducto`, `idTicket`, `precioUnitario`, `cantidad`) VALUES ('2', '2', '1', '40', '1');
INSERT INTO `sistemarestaurante`.`itemticket` (`idItemTicket`, `idProducto`, `idTicket`, `precioUnitario`, `cantidad`) VALUES ('3', '2', '1', '50', '3');
INSERT INTO `sistemarestaurante`.`itemticket` (`idItemTicket`, `idProducto`, `idTicket`, `precioUnitario`, `cantidad`) VALUES ('4', '3', '2', '40', '4');

