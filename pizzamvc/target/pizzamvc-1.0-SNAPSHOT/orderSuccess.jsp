<%-- 
    Document   : order
    Created on : Feb 7, 2017, 3:13:05 PM
    Author     : John Phillips updated by Patrick Ross
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="pizzamvc.PizzaOrder"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pat's JSP Pizza Order</title>
        <link rel="stylesheet" href="mystyle.css">
    </head>
    <body>
        <h1>Thank you for your order!</h1>
        <h2>Order details:</h2>
        <p>Email = ${myOrder.email}</p>
        <p>Size = ${myOrder.size}</p>
        <p> Crust =${param.crust}</p>
        
        <p>Toppings: 
            <%
                // Checkboxes from a form may or may not be checked. We can use the
                // following code to get an array of the values that are checked.
                PizzaOrder po = (PizzaOrder) request.getAttribute("myOrder");
                String toppings[] = request.getParameterValues("toppings");
            double price = 0.00;
            DecimalFormat df = new DecimalFormat("0.00"); 
            if (toppings != null && toppings.length != 0) {
                out.println("<p>Toppings: ");
                for (String myTopping : toppings) {
                    out.println(myTopping + ", ");
                }
                out.println("</p>");
                price += toppings.length * 0.75;
            }
            
            switch (request.getParameter("size")) {
                case "large": price += 7.00; break;
                case "medium": price += 6.00; break;
                case "small": price += 5.00; break;
            }
            
            switch (request.getParameter("crust")) {
                case "pan": price += 1.00; break;
                case "hand-tossed": price += 0.50; break;
                case "thin": price += 0.00; break;
            }
            
            out.println("<p>Price = $" + df.format(price) + "</p>");
                if (po.getToppings() != null && po.getToppings().length != 0) {
                    for (String myTopping : po.getToppings()) {
                        out.println(myTopping + ", ");
                    }
                } else {
                    out.println(" no toppings were requested");
                }
            %>
        </p>
        <p><a href='home.html'>Return to home page</a></p>
    </body>
</html>
