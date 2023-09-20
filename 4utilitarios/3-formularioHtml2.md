# Formulario-Repositorio
- Utilizando funciones en JavaScript
```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <div>
        <form id="guardarTransaccion">
            <div>
                <label for="descripcionTransaccion">Descripción</label>
                <input id="descripcionTransaccion" type="text" placeholder="Descripcion">
            </div>
            <br>
            <div>
                <label for="precioTransaccion">Precio</label>
                <input id="precioTransaccion" type="number" placeholder="Precio">
            </div>
            <br>
            <div>
                <button>Guardar Transaccion</button>
            </div>
        </form>
    </div>
    <!--Llama el script-->
    <script src="./scripts/script.js"></script>
</body>
</html>
```
- Obtener los datos del formulario
```js
//obtiene los elementos del formulario
const elementoForm=document.getElementById("guardarTransaccion");
console.log('####', elementoForm);
```
- Obtener datos
```js
//Al hacer click captura el evento
elementoForm.addEventListener("submit", (evento) => {
    //Cancelar el evento que tiene por defecto, osea recarga el navegador, cuando guarda
    evento.preventDefault();
    //obtiene los datos de la caja descripcion en una variable
    let edtDescripcion=document.getElementById('descripcionTransaccion').value;
    console.log('####', elementoForm);
    //obtiene los datos de la caja precio en una variable
    let edtPrecio=document.getElementById('precioTransaccion').value;
    //Crear el objeto 
    let transaccion={
        descripcion:edtDescripcion,
        precio:edtPrecio,
    };
    console.log('objeto transaccion', transaccion);
    //Convertir el objeto a Json
    let transaccionJson=JSON.stringify(transaccion);
    console.log('JSON transaccion', transaccionJson);
});
```