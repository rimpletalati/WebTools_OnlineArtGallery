package com.neu.edu.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;

import com.neu.edu.model.Customer;
import com.neu.edu.model.UserAccount;

public class UserDao extends DAO{

	public void addCustomerToDb(UserAccount userAccount) throws Exception
	{
		Session session = getSession();
	        try {
	            
	            session.beginTransaction();
	            
	            Customer customer = (Customer)userAccount.getPerson();
	            
	            session.save(customer);
	            session.save(userAccount);
	            
	            session.getTransaction().commit();
	            
	            
//	            commit();
	        } catch (HibernateException e) {
	        	
	            rollback();
	            throw new Exception("Could not....zvzx!");
	        }
	        
	        finally{
				session.close();
			}
		}
	
	
	public UserAccount queryUserByNameAndPassword(String name, String password)
            throws Exception {
		
		Session session = getSession();
        try {
        	
            Query q = session.createQuery("from UserAccount where username = :username and password = :password");
            q.setString("username", name);
            q.setString("password", password);
            UserAccount userAccount = (UserAccount) q.uniqueResult();
       //     commit();
            
            return userAccount;
        } catch (HibernateException e) {
     //       rollback();
            throw new Exception("Could not get user " + name, e);
        }
        
        finally{
			session.close();
		}
    }
	
	public boolean checkUserName(String userName){
		Session session = getSession();
		Query q = session.createQuery("from UserAccount where username = :username");
		q.setString("username", userName);
		UserAccount ua = (UserAccount)q.uniqueResult();
		session.close();
		return(ua!=null);
	}
	
public boolean queryByPassword(String userName, String pwd){
		
		Query q = getSession().createQuery("from UserAccount where username= :username and password = :password");
        q.setString("username", userName);
        q.setString("password", pwd);
        
        List list = q.list();
        if(list.size()==1){
        	return true;
        }else{
        	return false;
        }
	}
	
	public String updatePassword(long id, String newpassword){
		Session session = getSession();
		session.beginTransaction();
		Query q = session.createQuery("update UserAccount set password = :newpwd where userID = :id");
		q.setString("newpwd", newpassword);
		q.setLong("id", id);
		int i = q.executeUpdate();
		session.getTransaction().commit();
		session.close();
		return "passwordSuccessful";
	}
	
}
