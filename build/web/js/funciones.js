$(document).ready(function () {
    $("tr #btnDelete").click(function () {
        var idp = $(this).parent().find("#idp").val();
        
        swal({
            title: "¿Estás seguro?", 
            text: "Una vez eliminado, la pelicula saldra de su carrito",
            icon: "warning",
            buttons: true,
            dangerMode: true,
        })
                .then((willDelete) => {
                    if (willDelete) {
                        eliminar(idp);
                        swal("Poof! ¡Su Pelicula ha sido eliminada del carrito!", {
                            icon: "success",
                        }).then((willDelete => {
                            if(willDelete){
                                parent.location.href = "Controlador?accion=Carrito";
                            }
                        }));
                    } else {
                        swal("Pelicula no Eliminada!");
                    }
                });
            });
    function eliminar(idp) {
        var url = "Controlador?accion=Delete";
        $.ajax({
            type: 'POST',
            url: url,
            data: "idp=" + idp,
            success: function (data, textStatus, jqXHR) {
              
            }
        });

    } 
  
    $("tr #Cantidad").click(function () {
       var idp = $(this) .parent().find("#idpro").val();
       var cantidad = $(this).parent().find("#Cantidad").val();
       var url = "Controlador?accion=ActualizarCantidad";
       $.ajax({
            type: 'POST',
            url: url,
            data: "idp="+idp+"&Cantidad="+cantidad,
            success: function (data, textStatus, jqXHR) {
                location.href = "Controlador?accion=Carrito";
            }
       });
    });
    
    
    
    
    
    
});



