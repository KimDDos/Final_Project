package com.four.www.config;


import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

@EnableTransactionManagement
@Configuration
@MapperScan(basePackages= {"com.four.www.repository", "com.four.www.user.repository"})
@ComponentScan(basePackages= {"com.four.www.service", "com.four.www.user.service"})
public class RootConfig {
	
	@Autowired
	ApplicationContext applicationContext;
	
	@Bean
	public DataSource dataSource() {
		HikariConfig hikariConfig = new HikariConfig();
		
		hikariConfig.setDriverClassName("net.sf.log4jdbc.sql.jdbcapi.DriverSpy");
<<<<<<< HEAD
		hikariConfig.setJdbcUrl("jdbc:log4jdbc:mysql://175.196.223.181:3306/four");
		hikariConfig.setUsername("root");
		hikariConfig.setPassword("1234");
		hikariConfig.setJdbcUrl("jdbc:log4jdbc:mysql://localhost:3306/four");      
		hikariConfig.setUsername("root");
		hikariConfig.setPassword("1234");
=======
		hikariConfig.setJdbcUrl("jdbc:log4jdbc:mysql://localhost:3306/root");      
		hikariConfig.setUsername("root");
		hikariConfig.setPassword("mysql");
>>>>>>> origin/KJH
		
		/*  24.02.07 而� �걚怨좎��꽌 �븞 �룎�븘媛� �뀑�뀑�뀑�뀑�뀑�뀑�뀑�뀑�뀑�뀑
			hikariConfig.setJdbcUrl("jdbc:log4jdbc:mysql://175.196.223.181:3306/final_project");
			hikariConfig.setUsername("four");
			hikariConfig.setPassword("1234");
		 *  */
		
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
