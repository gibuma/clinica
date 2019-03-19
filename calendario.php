<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="application/xhtml+xml; charset=utf-8" />
	<title>Turnos</title>

	<!-- link calendar resources -->
	<link rel="stylesheet" type="text/css" href="tcal.css" />
	<script type="text/javascript" src="tcal.js"></script> 
</head>
<body>

	<form action="#">
	
    <?php 
include("conexion.inc");
$vSql = "SELECT DISTINCT  apellido_nombre, especialidad, id_profesionales FROM profesionales ORDER BY apellido_nombre ASC";
$vResultado = mysqli_query($link, $vSql);
$total_registros=mysqli_num_rows($vResultado);

$vSql = "SELECT DISTINCT  apellido, nombre, id_pacientes FROM pacientes ORDER BY apellido ASC";
$vR = mysqli_query($link, $vSql);
$total=mysqli_num_rows($vR);
?>
     <p>
              <label for="textfield10"><font color="red">*</font> Profesional:</label>
                 <select type="text" name="profesional" id="profesional">
                 <option value="">-Seleccionar-</option>
                <?php while ($fila = mysqli_fetch_array($vResultado)) {
				echo "<option value='".$fila["id_profesionales"]."'>".$fila['apellido_nombre']." ".$fila['especialidad']."</option>";  } ?>	
                </select>
                                               </p>  
              
    
    
		<div><input type="text" name="date" class="tcal" value="" /></div> <br />
        
            <label for="textfield10"><font color="red">*</font> Hora:</label>
                 <select type="text" name="hora" id="hora">
                 <option value="">-Seleccionar-</option>
                <?php // while ($fila = mysqli_fetch_array($vResultado)) {
				//echo "<option value='".$fila["id_profesionales"]."'>".$fila['apellido_nombre']." ".$fila['especialidad']."</option>";  } ?>	
                </select>
                                               </p>  
        
         <p>
                <label for="textfield10"><font color="red">*</font> Pacientes:</label>
                 <select type="text" name="paciente" id="paciente">
                 <option value="">-Seleccionar-</option>
                <?php while ($fil = mysqli_fetch_array($vR)) {
				echo "<option value='".$fil["id_pacientes"]."'>".$fil['apellido']." ".$fil['nombre']."</option>";  } ?>	
                </select>
         
                
                               </p> 
                               
              <p>  <label for="textfield10"> Tipo de turno:</label>
                <select type="text" name="tipo" id="tipo">
         <option value="">-Seleccionar-</option>
                <option>Socio</option>
                <option>Particular</option>
                <option>Seguro escolar</option>
                <option>Ayuda social</option>
                 </select></p>
                  <p>  <label for="textfield10"> Estado del turno:</label>
                <select type="text" name="estado" id="estado">
                 <option value="">-Seleccionar-</option>
                <option>Disponible</option>
                <option>Reservado</option>
                <option>Presente</option>
                <option>Atendido</option>
                 </select></p>
                 <p>  <label for="textfield10"> Pago:</label>
                <select type="text" name="pago" id="pago">
              <option value="">-Seleccionar-</option>
                <option>Si</option>
                <option>No</option>
                
                 </select></p>
                 <p>
                <label for="textfield2"> Monto adicional:</label>
                <input type="text" name="adicional" id="adicional" value="0">
              </p>   
              
	</form>
</body>
</html>
