
package com.neu.edu.dao;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;

import com.neu.edu.model.Painting;
import com.neu.edu.model.PaintingCategory;

public class ProductDao extends DAO
{
	public Painting getSelectedProduct(long paintingId) throws Exception
	{
		Session session = getSession();
		try 
		{
        	
            session.beginTransaction();
            Query q = session.createQuery("from Painting where paintingId = :paintingId");
            q.setString("paintingId", String.valueOf(paintingId));
            Painting selectedProduct=(Painting)q.list().get(0);
            session.getTransaction().commit();
            return selectedProduct;
    		
         } 
		catch (HibernateException e) 
		{
        	rollback();
            throw new Exception("Could not....supp!");
        }
		
		finally
		{
			session.close();
		}
		
	}
	
public String getProductNames(String category, String productName){
		
		Session session = getSession();
		session.beginTransaction();
		Query q = session.createQuery("from PaintingCategory where name = :category");
		q.setString("category", category);
		PaintingCategory paintCat = (PaintingCategory)q.uniqueResult();
		
		String paintingCatId = String.valueOf(paintCat.getPaintingCategoryId());
		
		Query q1 = session.createQuery("from Painting where paintingCategory = :catId and name like '"+productName+"%'");
		q1.setString("catId", paintingCatId);
		List<Painting> products = q1.list();
		String suggestion = "";
		
		for(Painting paintProd : products){
			
			suggestion = suggestion + paintProd.getName() +"\r\n";
		}
		
		return suggestion;
	}
	

}
