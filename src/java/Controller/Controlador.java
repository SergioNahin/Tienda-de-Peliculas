/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Config.Fecha;
import Model.Carrito;
import Model.Cliente;
import Model.Compra;
import Model.Producto;
import ModelDAO.CompraDAO;
import ModelDAO.ProductoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Sergio Trinidad
 */
public class Controlador extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    ProductoDAO pdao = new ProductoDAO();
    Producto p = new Producto();
    List<Producto> productos = new ArrayList<>();
    List<Carrito> listaCarrito = new ArrayList<>();
    int item;
    double totalPagar = 0.0;
    int cantidad = 1;
    int idp;
    Carrito car;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accion = request.getParameter("accion");
        productos = pdao.listar();
        switch (accion) {
            case "AgregarCarrito":
                int pos = 0;
                cantidad = 1;
                int idp = Integer.parseInt(request.getParameter("id"));
                p = pdao.listarId(idp);
                if (listaCarrito.size() > 0) {
                    for (int i = 0; i < listaCarrito.size(); i++) {
                        if (idp == listaCarrito.get(i).getIdProducto()) {
                            pos = i;
                        }
                    }
                    if (idp == listaCarrito.get(pos).getIdProducto()) {
                        cantidad = listaCarrito.get(pos).getCantidad() + cantidad;
                        double subtotal = listaCarrito.get(pos).getPrecioCompra() * cantidad;
                        listaCarrito.get(pos).setCantidad(cantidad);
                        listaCarrito.get(pos).setSubTotal(subtotal);
                    } else {
                        item = item + 1;
                        Carrito car = new Carrito();
                        car.setItem(item);
                        car.setIdProducto(p.getId());
                        car.setNombres(p.getNombres());
                        car.setDescripcion(p.getDescripcion());
                        car.setPrecioCompra(p.getPrecio());
                        car.setCantidad(cantidad);
                        car.setSubTotal(cantidad * p.getPrecio());
                        listaCarrito.add(car);
                    }

                } else {
                    item = item + 1;
                    Carrito car = new Carrito();
                    car.setItem(item);
                    car.setIdProducto(p.getId());
                    car.setNombres(p.getNombres());
                    car.setDescripcion(p.getDescripcion());
                    car.setPrecioCompra(p.getPrecio());
                    car.setCantidad(cantidad);
                    car.setSubTotal(cantidad * p.getPrecio());
                    listaCarrito.add(car);

                }
                request.setAttribute("contador", listaCarrito.size());
                request.getRequestDispatcher("Controlador?accion=home").forward(request, response);
                
                break;
            case "Delete":
                int idproducto = Integer.parseInt(request.getParameter("idp"));
                for(int i = 0; i < listaCarrito.size(); i++){
                    if(listaCarrito.get(i).getIdProducto() == idproducto ){
                        listaCarrito.remove(i);
                    }
                }
                break;
                
            case "Carrito":
                totalPagar = 0.0;
                request.setAttribute("carritop", listaCarrito);
                for (int i = 0; i < listaCarrito.size(); i++) {
                    totalPagar = totalPagar + listaCarrito.get(i).getSubTotal();
                }
                request.setAttribute("totalpagar", totalPagar);
                request.getRequestDispatcher("vistas/carrito.jsp").forward(request, response);
                
                break;
                
            case "Comprar":
                totalPagar = 0.0;
                idp = Integer.parseInt(request.getParameter("id"));
                p = pdao.listarId(idp);
                item = item + 1;

                car = new Carrito();
                car.setItem(item);
                car.setIdProducto(p.getId());
                car.setNombres(p.getNombres());
                car.setDescripcion(p.getDescripcion());
                car.setPrecioCompra(p.getPrecio());
                car.setCantidad(cantidad);
                car.setSubTotal(cantidad * p.getPrecio());
                listaCarrito.add(car);

                for (int i = 0; i < listaCarrito.size(); i++) {
                    totalPagar = totalPagar + listaCarrito.get(i).getSubTotal();
                }
                request.setAttribute("totalpagar", totalPagar);
                request.setAttribute("carritop", listaCarrito);
                request.setAttribute("contador", listaCarrito.size());
                request.getRequestDispatcher("vistas/carrito.jsp").forward(request, response);
                
                break;
                
            case "ActualizarCantidad":
              int idpro = Integer.parseInt(request.getParameter("idp"));
              int cant = Integer.parseInt(request.getParameter("Cantidad"));
              
              for(int i = 0; i< listaCarrito.size(); i++){
                if(listaCarrito.get(i).getIdProducto() == idpro){
                    listaCarrito.get(i).setCantidad(cant);
                    double st = listaCarrito.get(i).getPrecioCompra()*cant; //calculo subtotal
                    listaCarrito.get(i).setSubTotal(st);
                }
              }

                break;
            case "GenerarCompra":
                Cliente cliente = new Cliente();
                cliente.setId(1);
                CompraDAO dao = new CompraDAO();
                
                Compra compra = new Compra(cliente, 1, Fecha.FechaBD(), totalPagar, "Procesando Pago", listaCarrito);
                
                int res = dao.GenerarCompra(compra);
                if(res!=0&&totalPagar>0){
                    request.getRequestDispatcher("vistas/mensaje.jsp").forward(request, response);
                    
                }else{
               request.getRequestDispatcher("vistas/error.jsp").forward(request, response);

                }
                
                break;
            default:
                request.setAttribute("productos", productos);
                request.getRequestDispatcher("index.jsp").forward(request, response);
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
