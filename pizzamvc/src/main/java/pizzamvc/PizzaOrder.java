package pizzamvc;

import java.util.Arrays;

/**
 * A class that represents a single pizza order.
 *
 * @author John Phillips
 */
public class PizzaOrder {

    private String email;
    private String size;
    private String[] toppings;

    public PizzaOrder() {
        email = "";
        size = "";
        toppings = null;
    }

    public PizzaOrder(String email, String size, String[] toppings) {
        this.email = email;
        this.size = size;
        this.toppings = toppings;
    }

    public String[] getToppings() {
        return toppings;
    }

    public void setToppings(String[] toppings) {
        this.toppings = toppings;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    @Override
    public String toString() {
        return "PizzaOrder{" + "email=" + email + ", size=" + size
                + ", toppings=" + Arrays.toString(toppings) + '}';
    }
}
