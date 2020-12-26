package com.javatmp.testing;

import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.*;

import java.util.stream.Stream;

import static org.junit.jupiter.api.Assertions.*;
import static org.junit.jupiter.api.Assumptions.*;

@Slf4j
class JUnitTest {
    @Test
        void test() {
            log.debug("*** Test Context Load 1 ***");
    }

    /**
     * <code>@BeforeAll</code> denotes that the annotated method will be executed
     * before all test methods in the current class.
     * This annotation needs to be static
     */
    @BeforeAll
    static void setup() {
        log.info("@BeforeAll - executes once before all test methods in this class");
    }

    /**
     * <code>@BeforeEach</code> denotes that the annotated method will be executed
     * before each test method
     */
    @BeforeEach
    void init() {
        log.info("@BeforeEach - executes before each test method in this class");
    }

    /**
     * <code>@DisplayName</code> defines custom display name for a test class
     * or a test method
     */
    @DisplayName("Display Name Annotation")
    @Test
    void testWithDisplayNameTest() {
        log.info("Test With custom display name using @DisplayName");
    }

    /**
     * <code>@Disable</code> it is used to disable a test class or method
     */
    @Test
    @Disabled("Not implemented yet")
    void tobeImplemented() {
        log.info("@Disabled it is used to disable a test class or method");
    }

    /**
     * <code>@AfterEach</code> denotes that the annotated method will be executed
     * after each test method
     */
    @AfterEach
    void tearDown() {
        log.info("@AfterEach executed after each test method.");
    }

    /**
     * <code>@AfterAll</code> denotes that the annotated method will be executed
     * after all test methods in the current class
     */
    @AfterAll
    static void done() {
        log.info("@AfterAll executed after all test methods.");
    }

    @Test
    void assertionTest() {
        log.info("start assertTrue assertion");
        assertTrue(Stream.of(1, 2, 3)
                .mapToInt(i -> i)
                .sum() > 5, () -> "Sum should be greater than 5");
    }

    @Test
    void groupAssertions() {
        int[] numbers = {0, 1, 2, 3, 4};
        assertAll("numbers",
                () -> assertEquals(numbers[0], 0),
                () -> assertEquals(numbers[3], 3),
                () -> assertEquals(numbers[4], 4)
        );
    }

    @Test
    void trueAssumption() {
        assumeTrue(5 > 1);
        assertEquals(5 + 2, 7);
    }

    @Test
    void falseAssumption() {
        assumeFalse(5 < 1);
        assertEquals(5 + 2, 7);
    }

    @Test
    void assumptionThat() {
        String someString = "Just a string";
        assumingThat(
                someString.equals("Just a string"),
                () -> assertEquals(2 + 2, 4)
        );
    }

    @Test
    void shouldThrowException() {
        Throwable exception = assertThrows(UnsupportedOperationException.class, () -> {
            throw new UnsupportedOperationException("Not supported");
        });
        assertEquals(exception.getMessage(), "Not supported");
    }

    @Test
    void assertThrowsException() {
        String str = null;
        assertThrows(IllegalArgumentException.class, () -> {
            Integer.valueOf(str);
        });
    }

}
