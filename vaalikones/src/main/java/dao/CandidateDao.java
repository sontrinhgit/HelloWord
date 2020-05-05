package dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import persist.Ehdokkaat;

public class CandidateDao {
	private static EntityManagerFactory emf;
	
	private static EntityManager getEntityManager() {
		if(emf==null) {
			emf = Persistence.createEntityManagerFactory("vaalikones");
		}
		return emf.createEntityManager();
	}
	
	public static List<Ehdokkaat> getAllCandidates(){
		EntityManager em = getEntityManager();
		List<Ehdokkaat> candidateList = em.createQuery("SELECT e FROM Ehdokkaat e").getResultList();
		em.close();
		return candidateList;
	}
	
	public static Ehdokkaat getOneCandidate(int id) {
		EntityManager em = getEntityManager();
		Ehdokkaat candidate = em.find(Ehdokkaat.class, id);
		em.close();
		return candidate;
	}
}
