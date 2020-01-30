package com.javatmp.fw.config;

import com.javatmp.fw.util.MD5Util;
import com.javatmp.fw.web.handler.CustomAuthenticationEntryPoint;
import com.javatmp.fw.web.handler.CustomAuthenticationFailureHandler;
import com.javatmp.fw.web.handler.CustomAuthenticationSuccessHandler;
import com.javatmp.fw.web.handler.CustomLogoutSuccessHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.PasswordEncoder;

/**
 *
 * @author JavaTMP
 */
@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    private UserDetailsService customUserDetailsService;

    @Autowired
    CustomAuthenticationSuccessHandler customAuthenticationSuccessHandler;

    @Autowired
    CustomAuthenticationFailureHandler customAuthenticationFailureHandler;

    @Autowired
    CustomLogoutSuccessHandler customLogoutSuccessHandler;

    @Autowired
    CustomAuthenticationEntryPoint customAuthenticationEntryPoint;

//    @Autowired
//    LocalizationFilter localizationFilter;
    @Bean
    public PasswordEncoder passwordEncoder() {
        return new PasswordEncoder() {
            @Override
            public String encode(CharSequence cs) {
                return MD5Util.convertToMD5(cs.toString());
            }

            @Override
            public boolean matches(CharSequence cs, String string) {
                return MD5Util.convertToMD5(cs.toString()).equals(string);
            }
        };
    }

    @Bean
    @Override
    public AuthenticationManager authenticationManagerBean() throws Exception {
        return super.authenticationManagerBean();
    }

    @Autowired
    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(customUserDetailsService).passwordEncoder(passwordEncoder());
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        // Disable CSRF (cross site request forgery)
        http.csrf().disable().cors();
//        http.authorizeRequests().anyRequest().permitAll();

        http.authorizeRequests().antMatchers(
                "/assets/**", "/login**", "/logout", "/user/register", "/CaptchaImageController",
                "/pages/system/register", "/login-processing", "/error").permitAll()
                .anyRequest().authenticated()
                //                .anyRequest().hasAnyRole("ANONYMOUS, USER")
                .and().formLogin()
                //        http.authorizeRequests().anyRequest().authenticated()
                //                .and().formLogin()
                .loginPage("/login")
                .loginProcessingUrl("/login-processing")
                .usernameParameter("userName")
                .passwordParameter("password")
                .successHandler(customAuthenticationSuccessHandler)
                .failureHandler(customAuthenticationFailureHandler)
                .and().logout().logoutUrl("/logout")
                .logoutSuccessHandler(customLogoutSuccessHandler)
                .logoutSuccessUrl("/");

        http.exceptionHandling()
                .authenticationEntryPoint(customAuthenticationEntryPoint) //                .accessDeniedHandler(new AccessDeniedHandler() {
                //                    @Override
                //                    public void handle(HttpServletRequest hsr, HttpServletResponse hsr1, AccessDeniedException ade) throws IOException, ServletException {
                //                        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
                //                    }
                //                })
                ;

//        http.addFilterBefore(localizationFilter, UsernamePasswordAuthenticationFilter.class);
//
//        http
//                //                .headers()
//                //                .frameOptions().sameOrigin()
//                //                .and()
//                .csrf().disable()
//                .authorizeRequests()
//                .antMatchers("/**")
//                .permitAll();
    }

    @Override
    public void configure(WebSecurity web) throws Exception {
//        super.configure(web);
//        web.ignoring().antMatchers("/assets/**", "/login**", "/logout",
//                "/user/register", "/CaptchaImageController", "/pages/system/register", "/login-processing", "/error");
//        web.ignoring().antMatchers("/**");
    }

}
