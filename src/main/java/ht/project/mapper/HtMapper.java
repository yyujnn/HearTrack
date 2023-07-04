package ht.project.mapper;

import java.util.ArrayList;

import ht.project.entity.Community;
import ht.project.entity.Health;
import ht.project.entity.User;

public interface HtMapper {

	User login(User vo);

	ArrayList<Health> care(String id);

	ArrayList<User> getUserList();

	ArrayList<Community> userCom(String id);

}

