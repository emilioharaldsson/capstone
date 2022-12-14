package com.capstone.drnkscl.security;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import com.capstone.drnkscl.dao.UserDAO;
import com.capstone.drnkscl.dao.UserRoleDAO;
import com.capstone.drnkscl.entity.User;
import com.capstone.drnkscl.entity.UserRole;

@Component
public class UserDetailsServiceImpl implements UserDetailsService {
	public static final Logger LOG = LoggerFactory.getLogger(UserDetailsServiceImpl.class);
	@Autowired
	private UserDAO userDao;
	
	@Autowired
	private UserRoleDAO userRoleDao;
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		User user = userDao.findByEmail(username);
		if (user == null) {
			throw new UsernameNotFoundException("Username '" + username + "' not found in database");
		}
		List<UserRole> userRoles = userRoleDao.findByUserId(user.getId());
		boolean accountIsEnabled = true;
		boolean accountNonExpired = true;
		boolean credentialsNonExpired = true;
		boolean accountNonLocked = true;
		// setup user roles
		Collection<? extends GrantedAuthority> springRoles = buildGrantAuthorities(userRoles);
		return new org.springframework.security.core.userdetails.User(user.getEmail(), user.getPassword(), accountIsEnabled, accountNonExpired, credentialsNonExpired, accountNonLocked, springRoles);
	}
	private Collection<? extends GrantedAuthority> buildGrantAuthorities(List<UserRole> userRoles) {
		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
		for (UserRole role : userRoles) {
			authorities.add(new SimpleGrantedAuthority(role.getRoleName()));
		}
		return authorities;
	}
}