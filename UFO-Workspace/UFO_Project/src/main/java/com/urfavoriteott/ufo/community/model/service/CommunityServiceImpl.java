package com.urfavoriteott.ufo.community.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.urfavoriteott.ufo.community.model.dao.CommunityDao;

@Service
public class CommunityServiceImpl implements CommunityService {

    @Autowired
    private SqlSessionTemplate sqlSession;

    @Autowired
    private CommunityDao communityDao;
}