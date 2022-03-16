package com.demo.configurations;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.demo.services.user.AccountService;



@Configuration
@EnableWebSecurity
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {

	@Autowired
	private AccountService accountService;
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
			http.cors().and().csrf().disable();
			http.authorizeRequests()			
				.antMatchers("/admin/**").access("hasRole('ROLE_ADMIN')")
					/*
					 * .antMatchers("/user/a/**").
					 * access("hasRole('ROLE_ADMIN') or hasRole('ROLE_USER')")
					 */
				.and()
				.formLogin().loginPage("/user/account/login")
				.loginProcessingUrl("/user/account/process-login")
				.defaultSuccessUrl("/user/account/welcome")
				.failureUrl("/user/account/login?error")
				.usernameParameter("username")
				.passwordParameter("password")
				.and()
				.logout().logoutUrl("/user/account/logout")
				.logoutSuccessUrl("/")
				.and()
				.exceptionHandling().accessDeniedPage("/user/account/accessDenied")
				;
			
			
	}
	
	public void configureGlobal(AuthenticationManagerBuilder builder ) throws Exception{
		builder.userDetailsService(accountService);
		
	}
	 
	@Bean
	public BCryptPasswordEncoder encoder() {
		return new BCryptPasswordEncoder();
	}
		
}
