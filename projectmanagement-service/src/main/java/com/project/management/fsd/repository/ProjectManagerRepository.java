package com.project.management.fsd.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.project.management.fsd.entity.Project;


@Repository
public interface ProjectManagerRepository extends JpaRepository<Project,Long>{

}

