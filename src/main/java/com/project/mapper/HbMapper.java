package com.project.mapper;

import java.util.ArrayList;

import com.project.entity.Health;
import com.project.entity.Users;

public interface HbMapper {

	Users login(Users vo);

	ArrayList<Health> care(String id);

}
