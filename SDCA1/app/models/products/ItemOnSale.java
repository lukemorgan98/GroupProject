package models.products;

import java.util.*;
import javax.persistence.*;
import io.ebean.*;
import play.data.format.*;
import play.data.validation.*;

@Entity
public class ItemOnSale extends Model {

    // Properties
    @Id
    private Long id;
    @Constraints.Required
    private String name;
    @Constraints.Required
    private String description;
    @Constraints.Required
    private int stock;
    @Constraints.Required
    private double price;

    @ManyToMany(cascade=CascadeType.ALL, mappedBy = "items")
    private List<Category> categories;

    private List<Long> catSelect = new ArrayList<Long>();

    // Default Constructor
    public ItemOnSale() {
    }

    // Constructor to initialise object
    public ItemOnSale(Long id, String name, String description, int stock, double price) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.stock = stock;
        this.price = price;
    }

    public static final Finder<Long, ItemOnSale> find = new Finder<>(ItemOnSale.class);
			    
    public static final List<ItemOnSale> findAll() {
        return ItemOnSale.find.all();
    }
    public static List<ItemOnSale> findAll(String filter){

        return ItemOnSale.find.query().where()
            .ilike("name", "%" + filter + "%")
            .orderBy("name asc")
            .findList();
        
    }
    public static List<ItemOnSale> findFilter(Long catID, String filter){

        return ItemOnSale.find.query().where()

                        .eq("categories.id", catID)
                        .ilike("name", "%" + filter + "%")
                        .orderBy("name asc")
                        .findList();
    }

    // Accessor methods
    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getDescription() {
        return description;
    }
    public void setDescription(String description) {
        this.description = description;
    }
    public int getStock() {
        return stock;
    }
    public void setStock(int stock) {
        this.stock = stock;
    }
    public double getPrice() {
        return price;
    }
    public void setPrice(double price) {
        this.price = price;
}

public List<Category> getCategories() {
    return categories;
}
public void setCategories(List <Category> categories) {
    this.categories = categories;
}
public List<Long> getCatSelect() {
    return catSelect;
}
public void setCatSelect(List<Long> catSelect) {
    this.catSelect = catSelect;
}

public void decrementStock(){
    stock-=1;
}

public void incrementStock(){
    stock+=1;
}
public void incrementStock(int q){
    stock+=q;
}
}