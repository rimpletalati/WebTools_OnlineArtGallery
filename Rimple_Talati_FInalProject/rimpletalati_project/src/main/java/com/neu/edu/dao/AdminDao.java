package com.neu.edu.dao;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;

import com.neu.edu.model.Admin;
import com.neu.edu.model.PaintingCategory;
import com.neu.edu.model.Person;
import com.neu.edu.model.Supplier;
import com.neu.edu.model.UserAccount;
import com.neu.edu.model.UserRole;

public class AdminDao extends DAO {

	public void checkAdminCreated() throws Exception {

		Session session = getSession();
		try {
			// begin();
			
			Query q = session.createQuery("from Admin");
			if (q.list().size() == 0) {
				Admin admin = new Admin();
				admin.setFirstName("admin fname");
				admin.setLastName("admin lname");

				UserAccount userAccount = new UserAccount();
				userAccount.setUsername("admin");
				userAccount.setPassword("a");
				userAccount.setPerson(admin);
				userAccount.setRole(UserRole.ROLE_ADMIN);

				session.beginTransaction();
				session.save(admin);
				session.save(userAccount);

				session.getTransaction().commit();
				

			}
			// commit();
		} catch (HibernateException e) {
			// rollback();
			throw new Exception("Could not get user" + e);
		}
		finally
		{
			session.close();
		}


	}

	public void addSupplierToDb(String firstname, String lastname,
			String username, String password) throws Exception {
		Session session = getSession();
		try {

			// begin();
			
			session.beginTransaction();

			Supplier supplier = new Supplier();
			supplier.setSupplierName(firstname +" "+ lastname);

			UserAccount userAccount = new UserAccount();
			userAccount.setUsername(username);
			userAccount.setPassword(password);
			userAccount.setRole(UserRole.ROLE_SUPPLIER);
//			Person p = new Person();
//			p.setFirstName(firstname);
//			p.setLastName(lastname);
			
			userAccount.setPerson(supplier);
//			session.save(p);
			session.save(userAccount);
			session.save(supplier);

			session.getTransaction().commit();
			
			// commit();
		} catch (HibernateException e) {

			rollback();
			throw new Exception("Could not....supp!");
		}
		finally
		{
			session.close();
		}

	}

	public void addCategoryToDb(PaintingCategory pc) throws Exception {
		Session session = getSession();
		try {

			// begin();
			
			session.beginTransaction();

			session.save(pc);

			session.getTransaction().commit();

			// commit();
		} catch (HibernateException e) {

			rollback();
			throw new Exception("Could not....supp!");
		}
		finally
		{
			session.close();
		}

	}

}
