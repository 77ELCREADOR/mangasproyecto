/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function validacionES(){
        
        
    var nombre = document.formulario1.nomU.value;
	var appat = document.formulario1.appatU.value;
	var apmat = document.formulario1.apmatU.value;
	var curp = document.formulario1.curpU.value;
	var fNac= document.formulario1.fNacU.value;
    var calle = document.formulario1.calleDU.value;
	var ex = document.formulario1.exU.value;
    var int = document.formulario1.inU.value;
    var colonia = document.formulario1.coloniaU.value;    
	var cp = document.formulario1.cpU.value;
	var tel = document.formulario1.telU.value;

	
	var expresion= new RegExp("^[a-zA-ZÀ-ÿ\\u00f1\\u00d1]+(\\s*[a-zA-ZÀ-ÿ\\u00f1\\u00d1]*)*[a-zA-ZÀ-ÿ\\u00f1\\u00d1]+$");
	var expresion1=new RegExp("^[a-zA-ZÀ-ÿ\\u00f1\\u00d1]*[a-zA-ZÀ-ÿ\\u00f1\\u00d1][a-zA-ZÀ-ÿ\\u00f1\\u00d1]+$");//letras
	var expresion2= /^\d*$/;//numeros
	var expresion3 = new RegExp("^[a-zA-ZÀ-ÿ0-9\\u00f1\\u00d1]+(\\s*[a-zA-ZÀ-ÿ0-9\\u00f1\\u00d1]*)*[a-zA-ZÀ-ÿ0-9\\u00f1\\u00d1]+$");//letras y espacios
	var expresion4 = new RegExp("^[a-zA-Z0-9]+$");//contraseñas
	var expresion5=new RegExp("^[a-zA-Z\\u00f1\\u00d1]*[a-zA-Z\\u00f1\\u00d1][a-zA-Z\\u00f1\\u00d1]+$");//nombrecuenta
	var expresion6=new RegExp("^\\d{4}\\-(0[1-9]|1[012])\\-(0[1-9]|[12][0-9]|3[01])$");//fechas
	var expresion7=new RegExp("[A-Z]{1}[AEIOU]{1}[A-Z]{2}[0-9]{2}"+"(0[1-9]|1[0-2])(0[1-9]|1[0-9]|2[0-9]|3[0-1])"
		+"[HM]{1}"+"(AS|BC|BS|CC|CS|CH|CL|CM|DF|DG|GT|GR|HG|JC|MC|MN|MS|NT|NL|OC|PL|QT|QR|SP|SL|SR|TC|TS|TL|VZ|YN|ZS|NE)"
		+"[B-DF-HJ-NP-TV-Z]{3}"+"[0-9A-Z]{1}[0-9]{1}$");//Curp

	var exp1=expresion.test(nombre);
	var exp2=expresion.test(appat);
	var exp3=expresion.test(apmat);
	var exp4=expresion7.test(curp);
	var exp5=expresion3.test(colonia);
	var exp6=expresion3.test(calle);
	var exp7=expresion6.test(fNac);
	var exp10=expresion2.test(cp);
	var exp11=expresion2.test(tel);
    var exp14=expresion2.test(ex);
    var exp15=expresion2.test(int);

        
	if (nombre=="" || appat=="" || apmat=="" || curp=="" || colonia=="" || calle==""
            || cp=="" || tel=="" || ex=="" || fNac=="") {
        alert("No deje campos vacios");
		return false;
	}else if (int=="") {
		alert("Si no tiene numero interior deje el campo en 0");
		return false;
	}else{
        if(exp1===false){
			alert("El nombre puede contener letras y espacios (solo si hay letras delante), ingresa mas de un caracter");
			return false;
		}else if(exp2===false || exp3===false){
			alert("Los apellidos solo pueden contener letras y espacios, ingresa mas de un caracter");
			return false;
		}else if(exp4===false){
			alert("Curp erroneo");
			return false;
		}else if(exp5===false){
			alert("La colonia puede contener letras y espacios (solo si hay letras delante), ingresa mas de un caracter");
			return false;
		}else if(exp6===false){
			alert("La calle puede contener letras y espacios (solo si hay letras delante), ingresa mas de un caracter");
			return false;
		}else if(exp7==false){
			alert("La fecha de nacimiento debe de seguir el formato: yyyy-mm-dd (con todo y guiones)");
			return false;
		}else if (exp10===false) {
			alert("El cp solo puede contener numeros");
			return false;
		}else if(exp11===false){
			alert("El telefono solo puede contener numeros");
			return false;
		
        }else if(exp14===false || exp15===false){
            alert("Los numeros interior y exterior deben de ser numeros");
            return false;
		}else{
            var lonombre=nombre.length;
            var loappat=appat.length;
            var loapmat=apmat.length;
            var locurp=curp.length;
            var locolonia=colonia.length;
            var localle=calle.length;
            var loex=ex.length;
            var loin=int.length;
            var locp=cp.length;
            var lotel=tel.length;
            
            var ano=fNac.slice(0,4);
            
            if (lonombre>20) {
		alert("El nombre no puede contener mas de 20 caracteres");
		return false;
            }else if (loappat>20 || loapmat>20) {
		alert("Los apellidos no pueden contener mas de 20 caracteres");
		return false;
            }else if(locurp!==18){
		alert("El curp debe de tener 18 caracteres");
                return false;
            }else if(locolonia>50 || localle>50) {
                alert("La calle y la colonia no pueden tener mas de 50 caracteres");
				return false;
			}else if (ano<1915 || ano>2017) {
				alert("Debe de ingresar un año entre 1915 & 2017");
				return false;
			//}else if (expfecha==false){
			//	alert("La fecha es incorrecta");
			//	return false;
			}else if(loin>3){
				alert("El num interior no puede contener mas de 3 caracteres");
				return false;
			}else if(loex>3){
				alert("El num exterior no puede contener mas de 3 caracteres");
				return false;
			}else if (locp!==5) {
				alert("El cp debe de contener 5 caracteres");
				return false;
			}else if (lotel!=8) {
				alert("El telefono debe de contener 8 caracteres");
				return false;
			
			}else{
				
				return true;
			}
		}
	}   
}



