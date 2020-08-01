package com.javatmp.demo.quartz.advance;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Created by david on 2015-01-20.
 */
public class SampleJob implements Job {

    @Override
    public void execute(JobExecutionContext jobExecutionContext) {
        hello();
    }

    private static final Logger LOG = LoggerFactory.getLogger(SampleJob.class);

    public void hello() {
        LOG.info("Hello World!");
    }
}
