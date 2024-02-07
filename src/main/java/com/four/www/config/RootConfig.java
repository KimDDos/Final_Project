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
		hikariConfig.setJdbcUrl("jdbc:log4jdbc:mysql://localhost:3306/four");      
		hikariConfig.setUsername("root");
		hikariConfig.setPassword("ezen");
		
		/*  24.02.07 컴 끄고와서 서버 안 돌아감 ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ 일단 로컬 호스트로 진행
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
