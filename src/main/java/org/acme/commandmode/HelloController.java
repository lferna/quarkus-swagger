package org.acme.commandmode;


import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;

import org.jboss.resteasy.annotations.jaxrs.PathParam;

@Path("/hello")
public class HelloController {

	@GET
    @Path("/name/{name}")
    @Produces("application/json")
    String hello(@PathParam String name){
		return "Hello: "+name;
	}
	
}
