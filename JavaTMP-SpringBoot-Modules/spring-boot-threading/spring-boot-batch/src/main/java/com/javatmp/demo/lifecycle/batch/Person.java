package com.javatmp.demo.batch;

import lombok.*;

@NoArgsConstructor
@AllArgsConstructor
@Builder
@Data
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
public class Person {

	@EqualsAndHashCode.Include
	private String lastName;
	@EqualsAndHashCode.Include
	private String firstName;

}
