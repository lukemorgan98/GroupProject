package controllers;

import play.mvc.*;

import views.html.*;

import play.api.Environment;
import play.data.*;
import play.db.ebean.Transactional;

import java.util.ArrayList;
import java.util.List;
import javax.inject.Inject;

import models.*;
import models.users.*;
import models.products.*;

import play.mvc.Http.*;
import play.mvc.Http.MultipartFormData.FilePart;
import java.io.File;

import java.io.IOException;
import java.awt.image.*;
import javax.imageio.*;
import org.imgscalr.*;

/**
 * This controller contains an action to handle HTTP requests
 * to the application's home page.
 */
public class HomeController extends Controller {

    private FormFactory formFactory;
    private Environment e;

    @Inject
    public HomeController(FormFactory f,Environment env) {
        this.formFactory = f;
        this.e = env;
}
    /**
     * An action that renders an HTML page with a welcome message.
     * The configuration in the <code>routes</code> file means that
     * this method will be called when the application receives a
     * <code>GET</code> request with a path of <code>/</code>.
     */
    public Result onsale(Long cat, String filter) {
        List<ItemOnSale> itemList = null;
        List<Category> categoryList = Category.findAll();

        if(cat ==0){
            itemList = ItemOnSale.findAll(filter);
        }else {
            itemList = ItemOnSale.findFilter(cat,filter);
        }

        return ok(onsale.render(itemList, categoryList,cat,filter, User.getUserById(session().get("email")),e));
     }

     public Result index() {
        return ok(index.render(User.getUserById(session().get("email"))));
    }

    public Result about() {
        return ok(about.render(User.getUserById(session().get("email"))));
    }
    @Security.Authenticated(Secured.class)
    public Result addItem() {
        Form<ItemOnSale> itemForm = formFactory.form(ItemOnSale.class);
        return ok(addItem.render(itemForm,User.getUserById(session().get("email"))));
}
@Security.Authenticated(Secured.class)
@Transactional
public Result addItemSubmit() {
    Form<ItemOnSale> newItemForm = formFactory.form(ItemOnSale.class).bindFromRequest();

    if (newItemForm.hasErrors()) {
        return badRequest(addItem.render(newItemForm,User.getUserById(session().get("email"))));
    } else {
        ItemOnSale newItem = newItemForm.get();

        List<Category> newCats = new ArrayList<Category>();
        for (Long cat : newItem.getCatSelect()) {
            newCats.add(Category.find.byId(cat));
        }
        newItem.setCategories (newCats);
        
        if(newItem.getId()==null){
        newItem.save();
        }else{
            newItem.update();
        }

        MultipartFormData data = request().body().asMultipartFormData();
        
        FilePart image = data.getFile("upload");

        String saveImageMessage = saveFile(newItem.getId(), image);
        flash("success", "Item " + newItem.getName() + " was added/updated" +saveImageMessage);
        return redirect(controllers.routes.HomeController.onsale(0,""));
    }
}

public String saveFile(Long id, FilePart<File> uploaded) {
    // Make sure that the file exists.
    if (uploaded != null) {
        // Make sure that the content is actually an image.
        String mimeType = uploaded.getContentType();
        if (mimeType.startsWith("image/")) {
            // Get the file name.
            String fileName = uploaded.getFilename();
            // Extract the extension from the file name.
            String extension = "";
            int i = fileName.lastIndexOf('.');
            if (i >= 0) {
                extension = fileName.substring(i + 1);
            }
            // Now we save the file (not that if the file is saved without
            // a path specified, it is saved to a default location,
            // usually the temp or tmp directory).
            // 1) Create a file object from the uploaded file part.
            File file = uploaded.getFile();
            // 2) Make sure that our destination directory exists and if 
            //    not create it.
            File dir = new File("public/images/productImages");
            if (!dir.exists()) {
                dir.mkdirs();
            }
            // 3) Actually save the file.
            File newFile = new File("public/images/productImages/", id + "." + extension);
            if (file.renameTo(newFile)) {
                try {
                    BufferedImage img = ImageIO.read(newFile); 
                    BufferedImage scaledImg = Scalr.resize(img, 234);
                    
                    if (ImageIO.write(scaledImg, extension, new File("public/images/productImages/", id + "thumb.jpg"))) {
                        return "/ file uploaded and thumbnail created.";
                    } else {
                        return "/ file uploaded but thumbnail creation failed.";
                    }
                } catch (IOException e) {
                    return "/ file uploaded but thumbnail creation failed.";
                }
            } else {
                return "/ file upload failed.";
            }

        }
    }
    return "/ no image file.";
}

@Security.Authenticated(Secured.class)
@Transactional
@With(AuthAdmin.class)
public Result deleteItem(Long id) {


    ItemOnSale.find.ref(id).delete();

    // Now write to the flash scope, as we did for the successful item creation.
    flash("success", "Item has been deleted.");
    // And redirect to the onsale page
    return redirect(controllers.routes.HomeController.onsale(0,""));
}
@Security.Authenticated(Secured.class)
public Result updateItem(Long id) {
    ItemOnSale i;
    Form<ItemOnSale> itemForm;

    try {
        // Find the item by id
        i = ItemOnSale.find.byId(id);

        // Populate the form object with data from the item found in the database
        itemForm = formFactory.form(ItemOnSale.class).fill(i);
    } catch (Exception ex) {
        return badRequest("error");
    }

    // Display the "add item" page, to allow the user to update the item
    return ok(addItem.render(itemForm,User.getUserById(session().get("email"))));
}
@Security.Authenticated(Secured.class)
@Transactional
@With(AuthAdmin.class)
public Result deleteAdmin(String email) {

    // The following line of code finds the item object by id, then calls the delete() method
    // on it to have it removed from the database.

    Administrator u = (Administrator) User.getUserById(email);
    u.delete();

    // Now write to the flash scope, as we did for the successful item creation.
    flash("success", "User has been deleted.");
    // And redirect to the onsale page
    return redirect(controllers.routes.HomeController.usersAdmin());
}
@Security.Authenticated(Secured.class)
public Result updateAdmin(String email) {
    Administrator u;
    Form<Administrator> userForm;

    try {
        // Find the item by email
        u = (Administrator)User.getUserById(email);
        u.update();

        // Populate the form object with data from the user found in the database
        userForm = formFactory.form(Administrator.class).fill(u);
    } catch (Exception ex) {
        return badRequest("error");
    }

    // Display the "add item" page, to allow the user to update the item
    return ok(addAdmin.render(userForm,User.getUserById(session().get("email"))));
}

@Security.Authenticated(Secured.class)
public Result addAdmin() {
    Form<Administrator> userForm = formFactory.form(Administrator.class);
    return ok(addAdmin.render(userForm,User.getUserById(session().get("email"))));
}
@Security.Authenticated(Secured.class)
@Transactional
public Result addAdminSubmit() {
Form<Administrator> newUserForm = formFactory.form(Administrator.class).bindFromRequest();
if (newUserForm.hasErrors()) {
    
    return badRequest(addAdmin.render(newUserForm,User.getUserById(session().get("email"))));
} else {
    Administrator newUser = newUserForm.get();
    System.out.println("Name: "+newUserForm.field("name").getValue().get());
    System.out.println("Email: "+newUserForm.field("email").getValue().get());
    System.out.println("Password: "+newUserForm.field("password").getValue().get());
    System.out.println("Role: "+newUserForm.field("role").getValue().get());
    
    if(User.getUserById(newUser.getEmail())==null){
        newUser.save();
    }else{
        newUser.update();
    }
    flash("success", "User " + newUser.getName() + " was added/updated.");
    return redirect(controllers.routes.HomeController.usersAdmin()); 
    }
}
@Security.Authenticated(Secured.class)
public Result addCustomer() {
    Form<Customer> cForm = formFactory.form(Customer.class);
    return ok(addCustomer.render(cForm,User.getUserById(session().get("email"))));
}
@Security.Authenticated(Secured.class)
@Transactional
public Result addCustomerSubmit() {
Form<Customer> newUserForm = formFactory.form(Customer.class).bindFromRequest();
if (newUserForm.hasErrors()) {
    
    return badRequest(addCustomer.render(newUserForm,User.getUserById(session().get("email"))));
} else {
    Customer newUser = newUserForm.get();
    System.out.println("Name: "+newUserForm.field("name").getValue().get());
    System.out.println("Email: "+newUserForm.field("email").getValue().get());
    System.out.println("Password: "+newUserForm.field("password").getValue().get());
    System.out.println("Role: "+newUserForm.field("role").getValue().get());
    
    if(User.getUserById(newUser.getEmail())==null){
        newUser.save();
    }else{
        newUser.update();
    }
    flash("success", "User " + newUser.getName() + " was added/updated.");
    return redirect(controllers.routes.HomeController.usersCustomer()); 
    }
}
@Security.Authenticated(Secured.class)
@Transactional
@With(AuthAdmin.class)
public Result deleteCustomer(String email) {

    // The following line of code finds the item object by id, then calls the delete() method
    // on it to have it removed from the database.

    Customer u = (Customer) User.getUserById(email);
    u.delete();

    // Now write to the flash scope, as we did for the successful item creation.
    flash("success", "User has been deleted.");
    // And redirect to the onsale page
    return redirect(controllers.routes.HomeController.usersCustomer());
}
@Security.Authenticated(Secured.class)
public Result updateCustomer(String email) {
    Customer u;
    Form<Customer> userForm;

    try {
        // Find the item by email
        u = (Customer) User.getUserById(email);
        u.update();

        // Populate the form object with data from the user found in the database
        userForm = formFactory.form(Customer.class).fill(u);
    } catch (Exception ex) {
        return badRequest("error");
    }

    // Display the "add item" page, to allow the user to update the item
    return ok(addCustomer.render(userForm,User.getUserById(session().get("email"))));
}
public Result usersAdmin() {
    List<Administrator> userList = null;

    userList = Administrator.findAll();

    return ok(admin.render(userList,User.getUserById(session().get("email"))));

 }

 public Result usersCustomer() {
    List<Customer> cList = null;

    cList = Customer.findAll();

    return ok(customers.render(cList,User.getUserById(session().get("email"))));

 }

}