package com.indie.games.repositories;

import com.indie.games.model.User;

public interface UserRepository extends BaseRepository<User>{

    User findByEmail(String email);
    
}
