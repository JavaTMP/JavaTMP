package com.javatmp.demo.jpa;

import com.javatmp.demo.jpa.entity.primary.PrimaryMultiTable;
import com.javatmp.demo.jpa.entity.second.SecondMultiTable;
import com.javatmp.demo.jpa.repository.primary.PrimaryMultiTableRepository;
import com.javatmp.demo.jpa.repository.second.SecondMultiTableRepository;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
@Slf4j
public class SpringBootDemoMultiDatasourceJpaApplicationTests {
    @Autowired
    private PrimaryMultiTableRepository primaryRepo;
    @Autowired
    private SecondMultiTableRepository secondRepo;


    @Test
    public void testInsert() {
        PrimaryMultiTable primary = new PrimaryMultiTable(1L, "测试名称-1");
        primaryRepo.save(primary);

        SecondMultiTable second = new SecondMultiTable();
        BeanUtils.copyProperties(primary, second);
        secondRepo.save(second);
    }

    @Test
    public void testUpdate() {
        primaryRepo.findAll().forEach(primary -> {
            primary.setName("修改后的" + primary.getName());
            primaryRepo.save(primary);

            SecondMultiTable second = new SecondMultiTable();
            BeanUtils.copyProperties(primary, second);
            secondRepo.save(second);
        });
    }

    @Test
    public void testDelete() {
        primaryRepo.deleteAll();

        secondRepo.deleteAll();
    }

    @Test
    public void testSelect() {
        List<PrimaryMultiTable> primary = primaryRepo.findAll();
        log.info("【primary】= {}", primary);

        List<SecondMultiTable> second = secondRepo.findAll();
        log.info("【second】= {}", second);
    }

}

