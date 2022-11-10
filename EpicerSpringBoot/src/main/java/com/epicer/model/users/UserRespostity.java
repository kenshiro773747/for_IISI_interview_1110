package com.epicer.model.users;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.hibernate.Session;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;




@Repository
public interface UserRespostity extends JpaRepository<EpicerUser, Integer> {
    //save(user); 
	//For Register :public User InsertCilent(User user); >
	
	//For Login :public User checkAccount(String account) >
	@Query(value="from EpicerUser where account =?1")
	public EpicerUser checkAccount(String account);
	
	@Query(value="from EpicerUser where account =?1")
	public Optional<EpicerUser> checkAccount2(String account);
	
	
//	@Query(value="from User where account =?1")
//	public Optional<User> checkAccountGetUser(String account);
	
	//For LoginDate j: public User updateDate(User user)  > save(User);

	@Query(value="from EpicerUser where status =?1")
	public List<EpicerUser> checkStatus(int status);
	
	@Query(value="from User where userid =?1")
	public User findUser(int userid);
	
	
	public EpicerUser findByAccountAndPassword(String account,String password);	
	
	
	@Query(value="from EpicerUser where gender =?1")
	public List<EpicerUser> findByGender(Integer gender);
	
	
	@Query(value="from Comment where senderid=?1")
	public List<Comment> findBySenderId(Integer senderid);	
}
