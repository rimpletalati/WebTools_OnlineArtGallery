package com.neu.edu.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;

import com.neu.edu.model.Painting;
import com.neu.edu.model.PaintingCategory;


public class SupplierDao extends DAO{
	
	public List<PaintingCategory> getListOfCategory() throws Exception{

		Session session = getSession();
		try {
        	
            session.beginTransaction();
            
            Query q = session.createQuery("from PaintingCategory");
            
            List<PaintingCategory> paintingCategory = new ArrayList<PaintingCategory>();
            paintingCategory=q.list();
            
            
            session.getTransaction().commit();
            //session.close();
    		return paintingCategory;
            
//            commit();
        } catch (HibernateException e) {
        	
            rollback();
            throw new Exception("Could not....supp!");
        }
		finally
		{
			session.close();
		}

	}
	
	

	public void addPaintingToDb(String selectedCategory, String name, Float price, String desc, int quantity, String path, String artistName) throws Exception{
		
		 Session session = getSession();
		try {
        	
//        	begin();
            
            session.beginTransaction();
            
            Query q = session.createQuery("from PaintingCategory where name = :categoryName");
            q.setString("categoryName", selectedCategory);
            PaintingCategory pc = (PaintingCategory)q.list().get(0);
            
            Painting painting = new Painting();


            painting.setName(name);
            painting.setPrice(price);
            painting.setDescription(desc);
            painting.setPath(path);
            painting.setQuantity(quantity);
            painting.setArtistName(artistName);
    		//set fileuploadPath//

            
            painting.setPaintingCategory(pc);
            
            session.save(painting);
            
            session.getTransaction().commit();
            
//            commit();
        } catch (HibernateException e) {
        	
            rollback();
            throw new Exception(e);
        }
		finally{
			session.close();
		}

	}
	
}
