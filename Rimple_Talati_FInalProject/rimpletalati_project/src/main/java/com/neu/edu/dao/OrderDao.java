package com.neu.edu.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;

import com.neu.edu.model.Customer;
import com.neu.edu.model.Order;
import com.neu.edu.model.OrderItem;
import com.neu.edu.model.Painting;
import com.neu.edu.model.Payment;
import com.neu.edu.model.UserAccount;

public class OrderDao extends DAO {

	public Order addProductToCart(long ProductID, int quantity,
			HttpSession hSession) throws Exception {
		Session session = getSession();
		try {
			session.beginTransaction();
			Query q = session.createQuery("from Painting where paintingId = :productID");
			q.setString("productID", String.valueOf(ProductID));
			Painting selectedProduct = (Painting) q.uniqueResult();
			OrderItem orderItem = new OrderItem();
			orderItem.setPainting(selectedProduct);
			orderItem.setQuantity(quantity);
			orderItem.setTotalCost(selectedProduct.getPrice()*quantity);
			UserAccount user = (UserAccount) hSession.getAttribute("user");
			Customer customer = (Customer) user.getPerson();
			String personId = String.valueOf(customer.getPersonID());
			Query q1 = session.createQuery("from Order where personID = :personId");
			q1.setString("personId", personId);
			List<Order> orders = q1.list();
			boolean b = true;
			for (Order o : orders) {
				if (o.getOrderStatus().equals("current")) {
					for(OrderItem oi:o.getOrderItem()){
						if(oi.getPainting().equals(selectedProduct)){
							int newQuantity = orderItem.getQuantity() + quantity;
							if(newQuantity>1)
							{
//								o.setOrderTotal(orderItem.getTotalCost());
//								session.save(o);
//								session.getTransaction().commit();
								return o;
							}
							orderItem.setQuantity(newQuantity);
							session.save(orderItem);
							o.setOrderTotal(orderItem.getTotalCost());
							session.save(o);
							session.getTransaction().commit();
						
							session.close();
							b = false;
							return o;
						}
					}
					o.getOrderItem().add(orderItem);
					orderItem.setOrder(o);
					
					o.setOrderTotal(orderItem.getTotalCost());
					session.save(orderItem);
					session.save(o);
					// session.save(customer);
					session.getTransaction().commit();
					session.close();
					b = false;
					return o;
				}
			}
			if (b) {
				Order placedOrder = new Order();
				placedOrder.getOrderItem().add(orderItem);
				placedOrder.setOrderStatus("current");
				placedOrder.setCustomer(customer);
				placedOrder.setOrderTotal(orderItem.getTotalCost());
				session.save(placedOrder);
				customer.getOrder().add(placedOrder);
				session.save(customer);
				orderItem.setOrder(placedOrder);
				session.save(orderItem);
//				session.save(placedOrder);
				session.getTransaction().commit();
				session.close();
				return placedOrder;
			}
			// session.save(customer);
			// session.save(orders);
			return null;
		} catch (HibernateException e) {
			// rollback();
			throw new Exception("Problem getting contacts!", e);
		} /*finally {
			session.close();
		}*/
	}

	public Order deleteOrderItem(long orderItemID, long orderID)
			throws Exception {
		Session session = getSession();
		try {
			session.beginTransaction();
			Query q1 = session.createQuery("from Order where orderId=:orderID");
			q1.setString("orderID", String.valueOf(orderID));
			Order dbOrder = (Order) q1.uniqueResult();
			Query q2 = session
					.createQuery("from OrderItem where orderItemId = :orderItemID");
			q2.setString("orderItemID", String.valueOf(orderItemID));
			OrderItem dbOrderItem = (OrderItem) q2.uniqueResult();

			dbOrderItem.setQuantity(0);
			session.save(dbOrderItem);
			dbOrder.getOrderItem().remove(dbOrderItem);
			dbOrder.setOrderTotal(-1*dbOrderItem.getTotalCost());
			session.save(dbOrder);
			Query q = session
					.createQuery("delete OrderItem where orderItemId = :orderItemID");
			q.setString("orderItemID", String.valueOf(orderItemID));
			q.executeUpdate();

			session.getTransaction().commit();
			session.close();
			return dbOrder;
		}

		catch (HibernateException e) {
			// rollback();
			throw new Exception("Problem getting contacts!", e);
		} /*finally {
			session.close();
		}*/
	}
	
	public void makePayment(Payment payment, String orderId)
	{
		Session session = getSession();
		session.beginTransaction();
		Query q = session.createQuery("from Order where orderId = :orderId");
		q.setString("orderId", orderId);
		Order order = (Order)q.uniqueResult();
		order.setOrderStatus("paid");
		payment.setOrder(order);
		order.setPayment(payment);
		for(OrderItem oi : order.getOrderItem())
		{
			int oldQuantity = oi.getPainting().getQuantity();
			int newQuantity = oldQuantity - oi.getQuantity();
			oi.getPainting().setQuantity(newQuantity);
		}
		session.save(order);
		session.save(payment);
		session.getTransaction().commit();
		session.close();
	}
	
	public String checkForQuantity(String orderId){
		Session session = getSession();
		session.beginTransaction();
		Query q = session.createQuery("from Order where orderId = :orderId");
		q.setString("orderId", orderId);
		Order order = (Order)q.uniqueResult();
		
		String result = " ";
		
		for(OrderItem oi : order.getOrderItem()){
			if(oi.getQuantity()>oi.getPainting().getQuantity()){
				result = result + oi.getPainting().getName();
			}
		}
		if(result.equals(" ")){
			return "true";
		}else{
			return result;
		}
	}
	
	public boolean checkOrderForPayment(String orderId)
	{
		Session session = getSession();
		session.beginTransaction();
		Query q = session.createQuery("from Order where orderId = :orderId");
		q.setString("orderId", orderId);
		Order order = (Order)q.uniqueResult();
		if(order.getOrderStatus().equals("current")){
			return true;
		}else{
			return false;
		}
		
	}
	
	public Order getOrderObj(String orderID)
	{
		Session session = getSession();
		session.beginTransaction();

		 Query q1 = session.createQuery("from Order where orderId=:orderID");
		 q1.setString("orderID", orderID);
		 Order orderObj = (Order)q1.uniqueResult();
		 return orderObj;
		 
	}
	
	public Payment getPaymentObj(String paymentID) 
	{
		Session session = getSession();
		session.beginTransaction();

		 Query q1 = session.createQuery("from Payment where paymentId=:orderID");
		 q1.setString("orderID", paymentID);
		 Payment paymentObj = (Payment)q1.uniqueResult();
		 
		 return paymentObj;
		 
	}
	
public Order getCartItem(String personId){
		
		Session session = getSession();
		session.beginTransaction();
		Query q1 = session.createQuery("from Order where customer =:personID and orderStatus = :orderStatus");
		q1.setString("personID", personId);
		q1.setString("orderStatus", "current");
		Order orderObj = (Order)q1.uniqueResult();
		
		session.getTransaction().commit();
		session.close();
		return orderObj;
		
	}
}
