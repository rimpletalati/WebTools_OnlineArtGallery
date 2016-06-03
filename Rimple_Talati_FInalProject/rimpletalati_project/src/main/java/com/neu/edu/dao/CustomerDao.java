package com.neu.edu.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import com.neu.edu.model.Order;
import com.neu.edu.model.Painting;
import com.neu.edu.model.PaintingCategory;



public class CustomerDao extends DAO
{
	
	public List getProduct(String category,String product) throws Exception
	{
		Session session = getSession();
		try 
		{
            session.beginTransaction();
            Query q = session.createQuery("from PaintingCategory where name = :categoryname");
            q.setString("categoryname", category);
            
            PaintingCategory dbCategory=(PaintingCategory)q.list().get(0);
            long categoryId=dbCategory.getPaintingCategoryId();
            
            Query q1=session.createQuery("from Painting where paintingCategory =:categoryId and name= :product ");
            q1.setString("categoryId", String.valueOf(categoryId));
            q1.setString("product",product);
            List<Painting> productList=new ArrayList<Painting>();
            productList=q1.list();
            session.getTransaction().commit();
            return productList;
            
         }
         catch (HibernateException e) 
		  {
        	
            rollback();
            throw new Exception(e);
          }
		
		finally
		{
			session.close();
		}

     }
	
	public List getProductList(String category) throws Exception
	{
		Session session = getSession();
		try 
		{
			
            session.beginTransaction();
            Query q = session.createQuery("from PaintingCategory where name = :categoryname");
            q.setString("categoryname", category);
            
            PaintingCategory dbCategory=(PaintingCategory)q.list().get(0);
            long categoryId=dbCategory.getPaintingCategoryId();
            
            Query q1=session.createQuery("from Painting where PaintingCategory_ID =:categoryId and quantity >:limit ");
            q1.setString("categoryId", String.valueOf(categoryId));
            q1.setString("limit", "0");
            List<Painting> productList=new ArrayList<Painting>();
            productList=q1.list();
            return productList;
		}
		
		catch (HibernateException e) 
		  {
      	
          rollback();
          throw new Exception(e);
         }
		
		finally
		{
			session.close();
		}
		
    }
	
	public List<Painting> quickSearch(String paintingName, float priceFrom, float priceTo, String artistName)
			throws Exception {
		Session session=null;
		try {
			// begin();
			session = getSession();
			session.beginTransaction();
			long categoryId=0;
			
//				Query q = session.createQuery("from PaintingCategory where name = :name");
//				q.setString("name", category);
//				PaintingCategory dbCategory = (PaintingCategory) q.list().get(0);
//				categoryId = dbCategory.getPaintingCategoryId();
			
//				Criteria cr = session.createCriteria(Chocolate.class);
//				cr.add(Restrictions.like("companyName", companyName + "%"));
//				cr.add(Restrictions.like("category", category + "%"));
				Criteria cr;
				if (paintingName.equals("")
						&& priceFrom == 0 && priceTo == 0
						&& artistName.equals("")) {
					cr = session.createCriteria(Painting.class);
					cr.add(Restrictions.gt("quantity", 0));
				} else {
					cr = session.createCriteria(Painting.class);
					cr.add(Restrictions.gt("quantity", 0));
					if (paintingName != "") {
						cr.add(Restrictions.like("name", paintingName
								+ "%"));
					}
//					if (category != "") {
//						cr.add(Restrictions.like("category", categoryId));
//					}
					if (artistName != "") {
						cr.add(Restrictions.like("artistName", artistName
								+ "%"));
					}
					if (priceFrom == 0 && priceTo == 0) {
						cr.add(Restrictions.gt("price", priceFrom));
					}
					if (priceFrom == 0 && priceTo != 0) {
						cr.add(Restrictions
								.between("price", priceFrom, priceTo+1));
					}
					if(priceFrom != 0 && priceTo != 0){
						cr.add(Restrictions
								.between("price", priceFrom-1, priceTo+1));
					}
					
				}
			
			session.getTransaction().commit();
			List<Painting> paintingList = cr.list();
			System.out.println("erdswfe");
			return paintingList;
		} catch (HibernateException e) {
			// rollback();
			throw new Exception("Problem getting contacts!", e);
		}
		finally {
			session.close();
		}
	}
	
	public List<String> getArtistList() throws Exception {
		Session session=null;
		try{
		session = getSession();
		session.beginTransaction();
		Query q = session.createQuery("select distinct artistName from Painting");
		session.getTransaction().commit();
		return q.list();
		}
		catch (HibernateException e) {
			rollback();
			throw new Exception(e);
		}
		finally {
			session.close();
		}
	}
	
	public List getCustomerOrderHistory(String customerID) throws Exception
	{
		Session session = getSession();
		try 
		{
        	session.beginTransaction();
            Query q = session.createQuery("from Order where customer =:customerID");
            q.setString("customerID", customerID);
            List<Order>orderList=q.list();
            session.getTransaction().commit();
            return orderList;
		}
			catch (HibernateException e) 
			{
	
				rollback();
				throw new Exception(e);
			}

		finally 
		{
			session.close();
		}
}
}
