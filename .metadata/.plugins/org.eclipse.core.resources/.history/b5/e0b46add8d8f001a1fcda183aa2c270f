package rest;

import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.core.MediaType;

import dao.AnswerDao;

@Path("/answerservice")
public class AnswerService {

	@Path("/updateanswer/{p1}/{p2}/{p3}")
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	public void updateAnswer(@PathParam("p1") int candidateId, @PathParam("p2") int questionId,
			@PathParam("p3") int newAnswer) {
		AnswerDao.updateAnswer(candidateId, questionId, newAnswer);
	}
}
