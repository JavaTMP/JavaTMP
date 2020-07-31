package com.javatmp.demo.quartz.advance.enitiy;

import lombok.*;

import javax.persistence.*;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
@Entity
@Table(name = "scheduler_job_info")
public class SchedulerJobInfo {

    @EqualsAndHashCode.Include
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String jobName;
    private String jobGroup;
    private String jobClass;
    private String cronExpression;
    private Long repeatTime;
    private Boolean cronJob;
}
