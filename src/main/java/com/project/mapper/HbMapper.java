package com.project.mapper;

import java.util.ArrayList;

import com.project.entity.Community;
import com.project.entity.Health;
import com.project.entity.Users;

public interface HbMapper {

	Users login(Users vo);

	ArrayList<Health> care(String id);

	ArrayList<Users> getUserList();

	ArrayList<Community> userCom(String id);

}

