package com.example.demo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.apache.ibatis.annotations.Select;
import com.example.demo.SampleMapper;

@RestController
public class SampleController {

    @Autowired
	private SampleMapper sampleMapper;

	@GetMapping("/")
	public String home() {
		return sampleMapper.selectMessage();
	}

}