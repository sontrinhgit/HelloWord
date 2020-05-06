package dao;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import persist.Vastaukset;

public class AnswerDao {
	private static EntityManagerFactory emf;

	private static EntityManager getEntityManager() {
		if (emf == null) {
			emf = Persistence.createEntityManagerFactory("vaalikones");
		}
		return emf.createEntityManager();
	}

	public static void updateAnswer(int candidateId, int questionId, int newAnswer) {
		EntityManager em = getEntityManager();
		Vastaukset answer = em.find(Vastaukset.class, new Vastaukset(candidateId, questionId));
		if (answer != null) {
			em.getTransaction().begin();
			answer.setVastaus(newAnswer);
			em.getTransaction().commit();
			em.close();
		} else {
			System.out.println("not exist!");
		}

	}
}
