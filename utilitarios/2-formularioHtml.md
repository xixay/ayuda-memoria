# Formulario-Repositorio
- Capturar datos a través de formulario utilizando funciones en JavaScript
```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formulario</title>
</head>
<body>
    <form action="">
        <input type="text" name="nomEst" id="nomEst" placeholder="Digite nombre estudiante" size="35">
        <br>
        <input type="text" name="celEst" id="celEst" placeholder="Digite el celular del estudiante" size="35">
        <br>
        <button type="button" onclick="captura()">Capturar</button>
    </form>
    <br><br>
    <script type="text/javascript" src="./instrucciones.js"></script>
</body>
</html>
```
- Funcion js que captura datos desde un cuadro de texto de formulario
```js
//Funcion que captura datos desde un cuadro de texto de formulario
function captura(){
    //Captura el valor que digita en el cuadro estudiante
    var nombreEst=document.getElementById("nomEst").value;
    var celularEst=document.getElementById("celEst").value;
    //alert(nombreEst);
    if (nombreEst=="") {
        alert("El nombre es obligatorio digitarlo");
        //Hace que el cursor se pare en el cuadro de nombre, despues de dar aceptar
        document.getElementById("nomEst").focus();
    } else {
        if (celularEst=="") {
            alert("El celular es obligatorio digitarlo");
            //Hace que el cursor se pare en el cuadro de celular, despues de dar aceptar
            document.getElementById("celEst").focus();
        } else{
            //Muestra los datos por consola F12 en terminal
            console.log('nombre Estudiante', nombreEst, 'numero de celular', celularEst);
            //Borra los datos del cuadro de texto nombre
            document.getElementById("nomEst").value="";
            //Borra los datos del cuadro de texto celular
            document.getElementById("celEst").value="";
            //Despues de capturar, posiciona el nombre el cursor en el cuadro de nombre
            document.getElementById("nomEst").focus();
        }
    } 
}
```