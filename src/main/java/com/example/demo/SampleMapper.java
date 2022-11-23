package com.example.demo;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface SampleMapper {

    @Select("SELECT message FROM sample_table LIMIT 1")
    String selectMessage();

}