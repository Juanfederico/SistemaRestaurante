	function agregarComanda(){
		if(document.getElementById('Comanda2').style.display === "none"){
			document.getElementById('Comanda2').style.display = "inline";
		}
		else if(document.getElementById('Comanda3').style.display === "none"){
			document.getElementById('Comanda3').style.display = "inline";
		}
		else if(document.getElementById('Comanda4').style.display === "none"){
			document.getElementById('Comanda4').style.display = "inline";
		}
		else if(document.getElementById('Comanda5').style.display === "none"){
			document.getElementById('Comanda5').style.display = "inline";
		}
	}

	function quitarComanda(){
		if(document.getElementById('Comanda5').style.display === "inline"){
			document.getElementById('Comanda5').style.display = "none";
			$("#tipoProducto5").val(-1);
			$("#Producto5").val(-1);
			document.getElementById('Cantidad5').value = "";
		}
		else if(document.getElementById('Comanda4').style.display === "inline"){
			document.getElementById('Comanda4').style.display = "none";
			$("#tipoProducto4").val(-1);
			$("#Producto4").val(-1);
			document.getElementById('Cantidad4').value = "";
		}
		else if(document.getElementById('Comanda3').style.display === "inline"){
			document.getElementById('Comanda3').style.display = "none";
			$("#tipoProducto3").val(-1);
			$("#Producto3").val(-1);
			document.getElementById('Cantidad3').value = "";
		}
		else if(document.getElementById('Comanda2').style.display === "inline"){
			document.getElementById('Comanda2').style.display = "none";
			$("#tipoProducto2").val(-1);
			$("#Producto2").val(-1);
			document.getElementById('Cantidad2').value = "";
		}
	}