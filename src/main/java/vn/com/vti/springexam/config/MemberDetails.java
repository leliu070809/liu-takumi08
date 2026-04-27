package vn.com.vti.springexam.config;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import vn.com.vti.springexam.entity.Members;
public class MemberDetails implements UserDetails {

    private Members members;

    private Collection<? extends GrantedAuthority> authorities;

    public MemberDetails(Members members, Collection<? extends GrantedAuthority> authorities) {
        super();
        this.members = members;
        this.authorities = authorities;
    }

    public Members getMember() {
        return members;
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return authorities;
    }

    @Override
    public String getPassword() {
        return members.getPassword();
    }

    @Override
    public String getUsername() {
        return members.getUsername();
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }
}