<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title></title>
</head>
<body>

<?php
include("conexion.inc");
//session_start();
$Vprofesional =$_POST['profesional'];
settype($Vprofesional, "integer"); 
$Vpaciente= $_POST['paciente'];
settype($Vpaciente, "integer"); 
$Vfecha = $_POST['start'];
$Vhoraf= $_POST['end'];
$Vtipo = $_POST['tipo'];
$Vestado = $_POST['estado'];
$Vpago = $_POST['pago'];
$Vadicional = $_POST['adicional'];
$Vcolor = $_POST['color'];


//if($vDni=='Opcional')
//{$vDni='null';}
//Arma la instrucción SQL y luego la ejecuta
$vSql = "SELECT * FROM turnos WHERE start='$Vfecha' and id_profesionales='$Vprofesional'";

$vResultado = mysqli_query($link, $vSql) or die (mysqli_error($link));

$vCant = mysqli_fetch_assoc($vResultado);


//$vCant= mysqli_result($vResultado, 0);
if ($vCant !=0){
echo "<script>alert('[ERROR ] El turno ya se registro anteriorimente');</script>";}
 else {
$vSql = "INSERT INTO turnos (start, end, tipo_turno, estado_turno, pago, importe_adicional, color, id_profesionales, id_pacientes)
values ('$Vfecha','$Vhoraf','$Vtipo','$Vestado','$Vpago','$Vadicional','$Vcolor','$Vprofesional','$Vpaciente')";
 mysqli_query($link, $vSql) or die (mysqli_error($link));

echo "turno del paciente: ".$Vpaciente; 
    echo " para: ".$Vprofesional;
echo "<script>alert('El turno se registró con éxito');</script>";}

 
// Liberar conjunto de resultados
mysqli_free_result($vResultado);

// Cerrar la conexion
mysqli_close($link);
?>

</body>
</html>