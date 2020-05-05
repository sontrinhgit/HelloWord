package rest;

import java.util.List;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import dao.CandidateDao;
import persist.Ehdokkaat;

@Path("/candidateservice")
public class CandidateService {

	@Path("/getallcandidates")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public List<Ehdokkaat> getAllCandidates(){
		return CandidateDao.getAllCandidates();
	}
	
}
