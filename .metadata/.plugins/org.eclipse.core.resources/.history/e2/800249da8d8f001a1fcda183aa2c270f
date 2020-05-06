package dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import persist.Ehdokkaat;
public class CandidateDao {
	private static EntityManagerFactory emf;
	
	private static EntityManager getEntityManager() {
		if(emf==null) {
			emf=Persistence.createEntityManagerFactory("vaalikones");
			
		}
		return emf.createEntityManager();
	}
	public static void addCandidate(Ehdokkaat candidate ) {
		EntityManager em = getEntityManager();
		em.getTransaction().begin();
		em.persist(candidate);
		em.getTransaction().commit();
		em.close();
	}
	
	public static void updateCandidate (Ehdokkaat newCan) {
		EntityManager em = getEntityManager();
		Ehdokkaat Can = em.find(Ehdokkaat.class,newCan.getEhdokasId());
		em.getTransaction().begin();
		Can.setSukunimi(newCan.getSukunimi());
		Can.setEtunimi(newCan.getEtunimi());
		Can.setIka(newCan.getIka());
		Can.setKotipaikkakunta(newCan.getKotipaikkakunta());
		Can.setAmmatti(newCan.getAmmatti());
		Can.setMiksiEduskuntaan(newCan.getMiksiEduskuntaan());
		Can.setMitaAsioitaHaluatEdistaa(newCan.getMitaAsioitaHaluatEdistaa());
		Can.setPuolue(newCan.getPuolue());
		em.getTransaction().commit();
		em.close();
		}
		
	public static List<Ehdokkaat> getAllCandidate(){
		EntityManager em =getEntityManager();
		Query q = em.createQuery("select a from Ehdokkaat a");
		List<Ehdokkaat> CandidateList = q.getResultList();
		em.close();
		return CandidateList;
	}
	
	public static Ehdokkaat getOneCandidate(int ehdokasId) {
		EntityManager em = getEntityManager();
		Ehdokkaat CanInform = em.find(Ehdokkaat.class, ehdokasId);
		em.close();
		return CanInform;
	}
	
	public static boolean deleteCandidate(int ehdokasId) {
		EntityManager em = getEntityManager();
		Ehdokkaat e = em.find(Ehdokkaat.class,ehdokasId);
		if(e!=null) {
			em.getTransaction().begin();
			em.remove(e);
			
			em.getTransaction().commit();
			em.close();
			return true;
		}
		return false;
	}
		
	}
	

