<?php
header('Content-Type: application/json');
//$pdo = new PDO("mysql:dbname=clinica;host=127.0.0.1:3306", "root", "");
try{
   $pdo = new PDO("mysql:dbname=clinica;host=127.0.0.1:3306", "root", "root");
   $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

}catch(PDOException $e){
    echo "ERROR: " . $e->getMessage();
}

$accion=(isset($_GET['accion']))?$_GET['accion']:'leer';

switch($accion){
	
case 'agregar':
$vSql = $pdo->prepare("INSERT INTO turnos (start, end, tipo_turno, estado_turno, pago, importe_adicional, color, id_profesionales, id_pacientes)
values(:fecha,:horaf,:tipo,:estado,:pago,:adicional,:color,:profesional,:paciente)");
         
$respuesta=$vSql->execute(array(
"profesional" => $_POST['profesional'],
"paciente" => $_POST['paciente'],
"fecha" => $_POST['start'],
"horaf"=> $_POST['end'],
"tipo" => $_POST['tipo'],
"estado" => $_POST['estado'],
"pago" => $_POST['pago'],
"adicional" => $_POST['adicional'],
"color" => $_POST['color'], ));
echo json_encode($respuesta);
echo "El turno se agregó con éxito";
	break;
	
case 'eliminar':
$respuesta=false;
if(isset($_POST['id'])){
$vSql = $pdo->prepare("DELETE FROM turnos where id_turnos=:id");
$respuesta= $vSql->execute(array("id"=>$_POST['id']));}
echo json_encode($respuesta);
    break;

case 'modificar':
$vSql = $pdo->prepare("UPDATE TURNOS SET id_profesionales=:profesional,id_pacientes=:paciente,start=:fecha,end=:horaf,tipo_turno=:tipo,  estado_turno=:estado,pago=:pago,importe_adicional=:adicional,color=:color where id_turnos=:id");

$respuesta=$vSql->execute(array(
"id"=> $_POST['id'],
"profesional" => $_POST['profesional'],
"paciente" => $_POST['paciente'],
"fecha" => $_POST['start'],
"horaf"=> $_POST['end'],
"tipo" => $_POST['tipo'],
"estado" => $_POST['estado'],
"pago" => $_POST['pago'],
"adicional" => $_POST['adicional'],
"color" => $_POST['color']));
 echo json_encode($respuesta);
     break;
	
		
default:
$vSql = $pdo->prepare("SELECT * FROM turnos");
$vSql->execute();
$resultado= $vSql->fetchAll(PDO::FETCH_ASSOC);
echo json_encode($resultado);
     break;
}
?>
