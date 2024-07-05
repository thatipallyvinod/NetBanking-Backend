package com.bankingapp.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.bankingapp.model.Applicant;

@Repository
public interface UserRepository extends JpaRepository<Applicant, Long> {

}
