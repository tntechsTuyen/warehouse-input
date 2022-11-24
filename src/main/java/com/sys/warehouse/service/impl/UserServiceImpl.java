package com.sys.warehouse.service.impl;

import com.sys.warehouse.common.utils.CryptoUtils;
import com.sys.warehouse.dao.UserRepository;
import com.sys.warehouse.dto.User;
import com.sys.warehouse.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements IUserService {

    @Autowired
    private UserRepository userRepository;

    @Override
    public Integer login(User user) {
        User uInfo = userRepository.findByUsername(user.getUsername());
        System.out.println("DATA___________: "+uInfo.getPassword());
        if(uInfo == null) return null;
        String passEncode = CryptoUtils.BCrypt(user.getPassword());
        if(!uInfo.getPassword().equals(passEncode)) return null;
        return uInfo.getId();
    }
}
