

</body>
</html><%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html>

<head>
    <!--     <meta charset="utf-8"> -->
	<meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Jekyll v4.1.1">
    <title>Formulario de Registro</title>
    
    <link href="/acpweb/fontawesome-free-5.15.3-web/css/fontawesome.css" rel="stylesheet">
    <link href="/acpweb/fontawesome-free-5.15.3-web/css/brands.css" rel="stylesheet">
    <link href="/acpweb/fontawesome-free-5.15.3-web/css/solid.css" rel="stylesheet">

    <style>
        * {
            margin: 0%;
            padding: 0%;
            font-family: sans-serif;
        }
        
        .hero {
            height: 100%;
            width: 100%;
            background-image: linear-gradient(rgba(0, 0, 0, 0.4), rgba(0, 0, 0, 0.4)), url(/acpweb/resources/backgroundFamilia.jpg);
            background-position: center;
            background-size: cover;
            position: absolute;
        }
        
        .form-box {
            width: 380px;
            height: 480px;
            position: relative;
            margin: 6% auto;
            background: #ffff;
            padding: 5px;
            overflow: hidden;
            border-radius: 20px;
        }
        
        .button-box {
            width: 200px;
            margin: 35px auto;
            position: relative;
            box-shadow: 0 0 20px 9px #ff61241f;
            border-radius: 30px;
        }
        
        .toggle-btn {
            padding: 10px 20px;
            cursor: pointer;
            background: transparent;
            border: 0;
            outline: none;
            position: relative;
        }
        
        #btn {
            top: 0;
            left: 0;
            position: absolute;
            width: 100px;
            height: 100%;
            background: linear-gradient(to right, #00539E, #007BFF);
            border-radius: 30px;
            transition: .5s;
        }
        
        .social-icons {
            margin: 30px auto;
            text-align: center;
        }
        
        .social-icons img {
            width: 30px;
            margin: 0 12px;
            box-shadow: 0 0 20px 0 #7f7f7f3d;
            cursor: pointer;
            border-radius: 50%;
        }
        
        .input-group {
            top: 100px;
            position: absolute;
            width: 280px;
            transition: .5s;
        }
        
        .input-field {
            width: 100%;
            padding: 10px 0;
            margin: 15px 0;
            border-left: 0;
            border-right: 0;
            border-top: 0;
            border-bottom: 1px solid #999;
            outline: none;
            background: transparent;
        }
        
        .submit-btn {
            width: 85%;
            padding: 10px 30px;
            cursor: pointer;
            display: block;
            margin: 20px auto;
            margin-bottom: 10px;
            background: linear-gradient(to right, #00539E, #007BFF);
            border: 0;
            outline: none;
            border-radius: 30px;
        }
        
        .checkbox {
            margin: 30px 10px 30px 0;
        }
        
        span {
            color: #777;
            font-size: 12px;
            bottom: 68px;
            position: absolute;
        }
        
        #login {
            left: 50px;
        }
        
        #register {
            left: 450px;
        }
        
        label {
            padding-left: 10px;
        }
        
        h2 {
        	margin-top: 50px;
            text-align: center;
        }
       
       .btn-back{
       		margin-top: 15px;
       		margin-left: 15px;
       		float: left;
       		padding: 10px;
       		background-color: #ffffff;
       		width: 20px;
       		border-radius: 50%;
       		cursor: pointer;
       }
    </style>

</head>

<body>
		
    <div class="hero">
    	<div class="btn-back">
    		<a href="/acpweb/admin/familia.jsp">
		        <i class="fas fa-arrow-left"></i>
		    </a>
    	</div>
        <div class="form-box">
            <h2>Registrar nueva Familia</h2>
            <form id="login" class="input-group" method="post" action="../Sl_GestionFamilia">
            	<input name="opcion" type="hidden" value="1" />
                <input type="text" class="input-field" placeholder="Nombre de la familia" name="txtNombre" required>
                <input type="text" class="input-field" placeholder="Descripcion" name="txtDescripcion"required>
                <div class="text-center">
                    <input class="submit-btn" type="submit" value="Guardar" />
                </div>
                <div class="text-center">
                    <input class="submit-btn" type="reset" value="Cancelar" />
                </div>
                
            </form>
        </div>

    </div>

</body>

</html>