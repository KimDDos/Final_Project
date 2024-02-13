package com.four.www.config;


import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

@EnableTransactionManagement
@Configuration
@MapperScan(basePackages= {"com.four.www.repository","com.four.www.user.repository","com.four.www.main.repository","com.four.www.reservation.repository"})
@ComponentScan(basePackages= {"com.four.www.service","com.four.www.user.service", "com.four.www.user.oauth","com.four.www.main.service","com.four.www.reservation.service"})
@PropertySource("classpath:application-mysql.properties")
public class RootConfig {
	
	@Value("${jdbc.url}")
	private String jdbc;
	
	@Value("${jdbc.username}")
	private String username;
	
	@Value("${jdbc.password}")
	private String password;
	
	@Autowired
	ApplicationContext applicationContext;
	
	@Bean
	public DataSource dataSource() {
		HikariConfig hikariConfig = new HikariConfig(); 
		
		hikariConfig.setDriverClassName("net.sf.log4jdbc.sql.jdbcapi.DriverSpy");
		hikariConfig.setJdbcUrl(jdbc);
		hikariConfig.setUsername(username);
		hikariConfig.setPassword(password);
		
		hikariConfig.setMaximumPoolSize(5);
		hikariConfig.setMinimumIdle(5);
		
		hikariConfig.setConnectionTestQuery("SELECT now()");
		hikariConfig.setPoolName("springHikariCP");
		
		hikariConfig.addDataSourceProperty("dataSource.cachePrepStmts", "true");
		
		hikariConfig.addDataSourceProperty("dataSource.prepStmtCacheSize", "250");
		
		hikariConfig.addDataSourceProperty("dataSource.prepStmtCacheSqlLimit", "true");
		
		hikariConfig.addDataSourceProperty("dataSource.useServerPrepStmts", "true");
		
		HikariDataSource hikariDataSource = new HikariDataSource(hikariConfig);
		
		return hikariDataSource;
		
	}
	
	@Bean
	public SqlSessionFactory sqlSessionFactory() throws Exception{
		SqlSessionFactoryBean sqlFactoryBean = new SqlSessionFactoryBean();
		sqlFactoryBean.setDataSource(dataSource());
		sqlFactoryBean.setMapperLocations(
				applicationContext.getResources("classpath:/mappers/*.xml")
				);
		
		sqlFactoryBean.setConfigLocation(
				applicationContext.getResource("classpath:/MybatisConfig.xml")
				);
		return sqlFactoryBean.getObject();
	}
	
	@Bean
	public DataSourceTransactionManager transactionManager() {
		return new DataSourceTransactionManager(dataSource());
	}

}
