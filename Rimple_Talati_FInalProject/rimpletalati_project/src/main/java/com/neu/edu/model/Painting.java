package com.neu.edu.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="Painting")
public class Painting implements Serializable{

		/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

		@Id
		@GeneratedValue(strategy=GenerationType.IDENTITY)
		@Column(name="Painting_Id", unique=true, nullable=false)
		private int paintingId;
		
		@Column(name="Painting_Name", nullable=false, length=100)
		private String name;
		
		@ManyToOne(fetch=FetchType.LAZY, cascade=CascadeType.ALL)
		@JoinColumn(name="PaintingCategory_ID", nullable=true)
		private PaintingCategory paintingCategory;
		
		@Column(name="Price", nullable=false, length=100)
		private float price;
		
		@Column(name="Quantity", nullable=false, length=100)
		private int quantity;
		
		@Column(name="Description", nullable=false, length=100)
		private String description;
		
		@Column(name="Path", nullable=false, length=100)
		private String path;

		@Column(name="Artist_Name", nullable=false, length=100)
		private String artistName;
		
//		@ManyToMany(fetch=FetchType.LAZY, cascade=CascadeType.ALL, mappedBy="product")
//		private List<Supplier> supplier = new ArrayList<Supplier>();
		
		public String getPath() {
			return path;
		}

		public void setPath(String path) {
			this.path = path;
		}

		public String getDescription() {
			return description;
		}

		public void setDescription(String description) {
			this.description = description;
		}

		@OneToMany(fetch=FetchType.LAZY, mappedBy="painting", cascade=CascadeType.ALL)
		private List<OrderItem> orderItem = new ArrayList<OrderItem>();

		
		public int getPaintingId() {
			return paintingId;
		}

		public void setPaintingId(int paintingId) {
			this.paintingId = paintingId;
		}
		
		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

		
		public PaintingCategory getPaintingCategory() {
			return paintingCategory;
		}

		public void setPaintingCategory(PaintingCategory paintingCategory) {
			this.paintingCategory = paintingCategory;
		}

		public float getPrice() {
			return price;
		}

		public void setPrice(float price) {
			this.price = price;
		}

		public int getQuantity() {
			return quantity;
		}

		public void setQuantity(int quantity) {
			this.quantity = quantity;
		}

		public List<OrderItem> getOrderItem() {
			return orderItem;
		}

		public void setOrderItem(List<OrderItem> orderItem) {
			this.orderItem = orderItem;
		}

		public String getArtistName() {
			return artistName;
		}

		public void setArtistName(String artistName) {
			this.artistName = artistName;
		}		
		
		
}
