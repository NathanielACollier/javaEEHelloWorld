package javaEEHelloWorld;
import javax.ws.rs.Consumes;
import javax.ws.rs.Produces;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.core.MediaType;
import javaEEHelloWorld.models.RestString;


// It's good practice to include a version number in the path so you can have
// multiple versions deployed at once. That way consumers don't need to upgrade
// right away if things are working for them.

@Path("general")
public class General {
	
	@GET
	@Path("hello")
	@Produces(MediaType.APPLICATION_JSON)
	public RestString getHelloWorld(){
		RestString result = new RestString();
		result.Val = "Hello World";
		return result;
	}
}
