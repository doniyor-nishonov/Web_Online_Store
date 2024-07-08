package com.pdp.web_online_store.service.picture;

import com.pdp.web_online_store.entity.picture.Picture;

import java.util.List;

public class PictureServiceImpl implements PictureService{
    @Override
    public Picture save(Picture entity) {
        return null;
    }

    @Override
    public boolean update(Picture picture) {
        return pictureDAO.update(picture);
    }

    @Override
    public boolean delete(String s) {
        return false;
    }

    @Override
    public Picture findById(String s) {
        return null;
    }

    @Override
    public List<Picture> findAll() {
        return List.of();
    }
}
