package com.sys.warehouse.service.impl;

import com.sys.warehouse.common.utils.CryptoUtils;
import com.sys.warehouse.dao.UserRepository;
import com.sys.warehouse.dto.User;
import com.sys.warehouse.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements IUserService {

    @Autowired
    private UserRepository userRepository;

    @Override
    public Integer login(User user) {
        User uInfo = userRepository.findByUsername(user.getUsername());
        if(uInfo == null) return null;
        if(!BCrypt.checkpw(user.getPassword(), uInfo.getPassword())) return null;
        return uInfo.getId();
    }
}
