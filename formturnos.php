 

<!doctype html>
<html lang="{{ app()->getLocale() }}">
<head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="shortcut icon" href="logo.jpg" type="image/x-icon">
        <link rel="icon" href="logo.jpg" type="image/x-icon">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <script src="js/jquery.min.js"> </script>
        <script src="js/moment.min.js"></script>
          <script src="jquery-3.0.0.min.js"> </script>
    
         <!-- calendar --> 
         
        <link rel="stylesheet" href="css/fullcalendar.min.css">
        <script src="js/fullcalendar.min.js" > </script>
         <script src="js/es.js"></script>

         
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <title>Nuevo turno</title>

        <!-- Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Raleway:100,600" rel="stylesheet" type="text/css">

        <!-- Styles -->
        <style>
		body {
  background-color: #C4C0C0;
  font: 1em Helvetica;
}

#container {
  float: center;
  width: 840px;
  margin: 25px auto;
}

.whysign {
  float: left;
  background-color: grey;
  width: 480px;
  height: 347px;
  border-radius: 0 5px 5px 0;
  padding-top: 20px;
  padding-right: 20px;
}

.signup {
  float: left;
  width: 300px;
  padding: 30px 60px;
  background-color: white;
  text-align: center;
  border-radius: 50px 0 50px 50px;
   box-shadow: 2px 3px 1px rgba(0,0,0,.3);
       
	 font-size:15px;
   
}
.signupi {
  float: left;
  width: 300px;
  padding: 30px 60px;
  background-color: white;
  text-align: center;
  border-radius: 0px 50px 50px 0px;
   box-shadow: 1px 3px 1px rgba(0,0,0,.3);
     font-size:15px;
}
[type=text] {
  display: block;
  margin: 0 auto;
  width: 100%;
  border: 0;
  border-bottom: 1px solid rgba(0,0,0,.2);
  height: 45px;
  line-height: 45px;  
  margin-bottom: 10px;
  font-size: 1em;
color: #53CACE;
}

[type=submit] {
  margin-top: 25px;
  width: 80%;
  border: 0;
  background-color: red;
  border-radius: 5px;
  height: 50px;
  color: white;
  font-weight: 400;
  font-size: 1em;
  box-shadow: 1px 3px 1px rgba(0,0,0,.3);
}


[type='text']:focus {
  outline: none;
  border-color: #53CACE;
}

h1 {
  color: rgba(0,0,0,.7);
  font-weight: 900;
  font-size: 2.5em;
}

p {
  color: rgba(0,0,0,.9);
  font-size: 1.1em;
  margin: px 0 50px 0;
}

spann {
  font-size: .75em;
  background-color: white;
  padding: 5px 100px;
  color: red;
  border-radius: 50px;
  box-shadow: 2px 3px 1px rgba(0,0,0,.7);
  margin: 5px;
}


spann:hover {
  color: #53CACE;
}

		#calendar {
			font-family:Arial;
			font-size:12px;
			
		}
		#calendar caption {
			text-align:left;
			padding:5px 10px;
			background-color: #006699;
			color:#fff;
			font-weight:bold;
		}
		#calendar th {
			background-color:#006699;
			color:#fff;
			width:40px;
		}
		#calendar td {
			text-align:right;
			padding:2px 5px;
			background-color:silver;
		}
		#calendar .hoy {
			background-color:red;
		}
	</style>
     
    </head>
    <body>
    <br>
    <div>
      <h3><center><spann>Calendario de Turnos</spann></center></h3></div> 
      <div id='container'>
 			
             <br>
            <form id="form1" name="formturnos" method="post" action="altaturnos.php" onsubmit="return validacion()">                      
               <div class='signup'>
                <?php 
include("conexion.inc");
$vSql = "SELECT DISTINCT  apellido_nombre, especialidad, id_profesionales FROM profesionales ORDER BY apellido_nombre ASC";
$vResultado = mysqli_query($link, $vSql);
$total_registros=mysqli_num_rows($vResultado);
?>
   <p>
                <label for="textfield10"><font color="red">*</font> Profesional:</label>
                 <select type="text" name="profesional" id="profesional">
                 <option value="">-Seleccionar-</option>
                <?php while ($fila = mysqli_fetch_array($vResultado)) {
				echo "<option value='".$fila["id_profesionales"]."'>".$fila['apellido_nombre']." ".$fila['especialidad']."</option>";  } ?>	
                </select>
                                               </p> 
                   
               </div>
               </form></div> 
               
    <div class='container'>
    <div class='row'>
    <div class='col'> </div>
     <div class='col-7'> <div id='CalendarioWeb'> </div> </div>
      <div class='col'> </div>
 </div>
  </div>
  
    <script>

$(document).ready(function(){
	
	$('#CalendarioWeb').fullCalendar({
	header:{
		left:'agendaWeek,agendaDay,month',
		center:'title',
		rigth:''		
	       },
	
	customButtons:{
		Miboton:{
		text:'Boton 1',
		click: function(){
		alert("Accion del botón");
		                 }
	            }	
	              },
				  
	dayClick:function(date, jsEvent, view){
		$('#start').val(date.format());
		$('#end').val(date.format());
		$(this).css('background-color','white');
		$("#exampleModal").modal();
	                                      }, 
	
	events:'http://localhost/Clinica/traereventos.php',
	
	eventClick:function(calEvent,jsEvent,view){
		//$('#start').val(calEvent.start);
		//$('#end').val(calEvent.end);
		FechaHora=calEvent.start._i.split(" ");
		$('#start').val(FechaHora[0] + " " + FechaHora[1]);
		FechaHoraf=calEvent.end._i.split(" ");
		$('#end').val(FechaHoraf[0] + " " + FechaHoraf[1]);
		$('#profesional').val(calEvent.profesional);
		$('#paciente').val(calEvent.paciente);
		$('#tipo').val(calEvent.tipo);
		$('#estado').val(calEvent.estado);
		$('#pago').val(calEvent.pago);
		$('#adicional').val(calEvent.adicional);
		$('#color').val(calEvent.color);
		$("#exampleModal").modal();
	                                         }	
	});	
	});
	
	

</script> 

         
 <!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="tituloturno">Turno</h5>
        
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
 
      </div>
      <form id="form1" name="formturnoss" method="post" >
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
                <label for="textfield2"> Id:</label>
                <input type="text" name="id" id="id" value="NO COMPLETAR">
              </p>
      <p>
                <label for="textfield10"><font color="red">*</font> Profesional:</label>
                 <select type="text" name="profesional" id="profesional" >
                 <option value="">-Seleccionar-</option>
                <?php while ($fila = mysqli_fetch_array($vResultado)) {
				echo "<option value='".$fila["id_profesionales"]."'>".$fila['apellido_nombre']." ".$fila['especialidad']."</option>";  } ?>	
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
                             
      <p>
                <label for="textfield2"> Fecha y hora inicio:</label>
                <input type="text" name="start" id="start">
              </p>        
                                      
      <p>
                <label for="textfield2"> Fecha y hora fin:</label>
                <input type="text" name="end" id="end">
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
                <input type="text" name="adicional" id="adicional">
              </p>       
                 <p>
                <label for="textfield2"> Color:</label>
                <input type="color" name="color" id="color">
              </p>      
                 
      <div class="modal-footer"> 
       <button id="btnAgregar" class="btn btn-secondary">Agregar</button>
      <button id="btnModificar" class="btn btn-secondary">Modificar</button>
      <button id="btnBorrar" class="btn btn-secondary">Borrar</button>
        <button  class="btn btn-secondary">Cancelar</button>
        </form>
        <div id="resp"></div>
      </div>
    </div>
    
  </div>
</div>   


<script>    
var NuevoElemento;
    
$('#btnAgregar').click(function(){

	RecolectarDatos();
	EnviarDatos('agregar',NuevoElemento);
	                            });
	
$('#btnBorrar').click(function(){

	RecolectarDatos();
	EnviarDatos('eliminar',NuevoElemento);
	                            });
	
$('#btnModificar').click(function(){

	RecolectarDatos();
	EnviarDatos('modificar',NuevoElemento);
	                              });
		
function RecolectarDatos(){
		
		 NuevoElemento={
		    id:$("#id").val(),
			prof:$("#profesional").val(),
			pac:$("#paciente").val(),
			start:$("#start").val(),
			end:$("#end").val(),
			tipo:$("#tipo").val(),
			estado:$("#estado").val(),
			pago:$("#pago").val(),
			adicional:$("#adicional").val(),
			color:$("#color").val(),
			           }; 
				          }
				
function EnviarDatos(accion,objEvento){
		$.ajax({
			type:'POST',
			url:'traereventos.php?accion='+accion,
			data:objEvento,
			sucess:function(msg){
				if(msg){
				$('#CalendarioWeb').fullCalendar('refetchEvents');
				$("#exampleModal").modal('toggle');
				       }
		                     	},
			error:function(){
				alert("Hay un error...");
				          }
			  });
		
		
		                              }			
				
</script>  


              
</body>
</html>              
             
          





               