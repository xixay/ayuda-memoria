tengo dos array de objetos llamado resultQueryNuevo, y otro llamado resultQueryAntiguo
cada objeto tiene un atributo llamado trabajo_codigo que es un string, quiero que los trabajo_codigo, digamos 'K1EP02J20' que no estan en resultQueryNuevo, pero si en  resultQueryAntiguo, se añada el objeto resultQueryNuevo, todo esto en java script

const resultQueryNuevo = [
  { trabajo_codigo: 'A1', otherProp: 'value1' },
  { trabajo_codigo: 'B2', otherProp: 'value2' },
  // ... otros objetos
];

const resultQueryAntiguo = [
  { trabajo_codigo: 'A1', otherProp: 'value1' },
  { trabajo_codigo: 'K1EP02J20', otherProp: 'value3' },
  { trabajo_codigo: 'C3', otherProp: 'value4' },
  // ... otros objetos
];

// Extraer los trabajo_codigo de resultQueryNuevo en un Set para rápida verificación
const trabajoCodigosNuevo = new Set(resultQueryNuevo.map(obj => obj.trabajo_codigo));

// Filtrar los objetos de resultQueryAntiguo cuyo trabajo_codigo no esté en resultQueryNuevo
const objetosParaAgregar = resultQueryAntiguo.filter(
  obj => !trabajoCodigosNuevo.has(obj.trabajo_codigo)
);

// Añadir los objetos faltantes a resultQueryNuevo
resultQueryNuevo.push(...objetosParaAgregar);

console.log(resultQueryNuevo);

