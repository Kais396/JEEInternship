package jdbc;

import java.time.LocalTime;
import java.util.Date;

public class UserBean {
	private int id ; 
    private String username;
    private String password;
    private String firstName;
    private String lastName;
    private String email ;
    private String company ;
    private String dept ; 
	private String address ; 
    private String city ;
    private String country ;
    private int postal_code ;
    private long currentDate ;
    private long LogoutDate ; 
    
    
    public long getLogoutDate() {
		return LogoutDate;
	}

	public void setLogoutDate(long logoutDate) {
		LogoutDate = logoutDate;
	}

	public long getCurrentDate() {
		return currentDate;
	}

	public void setCurrentDate(long tempsDebut) {
		this.currentDate = tempsDebut;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

    
    public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public int getPostal_code() {
		return postal_code;
	}

	public void setPostal_code(int postal_code) {
		this.postal_code = postal_code;
	}

	public boolean valid;
	
	
    public String getFirstName() {
       return firstName;
	}

    public void setFirstName(String newFirstName) {
       firstName = newFirstName;
	}

	
    public String getLastName() {
       return lastName;
			}

    public void setLastName(String newLastName) {
       lastName = newLastName;
			}
			

    public String getPassword() {
       return password;
	}

    public void setPassword(String newPassword) {
       password = newPassword;
	}
	
			
    public String getUsername() {
       return username;
			}

    public void setUserName(String newUsername) {
       username = newUsername;
			}

				
    public boolean isValid() {
       return valid;
	}

    public void setValid(boolean newValid) {
       valid = newValid;
	}
    public String getDept() {
		return dept;
	}

	public void setDept(String dept) {
		this.dept = dept;
	}

	@Override
	public String toString() {
		return "UserBean [id=" + id + ", username=" + username + ", password=" + password + ", firstName=" + firstName
				+ ", lastName=" + lastName + ", email=" + email + ", company=" + company + ", dept=" + dept
				+ ", address=" + address + ", city=" + city + ", country=" + country + ", postal_code=" + postal_code
				+ ", valid=" + valid + "]";
	}

}