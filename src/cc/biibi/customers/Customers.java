package cc.biibi.customers;

public class Customers {

	private int id;
	private String name;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Customers(int id, String name) {
		super();
		this.id = id;
		this.name = name;
	}
	public Customers() {
		
	}
	
	
}
