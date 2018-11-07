<?php
header('Content-Type: application/json');
include("conexion.inc");
$pdo = new PDO("mysql:dbname=clinica;host=127.0.0.1:3307", "root", "");


$accion=(isset($_GET['accion']))?$_GET['accion']:'leer';
switch($accion){
	case 'agregar':
	//$vSql = $pdo->prepare("INSERT INTO turnos (start, end, tipo_turno, estado_turno, pago, importe_adicional, color, id_profesionales, id_pacientes)
//values (:fecha,:horaf,:tipo,:estado,:pago,:adicional,:color,:profesional,:paciente)");
 
    $sql= "INSERT INTO turnos (start, end, tipo_turno, estado_turno, pago, importe_adicional, color, id_profesionales, id_pacientes) VALUES ( ?,?,?,?,?,?,?,?,?)";
            // preparando la consulta
    $sentencia = mysqli_prepare($link,$sql);

  mysqli_stmt_bind_param($sentencia,'ssssss',$Vfecha,$Vhoraf,$Vtipo,$Vestado,$Vpago,$Vadicional,$Vcolor,$Vprofesional,$Vpaciente);
            //estableciendo los parametros
           

 $Vprofesional = $_POST['profesional'];
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

              
            mysqli_stmt_execute($sentencia);
            //consulta ejecutada      
 



		echo "Instruccion agregar";
	break;
	
	
	case 'modificar':
	echo "Instruccion modificar";
	$vSql = $pdo->prepare("UPDATE TURNOS SET id_profesionales=$Vprofesional,id_pacientes=$Vpaciente,start=$Vfecha,end=$Vhoraf,tipo_turno=$Vtipo,  estado_turno=$Vestado,pago=$Vpago,importe_adicional=$Vadicional,color=$Vcolor where id_turnos=$Vid");
	$respuesta=$vSql->execute(array(
	 $Vid= $_POST['id'],
  $Vprofesional = $_POST['profesional'],
settype($Vprofesional, "integer"),
$Vpaciente= $_POST['paciente'],
settype($Vpaciente, "integer"), 
$Vfecha = $_POST['start'],
$Vhoraf= $_POST['end'],
$Vtipo = $_POST['tipo'],
$Vestado = $_POST['estado'],
$Vpago = $_POST['pago'],
$Vadicional = $_POST['adicional'],
$Vcolor = $_POST['color'],
 ));
 echo json_encode($respuesta);
		break;
		
		
		
	case 'eliminar':
	echo "Instruccion eliminar";
	$respuesta=false;
	if(isset($_POST[id])){
		$vSql = $pdo->prepare("DELETE FROM turnos where id_turnos=$Vid");
		$respuesta= $pdo->execute(array($Vid=$_POST['id']));
			}
				echo json_encode($respuesta);
	break;
	
	
	
default:

$vSql = $pdo->prepare("SELECT * FROM turnos");
$vSql->execute();
$resultado= $vSql->fetchAll(PDO::FETCH_ASSOC);
echo json_encode($resultado);}
?>
