package models.shopping;

import java.util.*;
import javax.persistence.*;

import io.ebean.*;
import play.data.format.*;
import play.data.validation.*;

import java.util.Date;

import models.products.*;
import models.users.*;

import java.text.SimpleDateFormat;

import java.util.Calendar;

// ShopOrder entity managed by Ebean
@Entity
public class ShopOrder extends Model {

    @Id
    private Long id;
    
    private Calendar orderDate;
    
    // Order contains may items.
    // mappedBy makes this side of the mapping the owner
    // so foreign key will be placed in resulting OrderItem table
    // All changes, including deletes will be cascaded
    @OneToMany(mappedBy="order", cascade = CascadeType.ALL)
    private List<OrderItem> items;
    
    @ManyToOne
    private Customer customer;

    // Default constructor
    public  ShopOrder() {
        orderDate = Calendar.getInstance();
    }
    
    public double getOrderTotal() {
        
        double total = 0;
        
        for (OrderItem i: items) {
            total += i.getItemTotal();
        }
        return total;
    }
	
	//Generic query helper
    public static Finder<Long,ShopOrder> find = new Finder<Long,ShopOrder>(ShopOrder.class);

    //Find all Products in the database
    public static List<ShopOrder> findAll() {
        return ShopOrder.find.all();
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Calendar getOrderDate() {
        return orderDate;
    }

    public String getOrderDateString(){
        if(orderDate == null){
            return "No Date Availiable";
        }
        String s = new SimpleDateFormat("dd-MMM-yyyy").format(orderDate.getTime());
        return s;
    }

    public void setOrderDate(Calendar orderDate) {
        orderDate = orderDate;
    }

    public List<OrderItem> getItems() {
        return items;
    }

    public void setItems(List<OrderItem> items) {
        this.items = items;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public void adjustStock(){
        for (OrderItem i : items){
            ItemOnSale ios = ItemOnSale.find.byId(i.getItem().getId());
            if(i.getItem().getId() == ios.getId()){
                int quantity = i.getQuantity();
                ios.incrementStock(quantity);
                ios.update();
            }
        }
    }





}