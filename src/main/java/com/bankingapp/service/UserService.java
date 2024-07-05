package com.bankingapp.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bankingapp.model.Applicant;
import com.bankingapp.repository.UserRepository;

@Service
public class UserService {
	
	@Autowired
	private UserRepository userRepository;

	public List<Applicant> getAllUsers() {
	
		return userRepository.findAll();
	}

	public Optional<Applicant> getUserById(Long id) {
		
		return userRepository.findById(id);
	}

	public Applicant createUser(Applicant user) {
		
		return userRepository.save(user);
	}

	public void deleteUser(Long id) {
		 userRepository.deleteById(id);
		
	}
	
	

}
