package com.pdp.web_online_store.service.picture;

import com.pdp.web_online_store.entity.picture.Picture;

import java.util.List;

public class PictureServiceImpl implements PictureService {
    @Override
    public Picture save(Picture picture) {
        return pictureDAO.save(picture);
    }

    @Override
    public boolean update(Picture picture) {
        return pictureDAO.update(picture);
    }

    @Override
    public boolean delete(String ID) {
        return pictureDAO.deleteById(ID);
    }

    @Override
    public Picture findById(String ID) {
        return pictureDAO.findById(ID);
    }

    @Override
    public List<Picture> findAll() {
        return pictureDAO.findAll();
    }
}
