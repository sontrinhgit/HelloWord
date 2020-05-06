package rest;

import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.WebApplicationException;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import dao.CandidateDao;
import persist.Ehdokkaat;

@Path("/electionservice")
public class CandidateService {
	
	@Path("/addcandidate")
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	public void addCandidate(Ehdokkaat candidate) {
		CandidateDao.addCandidate(candidate);
	}
	
	
	@Path("/updatecandidate")
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	public void updateCandidate(Ehdokkaat newCan) {
		
		CandidateDao.updateCandidate(newCan);
	}
	
	@Path("/getonecandidate")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public Ehdokkaat getonecandidate(int ehdokasId) {
		return CandidateDao.getOneCandidate(ehdokasId);
	}
	
	@DELETE
	@Path("/deletecandidate/{id}")
	public boolean deleteCandidate (@PathParam("id") int id) {
		return CandidateDao.deleteCandidate(id);
	}
}
	
	