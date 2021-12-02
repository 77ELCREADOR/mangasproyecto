/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function validacionRM(){
    
        var nombre = document.formulario1.nomM.value;
        var des = document.formulario1.desM.value;
        var edi = document.formulario1.ediM.value;
        var gen = document.formulario1.genM.value;
        var est = document.formulario1.estM.value;
	var dem = document.formulario1.demM.value;
        var sto = document.formulario1.stoM.value;
	var cos = document.formulario1.cosM.value;
	var url = document.formulario1.urlM.value;
	
        var expresion1=/^https?:\/\/[\w\-]+(\.[\w\-]+)+[/#?]?.*$/;
	var expresion2= /^[0-9]+$/;//numeros
	var expresion3=/^[A-Za-z]+$/;//solo letras
	var expresion4=/^[a-zA-Z0-9.\s]+$/;//cont y cuenta
	var expresion6=/^[a-zA-ZÀ-ÿ0-9\u00f1\u00d1]+(\s*[a-zA-ZÀ-ÿ0-9\u00f1\u00d1]*)*[a-zA-ZÀ-ÿ0-9\u00f1\u00d1]+$/;
        var expresion7= /^[0-9]+([\.][0-9]+)?$/;

	var exp1=expresion6.test(nombre);
        var exp2=expresion6.test(des);
	var exp3=expresion7.test(cos);
        var exp4=expresion2.test(sto);
        var exp5=expresion1.test(url);
        
        
	if (nombre!=="" || cos!=="" || des!=="" || url!=="") {
		if (exp1==false) {
			alert("Recuerda no ingresar caracteres expeciales en el nombre");
			return false;
		}else if(exp3==false){
			alert("Recuerda solo numeros enteros y decimales en el costo");
			return false;
		}else if(exp2==false){
			alert("Recuerda no ingresar caracteres expeciales en la descripcion");
			return false;
                }else if(exp4==false){
                        alert("Recuerda no ocupar decimales en el stock");
                        return false;
		}else if (dem!=="Shounen" && dem!=="Seinen" && dem!=="Shoujo" && dem!=="Josei" && dem!=="Kodomo") {
			alert("No cambie las demografias");
			return false;
		}else if (gen!=="Accion" &&gen!=="Drama" &&gen!=="Psico" &&gen!=="Romance" &&gen!=="Slice of life" &&gen!=="Gore" ) {
			alert("No cambie el genero");
			return false;
		}else if (est!=="Finalizado" && est!=="Publicandose") {
			alert("No cambie el estado ");
                        return false;
                }else if(edi!=="Panini" && edi!=="Kamite"){
                        alert("No cambie la editorial");
                        return false;
                }else if (exp5==false) {
			alert("Hay un problema con la URL ingresada");
                        return false;
		}else{
                        var lonombre=nombre.length;
                        var stock = nombre.length;
                        var lodes=des.length;
                        var lourl=url.length;

			if (lonombre>50) {
				alert("El nombre no puede contener mas de 50 caracteres");
				return false;
			}else if(cos>1000000000000){
				alert("No ingreses un costo tan extenso");
				return false;
                        }else if(stock>10000000000){
				alert("No ingreses un stock tan extenso");
				return false;
			}else if(lodes>500) {
				alert("En la descripcion se permiten hasta 500 caracteres");
				return false;
			}else if (lourl>1500) {
				alert("En la url solo se permiten hasta 1500 caracteres");
				return false;
			}else{
				alert("bien");
				return true;
			}
		}
	}else{
		alert("No deje campos vacios");
		return false;
	}
}
function validarT(){

	var tipTar =document.tarjeta.tipTar.value;
        if(tipTar!=="Tarjeta" && tipTar!=="PayPal" && tipTar!=="Efectivo"){
            alert("No cambies el tipo de tarjeta >:/ ");
            return false;
	}else{
        if(tipTar=="PayPal" || tipTar=="Efectivo"){
            return true;
        }else{
	var numTar =document.tarjeta.numTar.value;
	var mesTar =document.tarjeta.mesTar.value;
	var anoTar =document.tarjeta.anoTar.value;
	var codTar =document.tarjeta.codTar.value;
	var nomTar =document.tarjeta.nomTar.value;
	var appatTar =document.tarjeta.appatTar.value;
	var apmatTar =document.tarjeta.apmatTar.value;
	
	var expresion = new RegExp("^[A-Z]{3,20}"); // nombre, apellidos
	var expresion1 = new RegExp("^[0-9]{16}"); //numero de tarjeta
	var expresion2 = new RegExp("^[0-9]{3}");//codigo de tarjeta
	var expresion3 = new RegExp("^(0[1-9]|1[0-2])$");// mes
	var expresion4 = new RegExp("^[0-9]{4}$");// ano

	var exp1 = expresion.test(nomTar);
	var exp2 = expresion.test(appatTar);
	var exp3 = expresion.test(apmatTar);
	var exp4 = expresion1.test(numTar);
	var exp5 = expresion2.test(codTar);
	var exp6 = expresion3.test(mesTar);
	var exp7 = expresion4.test(anoTar);

	if(tipTar=="" || numTar=="" || mesTar=="" || anoTar=="" || codTar=="" || nomTar=="" || appatTar=="" || apmatTar==""){
		alert("No deje campos vacios");
		return false;
	}else{
		if (exp1===false){
			alert("Nombre en mayúsculas, entre 3 y 20 caracteres, sin espacios y sin acentos");
			return false;
		}else if(exp2===false){
			alert("Apellidos en mayúsculas, entre 3 y 20 caracteres, sin espacios y sin acentos");
			return false;
		}else if(exp3===false){
			alert("Apellidos en mayúsculas, entre 3 y 20 caracteres, sin espacios y sin acentos");
			return false;
		}else if(exp4===false){
			alert("Numero de Tarjeta en números enteros, sin espacios, 16 caracteres en total ");
			return false;
		}else if(exp5===false){
			alert("Código de Seguridad en números enteros, 3 caracteres en total");
			return false;
		}else if(exp6===false) {
			alert("Ingrese un mes válido: 00");
			return false;
		}else if(exp7===false){
			alert("Ingrese un año válido: 0000");
			return false;
		}else{
			var f = new Date();
			fecha=(f.getMonth()+1)+"/"+f.getFullYear();
			if(mesTar==(f.getMonth()+1) && anoTar==f.getFullYear()){
				alert("Su tarjeta se vencio");
				return false;
			}else if(mesTar<(f.getMonth()+1) && anoTar==f.getFullYear()){
				alert("Su tarjeta se vencio");
				return false;
			}else if(anoTar<f.getFullYear()){
				alert("Su tarjeta se vencio");
				return false;
			}else{
				return true;
			}
		}
	}
        }
        }
}




