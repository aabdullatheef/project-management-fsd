package com.project.management.fsd.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.project.management.fsd.entity.User;



@Repository
public interface UserManagerRepository extends JpaRepository<User,Long>{

}

