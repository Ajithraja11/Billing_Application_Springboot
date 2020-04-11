package com.example.demo.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.demo.entity.Interior;

@Repository
public interface InteriorBillDao extends JpaRepository<Interior,Integer>{

}
