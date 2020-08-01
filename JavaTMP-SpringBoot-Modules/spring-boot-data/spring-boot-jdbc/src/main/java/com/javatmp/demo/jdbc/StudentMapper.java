package com.javatmp.demo.jdbc;

import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class StudentMapper implements RowMapper<Student>{

	@Override
	public Student mapRow(ResultSet rs, int rowNum) throws SQLException {
		Student student = new Student();
		student.setSno(rs.getString("sno"));
		student.setName(rs.getString("sname"));
		student.setSex(rs.getString("ssex"));
		return student;
	}
}
